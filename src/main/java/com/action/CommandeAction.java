package com.action;

import com.opensymphony.xwork2.ActionSupport;
import db.ArticleStock;
import entity.ArticlesPrix;
import entity.Commandes;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.Transaction;
import java.util.Calendar;

public class CommandeAction extends ActionSupport {
    private int prix;
    private String username;
    private int codeArt;
    private int qte;
    private int telephone;
    private String adress;
    private String picArt;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getCodeArt() {
        return codeArt;
    }

    public void setCodeArt(int codeArt) {
        this.codeArt = codeArt;
    }

    public int getQte() {
        return qte;
    }

    public void setQte(int qte) {
        this.qte = qte;
    }

    public int getTelephone() {
        return telephone;
    }

    public void setTelephone(int telephone) {
        this.telephone = telephone;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }

    @Override
    public void validate() {

        // Validate the address field
        if (adress == null || adress.isEmpty()) {
            addFieldError("adress", "Address is required.");
        }

        // Validate the telephone field
        if (telephone <= 10) {
            addFieldError("telephone", "Invalid phone number.");
        }

        // Validate the quantity field
        if (qte <= 0) {
            addFieldError("qte", "Quantity must be greater than zero.");
        }
    }


    @Override
    public String execute() {
        if (hasFieldErrors()) {
            return INPUT; // Stay on the same page and display the error messages
        }

        if (adress == null || adress.isEmpty() || telephone <= 10 || qte <= 0) {
            addActionError("Please fill in all the required fields.");
            return INPUT; // Stay on the same page and display the error message
        }
        Configuration cfg = new Configuration();
        // Load Hibernate configuration from "hibernate1.cfg.xml" file
        cfg.configure("hibernate1.cfg.xml");

// Build the session factory based on the configuration
        SessionFactory sessionFactory = cfg.buildSessionFactory();

// Open a new session from the session factory
        Session session = sessionFactory.openSession();

// Create an entity manager from the session's entity manager factory
        EntityManager entityManager = session.getEntityManagerFactory().createEntityManager();

// Start a new transaction using the entity manager
        EntityTransaction transaction = entityManager.getTransaction();


        try {
            transaction.begin();

            Commandes c = new Commandes();
            c.setTelephone(telephone);
            c.setClient(username);
            c.setAdress(adress);
            c.setDateCmd(Calendar.getInstance().getTime());
            c.setQte(qte);
            c.setPicArt(getPicForCodeArt(codeArt));
            c.setCodeArt(codeArt);
            c.setPrix(1 * getPriceForCodeArt(codeArt));
            System.out.println("CodeArt: " + codeArt);

            // Retrieve the available quantity from ArticlesPrix
            int availableQuantity = getAvailableQuantityForCodeArt(codeArt);
            if (qte > availableQuantity) {
                addActionError("The quantity requested exceeds the available quantity.");
                return INPUT; // Stay on the same page and display the error message
            }


            c.setFacture(qte * getPriceForCodeArt(codeArt)); // Calculate the total price (facture) based on quantity and article price
            updateArticleStockQuantity(codeArt, qte);
            entityManager.persist(c);
            transaction.commit();

            session.close(); // Close the session after committing the transaction

            return "success";

        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            session.close(); // Don't forget to close the session
            e.printStackTrace();
            return "failure";
        }
    }
    private void updateArticleStockQuantity(int codeArt, int qte) {
        Configuration cfg = new Configuration();
        cfg.configure("hibernate.cfg.xml");
        SessionFactory sessionFactory = cfg.buildSessionFactory();
        Session session = sessionFactory.openSession();

        Transaction transaction = session.beginTransaction();

        try {
            ArticleStock articleStock = session.get(ArticleStock.class, codeArt);
            if (articleStock != null) {
                int updatedQuantity = articleStock.getQteArt() - qte;
                articleStock.setQteArt(updatedQuantity);
                session.update(articleStock);
                transaction.commit();
            } else {
                addActionError("Article stock not found for code: " + codeArt);
                transaction.rollback();
            }
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    private int getAvailableQuantityForCodeArt(int codeArt) {
        Configuration cfg = new Configuration();
        cfg.configure("hibernate.cfg.xml");
        SessionFactory sessionFactory = cfg.buildSessionFactory();

        Session session = sessionFactory.openSession();

        ArticleStock article = session.get(ArticleStock.class, codeArt);
        if (article != null) {
            return article.getQteArt();
        } else {
            session.close();
            return 0;
        }
    }


    private int getPriceForCodeArt(int codeArt) {
        // Retrieve the price for the given codeArt   from the database
        Configuration cfg = new Configuration();
        cfg.configure("hibernate1.cfg.xml");
        SessionFactory sessionFactory = cfg.buildSessionFactory();

        Session session = sessionFactory.openSession();

        ArticlesPrix article = session.get(ArticlesPrix.class, codeArt);
        if (article != null) {

            return article.getPrixArt();
        } else {
            session.close();
            return 0;
            // Return 0 if the article price is not found
        }
    }

    private String getPicForCodeArt(int codeArt) {
        // Retrieve the price for the given codeArt   from the database
        Configuration cfg = new Configuration();
        cfg.configure("hibernate1.cfg.xml");
        SessionFactory sessionFactory = cfg.buildSessionFactory();

        Session session = sessionFactory.openSession();

        ArticlesPrix pic = session.get(ArticlesPrix.class, codeArt);
        if (pic != null) {

            return pic.getPicArt();
        } else {
            session.close();
            return "";
            // Return 0 if the article price is not found
        }
    }




}
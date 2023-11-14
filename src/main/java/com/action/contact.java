package com.action;

import com.opensymphony.xwork2.ActionSupport;
import entity.Contact;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class contact extends ActionSupport{
    private String name;
    private String email;
    private String message ;
    private String number;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }




    @Override
    public String execute() {
        if (email.isEmpty() || message.isEmpty() || number.isEmpty() ) {
            addActionError("Please fill in all the required fields.");
            return INPUT; // Stay on the same page and display the error message
        }
        Configuration cfg = new Configuration();
        cfg.configure("hibernate1.cfg.xml");
        SessionFactory sessionFactory = cfg.buildSessionFactory();
        Session session = sessionFactory.openSession();
        EntityManager entityManager = session.getEntityManagerFactory().createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();

            Contact cn=new Contact();
            cn.setNumber(number);
            cn.setEmail(email);
            cn.setMessage(message);
            cn.setName(name);



            entityManager.persist(cn);

            transaction.commit();
            session.close(); // Don't forget to close the session
            addActionMessage("Message sent successfully!");
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

}

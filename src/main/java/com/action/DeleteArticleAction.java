package com.action;

import com.opensymphony.xwork2.ActionSupport;
import entity.Commandes;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class DeleteArticleAction extends ActionSupport {
    private int codeCmd;

    public void setCodeCmd(int codeCmd) {
        this.codeCmd = codeCmd;
    }

    public String execute() {
        try {
            // Create a Hibernate Configuration object
            Configuration configuration = new Configuration().configure("hibernate1.cfg.xml");

            // Build the SessionFactory
            SessionFactory sessionFactory = configuration.buildSessionFactory();

            // Open a Hibernate Session
            Session session = sessionFactory.openSession();

            // Begin a transaction
            Transaction transaction = session.beginTransaction();

            // Retrieve the article to be deleted
            Commandes article = session.get(Commandes.class, codeCmd);

            if (article != null) {
                // Delete the article
                session.delete(article);
                transaction.commit();
                return SUCCESS;// Commit the transaction
            } else {
                // Article not found, handle the error
                addActionError("Article not found");
                return ERROR;
            }

        } catch (Exception e) {
            e.printStackTrace();
            addActionError("An error occurred while deleting the article");
            return ERROR; // Deletion failed
        }
    }
}

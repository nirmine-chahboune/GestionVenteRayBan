package com.action;

import com.opensymphony.xwork2.ActionSupport;
import entity.Users;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class RegisterUser extends ActionSupport implements SessionAware {

    private String username;
    private String password;
    private String confirmPassword;

    private List<String> errorMessages;

    public List<String> getErrorMessages() {
        return errorMessages;
    }

    public void setErrorMessages(List<String> errorMessages) {
        this.errorMessages = errorMessages;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    private Map<String, Object> session1;
    @Override
    public void setSession(Map<String, Object> session) {
        this.session1 = session;
    }

    @Override
    public void validate() {
        if (!password.equals(confirmPassword)) {
            addFieldError("confirmPassword", "Passwords do not match.");
        }

        if (password.length() < 8) {
            addFieldError("password", "Password should be at least 8 characters long.");
        }
    }
    @Override
    public String execute() {
        Configuration cfg = new Configuration();
        cfg.configure("hibernate1.cfg.xml");
        SessionFactory sessionFactory = cfg.buildSessionFactory();
        Session session = sessionFactory.openSession();
        EntityManager entityManager = session.getEntityManagerFactory().createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();

            // Check if the user already exists in the database
            Query query = entityManager.createQuery("SELECT COUNT(u) FROM Users u WHERE u.username = :username");
            query.setParameter("username", username);
            Long count = (Long) query.getSingleResult();

            if (count > 0) {
                errorMessages = new ArrayList<>();
                errorMessages.add("Email exists. Please try again.");
                return INPUT; // Stay on the same page and show the error message
            }

            Users newUser = new Users();
            newUser.setUsername(username);
            newUser.setPassword(password);

            entityManager.persist(newUser);
            session1.put("loggedInUser", newUser);
            transaction.commit();
            session.close(); // Don't forget to close the session

            return "success";
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            session.close(); // Don't forget to close the session
            e.printStackTrace();
            return INPUT;
        }
    }

}

package com.action;

import com.opensymphony.xwork2.ActionSupport;
import entity.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class UpdatePassword extends ActionSupport {

    private String password;
    private String newpassword;
    private String confirmpassword;
    private String username;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNewpassword() {
        return newpassword;
    }

    public void setNewpassword(String newpassword) {
        this.newpassword = newpassword;
    }

    public String getConfirmpassword() {
        return confirmpassword;
    }

    public void setConfirmpassword(String confirmpassword) {
        this.confirmpassword = confirmpassword;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String execute() {
        if (newpassword.length() < 8) {
            addFieldError("newpassword", "Password should be at least 8 characters long.");
        }
        if (password.isEmpty() || newpassword.isEmpty() || confirmpassword.isEmpty()) {
            addActionError("Please fill in all the required fields.");
        }
        if (!newpassword.equals(confirmpassword)) {
            addFieldError("confirmpassword", "Passwords do not match.");
        }

        // Check if there are any errors
        if (hasErrors()) {
            return INPUT; // Stay on the same page and display the error messages
        }

        try {
            // Create a Hibernate Configuration object
            Configuration configuration = new Configuration().configure("hibernate1.cfg.xml");

            // Build the SessionFactory
            SessionFactory sessionFactory = configuration.buildSessionFactory();

            // Open a Hibernate Session
            Session session = sessionFactory.openSession();

            // Begin a transaction
            Transaction transaction = session.beginTransaction();

            // Retrieve the user by username
            Users user = session.createQuery("FROM Users WHERE username = :username ", Users.class)
                    .setParameter("username", username)
                    .uniqueResult();

            if (user != null) {
                if (user.getPassword().equals(password)) {
                    // Update the password
                    user.setPassword(newpassword);
                    session.update(user);
                    transaction.commit();
                    addActionMessage("Updated successfully!");
                    return SUCCESS; // Password update successful
                } else {
                    addActionError("Current password is incorrect.");
                    return ERROR; // Current password doesn't match, display the error message
                }
            } else {
                // User not found, handle the error
                addActionError("User not found");
                return ERROR;
            }

        } catch (Exception e) {
            e.printStackTrace();
            addActionError("An error occurred while updating the password");
            return ERROR; // Password update failed
        }
    }
}

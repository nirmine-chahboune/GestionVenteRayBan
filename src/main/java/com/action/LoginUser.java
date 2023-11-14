package com.action;
import org.apache.struts2.interceptor.SessionAware;
import java.util.Map;
import com.opensymphony.xwork2.ActionSupport;

import entity.Users;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;


public class LoginUser  extends ActionSupport  implements SessionAware {




    private String username;
    private String password;

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
    private Map<String, Object> session1;
    @Override
    public void setSession(Map<String, Object> session) {
        this.session1 = session;
    }

    @Override
    public String execute() {
        Configuration cfg = new Configuration();
        cfg.configure("hibernate1.cfg.xml");
        SessionFactory sessionFactory = cfg.buildSessionFactory();
        Session session = sessionFactory.openSession();
        EntityManager entityManager = session.getEntityManagerFactory().createEntityManager();
        Query query = entityManager.createQuery("from Users where username=:username and password=:password");
        query.setParameter("username", username);
        query.setParameter("password", password);

        List<Users> resultList = query.getResultList();

        if (!resultList.isEmpty()) {
            Users user = resultList.get(0);

            session1.put("loggedInUser", user);

            session.close(); //  to close the session
            return "success";
        } else {

            addActionError("Invalid email or password. Please try again.");

            session.close(); //  close the session
            return INPUT;
        }


    }
}

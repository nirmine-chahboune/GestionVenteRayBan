<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.ArticlesPrix" %>
<%@ page import="entity.Users" %>
<%@ page import="jakarta.persistence.Table" %>
<%@ page import="db.ArticleStock" %>
<%@ page import="org.hibernate.Session" %>


<% Users loggedInUser = (Users) session.getAttribute("loggedInUser");

    if (loggedInUser == null ){
        response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
        return; // Stop further execution of the page
    }
%>
<%
    List<ArticlesPrix> userList = null;
    List<ArticleStock> userList1 = null;// Declare the userList variable
    try {
        // Create a Hibernate Configuration object
        Configuration configuration = new Configuration().configure("hibernate1.cfg.xml");

        // Build the SessionFactory
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Configuration stockConfiguration = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory stockSessionFactory = stockConfiguration.buildSessionFactory();
        Session stockSession = stockSessionFactory.openSession();
        // Open a Hibernate Session
        org.hibernate.Session session1 = sessionFactory.openSession();

        // Retrieve data from the database using Hibernate
        userList = session1.createQuery("FROM ArticlesPrix ").list();
        userList1 =  stockSession.createQuery("FROM ArticleStock ").list();
        // Close the Hibernate Session and SessionFactory
        session1.close();
        stockSession.close();
        sessionFactory.close();
    } catch (Exception e) {
        e.printStackTrace();
        // Handle any potential exceptions that may occur during Hibernate operations
    }
%>

<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>products</title>
    <link rel="icon" type="image/png" href="images/h.png">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/acceuil.css">

    <!-- custom js file link  -->
    <script src="js/acceuil.js" defer></script>

</head>
<body>

<!-- header section starts  -->

<header class="header">

    <a href="products.jsp" class="logo"> RayBan </a>

    <nav class="navbar">
        <ul>
            <li><a href="products.jsp">home</a></li>
            <li><a href="contactclient.jsp">contact</a></li>
            <li><a href="profil.jsp">account</a></li>
            <li><a href="<s:url action='logout'/>">Logout</a></li>
        </ul>
    </nav>

    <div class="icons">

        <a href="shop.jsp" class="fas fa-shopping-cart"></a>
    </div>



</header>

<!-- header section ends -->

<!-- header section  -->

<section class="heading">
    <h1>our products</h1>
    <p> <a href="products.jsp">home</a> >> products </p>
</section>


<!-- prodcuts section starts  -->
<section class="products">
    <h1 class="title">featured products</h1>
    <div class="box-container">
        <% for (ArticleStock stock : userList1) {
            for (ArticlesPrix prix : userList) {
                if (stock.getCodeArt() == prix.getCodeArt() && stock.getQteArt() > 0) {
        %>
        <div class="box">
            <div class="image">
                <div class="icons">
                    <a href="commande.jsp?codeArt=<%= stock.getCodeArt() %>" class="fas fa-shopping-cart"></a>
                </div>
                <img src="<%= prix.getPicArt() %>" alt="">
            </div>
            <div class="content">
                <h3><%= prix.getNomArt() %></h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <div class="price"><%= prix.getPrixArt() %>MAD<span><%= prix.getPrixArt()+5 %>MAD</span></div>
                <div class="quantity">Quantity: <%= stock.getQteArt() %></div>
                <div class="id"> <%= stock.getDescArt() %></div>
            </div>
        </div>
        <%
                    }
                }
            }
        %>
    </div>
</section>
<!-- prodcuts section ends -->


<!-- footer section starts  -->

<section class="footer">


    <div class="credit"> created by <span><a href="acceuil.jsp">RayBan</a></span> | all rights reserved </div>

</section>

<!-- footer section ends -->

</body>
</html>
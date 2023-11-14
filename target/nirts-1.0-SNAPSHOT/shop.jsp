<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Users" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="entity.Commandes" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.HibernateException" %>
<% Users loggedInUser = (Users) session.getAttribute("loggedInUser");

    if (loggedInUser == null ) {
        response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
        return; // Stop further execution of the page
    }
    %>
<%


    List<Commandes> commandesList = null; // Declare the commandesList variable

    try {
        // Create a Hibernate Configuration object
        Configuration configuration = new Configuration().configure("hibernate1.cfg.xml");

        // Build the SessionFactory
        SessionFactory sessionFactory = configuration.buildSessionFactory();

        // Open a Hibernate Session
        Session session1 = sessionFactory.openSession();

        // Retrieve data from the database using Hibernate
        String hql = "FROM Commandes c WHERE c.client = :loggedInUser";
        Query<Commandes> query = session1.createQuery(hql);
        query.setParameter("loggedInUser", loggedInUser.getUsername()); // Assuming 'getUsername()' returns the username as a String
        commandesList = query.list();

        // Perform operations with the commandesList

        session1.close(); // Close the Hibernate Session
        sessionFactory.close(); // Close the SessionFactory

    } catch (HibernateException e) {
        e.printStackTrace();
    }
%>

<html >
<head>
    <title>Cart</title>
    <link rel="icon" type="image/png" href="images/h.png">
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/acceuil.css">

    <!-- custom js file link  -->
    <script src="js/acceuil.js" defer></script>
    <!-- jQuery library script tag -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .custom-button-style {
            background-color: red;
            color: white;
            padding: 5px 15px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
        }

        .custom-button-style:hover {
            background-color: white;
            color: red;
        }
    </style>

    <script>
        $(document).ready(function() {
            $('.download-button').addClass('custom-button-style');
        });
    </script>
</head>
<body>
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
        <div id="menu-btn" class="fas fa-bars"></div>

        <a href="shop.jsp" class="fas fa-shopping-cart"></a>
    </div>



</header>

<!-- header section ends -->

<!-- header section  -->

<section class="heading">
    <h1>account</h1>
    <p> <a href="products.jsp">home</a> >> cart </p>
</section>
<section class="shopping-cart">

    <h1 class="title"> your products </h1>




    <div class="box-container">
        <% for (Commandes user : commandesList) { %>
        <div class="box">
            <a href="<s:url action='deleteArticle'/>?codeCmd=<%=user.getCodeCmd()%>" class="deleteArticle">
                <i class="fas fa-times"></i>
            </a>
            <div class="image">
            <div class="icons">
                <a href="<s:url action='downloadPDF'/>?codeCmd=<%=user.getCodeCmd()%>&client=<%=user.getClient()%>&codeArt=<%=user.getCodeArt()%>&qte=<%=user.getQte()%>&telephone=<%=user.getTelephone()%>&adress=<%=user.getAdress()%>&facture=<%=user.getFacture()%>&prix=<%=user.getPrix()%>" class="custom-button-style">Download the invoice</a>
            </div>
                <img src="<%=user.getPicArt()%>" alt="<s:property value='user.getCodeCmd()'/>">
            </div>

            <div class="content">
                <h3>     <span>quantity :</span>

                    <%= user.getQte() %></h3>



                Total : <div class="price"> <%= user.getFacture() %> MAD </div>

            </div>
        </div>
        <% } %>

    </div>

</section>
</body>
</html>
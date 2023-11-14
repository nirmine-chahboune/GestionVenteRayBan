<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page import="entity.Users" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="org.hibernate.HibernateException" %>
<% Users loggedInUser = (Users) session.getAttribute("loggedInUser");

  if (loggedInUser == null ) {
    response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
    return; // Stop further execution of the page
  }
%>
<%
  List<Users> users = null; // Declare the commandesList variable

  try {
    // Create a Hibernate Configuration object
    Configuration configuration = new Configuration().configure("hibernate1.cfg.xml");

    // Build the SessionFactory
    SessionFactory sessionFactory = configuration.buildSessionFactory();

    // Open a Hibernate Session
    Session session1 = sessionFactory.openSession();

    // Retrieve data from the database using Hibernate
    String hql = "FROM Users u WHERE u.username = :loggedInUser";
    Query<Users> query = session1.createQuery(hql);
    query.setParameter("loggedInUser", loggedInUser.getUsername()); // Assuming 'getUsername()' returns the username as a String
    users = query.list();

    // Perform operations with the commandesList

    session1.close(); // Close the Hibernate Session
    sessionFactory.close(); // Close the SessionFactory

  } catch (HibernateException e) {
    e.printStackTrace();
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



<section class="heading">
  <h1>our products</h1>
  <p> <a href="products.jsp">home</a> >> profil </p>
</section>

<section class="shopping-cart">

  <h1 class="title"> your informations</h1>



  <div class="box-container">
    <% for (Users user : users) { %>
    <div class="box">
      <div class="image">
        <span class="fas fa-lock"></span>
          <a href="modifiermdps.jsp"style="color: black">Edit password</a>

        <img src="images/h.png" >
      </div>

      <div class="content">
        <h3>     <span class="fas fa-user"></span> <span>Email : </span>

          <%= user.getUsername()%></h3>

      </div>
    </div>
    <% } %>

  </div>

</section>

<!-- footer section starts  -->

<section class="footer">


  <div class="credit"> created by <span><a href="acceuil.jsp">RayBan</a></span> | all rights reserved </div>

</section>

<!-- footer section ends -->

</body>
</html>
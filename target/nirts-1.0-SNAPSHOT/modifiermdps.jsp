<%@ page import="entity.Users" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 08/06/2023
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    Users loggedInUser = (Users) session.getAttribute("loggedInUser");

    if (loggedInUser == null ){
        response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
        return; // Stop further execution of the page
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update password</title>
    <link rel="icon" type="image/png" href="images/h.png">
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/acceuil.css">

    <!-- custom js file link  -->
    <script src="js/acceuil.js" defer></script>

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


<section class="login-form">

    <s:form action="updatemdps">
        <h3>Update</h3>
        <img src="images/h.png" style="height:200px;width: 200px;">
        <div class="inputBox">
            <span class="fas fa-user"></span>
            <s:hidden  name="username" placeholder="enter your email" value="%{#session.loggedInUser.username}" theme="simple"/>
            <s:textfield type="password" name="password" placeholder="enter your old password" theme="simple"/> >
            <s:fielderror fieldName="password" cssStyle="color: red;" />
        </div>

        <div class="inputBox">
            <span class="fas fa-lock"></span>
            <s:textfield type="password" name="newpassword" placeholder="enter your new password" theme="simple" />

        </div>
            <s:fielderror fieldName="newpassword" cssStyle="color: red;" />
        <div class="inputBox">
            <span class="fas fa-lock"></span>
            <s:textfield type="password" name="confirmpassword" placeholder="confirm your password" theme="simple" />
        </div>
            <s:fielderror fieldName="confirmpassword" cssStyle="color: red;" />

        <s:submit value="update" class="btn" theme="simple"/>
        <s:if test="hasActionMessages()">
            <s:actionmessage cssClass="blue-message" />
        </s:if>
        <s:if test="hasActionErrors()">
        <div style="color:red;font-size: 15px" class="error-messages">
            <s:actionerror />
        </div>
        </s:if>
    </s:form>

        <!-- footer section starts  -->

        <section class="footer">



            <div class="credit"> created by <span><a href="acceuil.jsp">RayBan</a></span> | all rights reserved </div>

        </section>

        <!-- footer section ends -->

</body>
</html>
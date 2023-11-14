<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.action.CommandeAction" %>
<%@ page import="entity.Users" %>
<%
  Users loggedInUser = (Users) session.getAttribute("loggedInUser");

  if (loggedInUser == null ){
    response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
    return; // Stop further execution of the page
  }
%>
<html >
<head>
  <title>Shop now</title>

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
    <div id="menu-btn" class="fas fa-bars"></div>

    <a href="shop.jsp" class="fas fa-shopping-cart"></a>
  </div>



</header>

<!-- header section ends -->

<!-- header section  -->

<section class="heading">
  <h1>account</h1>
  <p> <a href="products.jsp">home</a> >> commande </p>
</section>

<!-- header section -->

<!-- header section -->

<!-- register form section starts -->

<section class="register-form">

  <s:form action="commande" method="post" >
    <h3>shop now</h3>


      <s:hidden  name="username" placeholder="enter your email" value="%{#session.loggedInUser.username}" theme="simple"/>

    <s:fielderror fieldName="username" cssClass="error" style="color:red;" />

    <div class="inputBox">

      <s:textfield type="number" name="qte" placeholder="quantity" theme="simple" />
    </div>
    <s:fielderror fieldName="qte" cssClass="error" style="color:red;"  />

    <div class="inputBox">

    <s:textfield name="adress" placeholder="your adress" theme="simple" cols="30" rows="10"/>
    </div>
    <s:fielderror fieldName="adress" cssClass="error" style="color:red;" />
    <div class="inputBox">
      <s:textfield type="number" name="telephone" placeholder="your phone number" theme="simple"  />
    </div>

    <s:fielderror fieldName="telephone" cssClass="error" style="color:red;" />
    <s:hidden name="codeArt" value="%{#parameters.codeArt[0]}" />
    <s:submit value="confirm" class="btn" theme="simple"/>

    <s:if test="hasActionErrors()">
      <div style="color:red;font-size: 15px" class="error-messages">
        <s:actionerror />
      </div>
    </s:if>

  </s:form>

</section>

<!-- register form section ends -->












<!-- footer section starts  -->

<section class="footer">



  <div class="credit"> created by <span><a href="products.jsp">RayBan</a></span> | all rights reserved </div>

</section>

<!-- footer section ends -->

</body>
</html>
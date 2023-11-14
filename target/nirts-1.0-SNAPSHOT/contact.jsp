<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 19/05/2023
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="icon" type="image/png" href="images/h.png">

  <title>contact</title>

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

  <a href="acceuil.jsp" class="logo">RayBan </a>

  <nav class="navbar">
    <ul>
      <li><a href="acceuil.jsp">home</a></li>

      <li><a href="#">pages +</a>
        <ul>
          <li><a href="about.jsp">about</a></li>

        </ul>
      </li>
      <li><a href="contact.jsp">contact</a></li>
      <li><a href="#">account +</a>
        <ul>
          <li><a href="login.jsp">login</a></li>
          <li><a href="register.jsp">register</a></li>
        </ul>
      </li>
    </ul>
  </nav>



</header>

<!-- header section ends -->

<!-- header section  -->

<section class="heading">
  <h1>contact us</h1>
  <p> <a href="acceuil.jsp">home</a> >> contact </p>
</section>



<section class="contact">

  <h1 class="title"> get in touch </h1>

  <div class="row">

    <s:form action="contact">
      <s:textfield type="text" name="name" placeholder="your name" class="box"/>
      <s:textfield type="number" name="number" placeholder="your number" class="box"/>

      <s:textfield type="email" name="email" placeholder="your email" class="box"/>
      <s:textarea name="message" placeholder="your message" id="" cols="30" rows="10"/>
      <s:submit value="send message" class="btn"/>
      <s:if test="hasActionMessages()">
        <s:actionmessage cssClass="blue-message" />
      </s:if>
      <s:if test="hasActionErrors()">
        <div style="color:red;font-size: 15px" class="error-messages">
          <s:actionerror />
        </div>
      </s:if>
    </s:form>

    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51915.67645133759!2d-5.407677665463914!3d35.58506094000351!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd0b425de2c14849%3A0x43258dbd024e7abc!2zVMOpdG91YW4!5e0!3m2!1sfr!2sma!4v1684501080303!5m2!1sfr!2sma" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

  </div>

</section>













<!-- footer section starts  -->

<section class="footer">



  <div class="credit"> created by <span><a href="acceuil.jsp">RayBan</a></span> | all rights reserved </div>

</section>

<!-- footer section ends -->

</body>
</html>
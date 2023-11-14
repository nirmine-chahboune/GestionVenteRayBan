<%@ taglib prefix="s" uri="/struts-tags" %>


<html >
<head>

    <title>login</title>
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
    <h1>account</h1>
    <p> <a href="acceuil.jsp">home</a> >> login </p>
</section>


<section class="login-form">

    <s:form action="login">
        <h3>user login</h3>
        <img src="images/h.png" style="height:200px;width: 200px;">
        <div class="inputBox">
            <span class="fas fa-user"></span>
            <s:textfield type="email" name="username" placeholder="enter your email" theme="simple"/> >
        </div>

        <div class="inputBox">
            <span class="fas fa-lock"></span>
            <s:textfield type="password" name="password" placeholder="enter your password" theme="simple" />
        </div>

        <s:submit value="sign up" class="btn" theme="simple"/>

        <a href="register.jsp" class="btn">Create new account</a>
        <s:if test="hasActionErrors()">
            <div style="color:red" class="error-messages">
                <s:actionerror />
            </div>
        </s:if>
    </s:form>

</section>



<!-- footer section starts  -->

<section class="footer">



    <div class="credit"> created by <span><a href="acceuil.jsp">RayBan</a></span> | all rights reserved </div>

</section>

<!-- footer section ends -->

</body>
</html>
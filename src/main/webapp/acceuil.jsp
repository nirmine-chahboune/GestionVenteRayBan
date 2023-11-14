<%@ taglib prefix="s" uri="/struts-tags" %>
<html >
<head>
  <link rel="icon" type="image/png" href="images/h.png">
  <title>home</title>

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

  <a href="acceuil.jsp" class="logo"> RayBan</a>

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

<!-- home section starts      -->

<section class="home">

  <div class="slide active" style="background: url(https://cdn.shopify.com/s/files/1/0601/9045/8085/collections/ray-ban-sun_c5d62a9f-91ee-4d46-9a2c-5d507ee9a29f.jpg?v=1679329056) no-repeat;">
    <div class="content">
      <span>protect your eyes</span>
      <h3>upto 50% off</h3>
      <a href="register.jsp" class="btn">shop now</a>

    </div>
  </div>




</section>

<!-- home section ends     -->

<!-- banner section starts  -->

<section class="banner">

  <div class="box">
    <img src="https://media.ray-ban.com/cms/resource/image/658408/landscape_ratio15x11/858/630/ce800a6cb2d1d94be1aa989b317c68d1/E242FABC3F7AD6FDC27CE3CA75FFFE9F/rb-genuinesince-hp-bucaman-d.jpg" alt="">
    <div class="content">
      <span>special offer</span>
      <h3>upto 50% off</h3>

    </div>
  </div>

  <div class="box">
    <img src="https://media.ray-ban.com/cms/resource/image/656696/portrait_ratio841x897/828/884/f27536d315b5fdfd684a2cafbbc3975e/E99EBE0F15290CAAAFE3217C25CCC776/rb-genuinesince-plp-womensun.jpg" alt="">
    <div class="content">
      <span>special offer</span>
      <h3>upto 50% off</h3>

    </div>
  </div>

  <div class="box">
    <img src="https://www.coggles.com/image/s_1100x1200/https://static.thcdn.com/productimg/original/13104325-8904970030719824.jpg" alt="">
    <div class="content">
      <span>special offer</span>
      <h3>upto 50% off</h3>

    </div>
  </div>

</section>

<!-- banner section ends -->











<!-- footer section starts  -->

<section class="footer">



  <div class="credit"> created by <span><a href="acceuil.jsp">RayBan</a></span> | all rights reserved </div>

</section>

<!-- footer section ends -->

</body>
</html>
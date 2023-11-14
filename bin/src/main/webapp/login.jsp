<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>


<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<s:form action="login">
    <s:textfield name="username" />
    <s:password name="password" />
    <s:submit value="Login"/>
</s:form>
<style>
    body {
        background-image: url('https://besthqwallpapers.com/Uploads/10-4-2020/128443/ray-ban-logo-metal-emblem-apparel-brand-red-carbon-texture-global-apparel-brands.jpg');
        background-repeat: no-repeat;
        background-size: cover;
    }
</style>
<br/>
<a href="register.jsp">Register</a>
</body>
</html>
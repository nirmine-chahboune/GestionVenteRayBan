<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Page</title>
</head>
<body>
<h1>Registration</h1>

<s:form action="register">
    <div>
        <label for="username">
            Username: <s:textfield name="username" id="username" /></label>
    </div>

    <div>
        <label for="password"></label>
        Password:  <s:password name="password" id="password" />
    </div>
    <div>
        <label for="confirmPassword"></label>
        Password:  <s:password name="confirmPassword" id="confirmPassword" />
    </div>


    <div>
        <s:submit  value="Register"/>
    </div>
</s:form>

<br/>
<a href="login.jsp">Login</a>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <%@ include file="style.jsp" %>
</head>
<body>
    <div class="box">
        <h1>🔐 Login</h1>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Enter username" required><br>
            <input type="password" name="password" placeholder="Enter password" required><br>
            <input type="submit" value="Login">
        </form>
        <p>New user? <a href="register.jsp">Register here</a></p>
    </div>
</body>
</html>

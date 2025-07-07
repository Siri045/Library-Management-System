<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.library.User" %>
<%@ include file="style.jsp" %>
<html>
<head>
    <title>All Users</title>
</head>
<body>
<h1>📚 Library Users</h1>
<div class="user-list">
<%
    List<User> users = (List<User>) request.getAttribute("users");
    if (users != null && !users.isEmpty()) {
        for (User u : users) {
%>
        <div class="user"><%= u.getUsername() %></div>
<%
        }
    } else {
%>
    <div class="user">No users found.</div>
<%
    }
%>
</div>
</body>
</html>

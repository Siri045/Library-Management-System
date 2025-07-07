<%@ page import="java.util.*, java.io.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<div style="text-align: center; margin-bottom: 20px;">
    <a href="addBook.jsp">
        <button style="
            background-color: #fca311;
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        ">
            ➕ Add New Book
        </button>
    </a>
</div>

    <title>Library Dashboard</title>
    <style>
        body {
            background: linear-gradient(to right, #fdfbfb, #ebedee);
            font-family: 'Segoe UI', sans-serif;
            padding: 20px;
        }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        th {
            background: #fca311;
            color: white;
        }
        img {
            height: 100px;
        }
    </style>
</head>
<body>

<h2 style="text-align:center;">All Books in Library</h2>
<table>
    <tr>
        <th>Image</th>
        <th>Title</th>
        <th>Author</th>
        <th>Category</th>
    </tr>
  
    

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "root");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM books");

        while (rs.next()) {
%>
    <tr>
        <td><img src="book_images/<%= rs.getString("image_path") %>" alt="Book Image"></td>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("author") %></td>
        <td><%= rs.getString("category") %></td>
    </tr>
<%
        }
        conn.close();
    } catch (Exception e) {
        out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
    }
%>
</table>

</body>
</html>

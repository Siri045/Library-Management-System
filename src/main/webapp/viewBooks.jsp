<%@ include file="style.jsp" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div class="container">
    <h2>➕ Add New Book</h2>
    <form action="AddBookServlet" method="post" enctype="multipart/form-data">
        <input type="text" name="title" placeholder="Enter book title" required>
        <input type="text" name="author" placeholder="Enter author name" required>
        <input type="file" name="image">
        <button type="submit">Add Book</button>
    </form>
</div>

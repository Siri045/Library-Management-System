package com.library;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/viewBooks")
public class ViewBooksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try (Connection con = DBUtil.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM books")) {

            request.setAttribute("books", rs);
            RequestDispatcher rd = request.getRequestDispatcher("viewBooks.jsp");
            rd.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("❌ Could not fetch books.");
        }
    }
}

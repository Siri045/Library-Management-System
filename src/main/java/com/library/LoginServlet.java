package com.library;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    // Handles form submissions
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?")) {

            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("dashboard.jsp");
            } else {
                response.getWriter().println("❌ Invalid username or password.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("❌ Database error: " + e.getMessage());
        }
    }

    // Handles GET requests (e.g. directly visiting /LoginServlet)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.sendRedirect("login.jsp"); // redirects user to login page
    }
}

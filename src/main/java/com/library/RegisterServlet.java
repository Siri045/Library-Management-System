// src/com/library/RegisterServlet.java
package com.library;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.library.DBSetup; 
@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    public void init() {
        DBSetup.initialize(); // Automatically create tables
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("INSERT INTO users(username, password) VALUES(?, ?)")) {

            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
            response.sendRedirect("login.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("❌ ERROR: " + e.getMessage());
        }
    }
}

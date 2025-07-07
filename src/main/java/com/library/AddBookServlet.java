package com.library;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/AddBookServlet")
@MultipartConfig
public class AddBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // ✅ Update these with your DB details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/library";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root"; // Replace with your password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Get form fields
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String category = request.getParameter("category");

        // ✅ Handle file upload
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // ✅ Define image save location inside book_images folder
        String uploadPath = getServletContext().getRealPath("") + File.separator + "book_images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        Path filePath = Paths.get(uploadPath, fileName);
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
        }

        // ✅ Path stored in DB (relative)
        String imagePath = "book_images/" + fileName;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // ✅ Insert into DB
            String sql = "INSERT INTO books (title, author, category, image_path) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, author);
            stmt.setString(3, category);
            stmt.setString(4, fileName); // store only file name (image column in your table)

            int rows = stmt.executeUpdate();
            conn.close();

            if (rows > 0) {
                System.out.println("Book added successfully: " + title);
                response.sendRedirect("dashboard.jsp");
            } else {
                System.out.println("Failed to insert book.");
                response.getWriter().println("Failed to add book.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

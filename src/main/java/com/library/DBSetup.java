package com.library;

import java.sql.*;

public class DBSetup {
    public static void initialize() {
        try (Connection con = DBUtil.getConnection();
             Statement stmt = con.createStatement()) {

            String createUsers = "CREATE TABLE IF NOT EXISTS users (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY," +
                    "username VARCHAR(100) UNIQUE NOT NULL," +
                    "password VARCHAR(100) NOT NULL)";
            stmt.executeUpdate(createUsers);

            String createBooks = "CREATE TABLE IF NOT EXISTS books (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY," +
                    "title VARCHAR(255)," +
                    "author VARCHAR(255)," +
                    "image VARCHAR(255)," +
                    "status VARCHAR(20) DEFAULT 'available')";
            stmt.executeUpdate(createBooks);

            System.out.println("✅ Tables created or already exist.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

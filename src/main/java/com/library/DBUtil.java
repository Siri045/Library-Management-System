package com.library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/librarydb?useSSL=false&allowPublicKeyRetrieval=true";
        String user = "root";         // Change if needed
        String password = "root";         // Or your MySQL password

        return DriverManager.getConnection(url, user, password);
    }
}


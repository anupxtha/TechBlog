/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {

        try {

            if (con == null) {
                                
                //  Drive Class load
                Class.forName("com.mysql.jdbc.Driver");

                //  Creating a Connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "root");
                
            }

        } catch (ClassNotFoundException | SQLException exception) {
            
        }

        return con;
    }
}

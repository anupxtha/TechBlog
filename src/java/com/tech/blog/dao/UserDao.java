/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //Method to insert user to database
    public int saveUser(User user) {

//        boolean f = false;
        int f = -1;

        try {

            Thread.sleep(2000);

            // user --- > Database
            String query = "insert into user(name, email, password, gender, about) values(?,?,?,?,?);";
            String query2 = "Select * from user;";

            PreparedStatement pstmt = this.con.prepareStatement(query);
            PreparedStatement pstmt2 = this.con.prepareStatement(query2);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            ResultSet set = pstmt2.executeQuery();

            if (set.next()) {
                if (set.getString("email").equals(user.getEmail())) {
                    f = 0;
                } else {
                    pstmt.executeUpdate();
                    f = 1;
                }
            }

        } catch (InterruptedException | SQLException e) {
        }

        return f;
    }

    public User getUserByEmailAndPassword(String email, String password) throws NullPointerException {
        User user = null;

        try {
            String query = "Select * from user where email=? and password=?;";

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();

                // Fetching Data from database
                String name = set.getString("name");

                //Set To User Object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }

        } catch (Exception e) {
        }
        return user;

    }
    
    
    public boolean updateUser(User user){
        
        boolean f = false;
        
        try {
            
            String query = "update user set name=?, email = ?, password= ?, gender = ?, about = ?, profile =?  where id = ? ;";
            
            PreparedStatement p = con.prepareStatement(query);
            
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());
            
            p.executeUpdate();
            
            f= true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return f;
    }
    
    

}

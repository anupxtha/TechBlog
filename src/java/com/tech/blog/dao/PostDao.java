/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anup-Xtha
 */
public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<Category>();
        
        try {
            String query = "Select * from categories;";

            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            ResultSet set = pstmt.executeQuery();
            
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                
                Category c  = new Category(cid, name, description);
                list.add(c);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post p){
        boolean f = false;
        
        try {
            
            String query = "Insert into posts(pTitle, pContent, pCode, pPic, catId, UserId) values(? ,?, ?, ?, ?, ?);";
            
            PreparedStatement pstmt  = con.prepareStatement(query);
            
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            
            pstmt.executeUpdate();
            
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return f;
        
    }
    
    
    public List<Post> getAllPosts(){
        
        List<Post> list = new ArrayList<>();
        
        try {
            
            PreparedStatement p = con.prepareStatement("Select * from posts order by pId desc;");
            
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                int pId = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                
                Post post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                
                list.add(post);
                
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
    public List<Post> getPostByCatId(int catId){
        
        List<Post> list = new ArrayList<>();
        
        try {
            PreparedStatement p = con.prepareStatement("Select * from posts where catId=?;");
            
            p.setInt(1, catId);
            
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                int pId = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                
                Post post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
        
    }
    
    
}

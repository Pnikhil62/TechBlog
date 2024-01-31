
package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
    public static Connection con;
    public static Connection getConnection(){
        try{
          if(con==null){
               // driver class load;
            Class.forName("com.mysql.jdbc.Driver");
            
            // Create a Connection;
            String url = "jdbc:mysql://localhost:3306/TechBlog";
             con = DriverManager.getConnection(url,"root","root");
            
          }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
    
}

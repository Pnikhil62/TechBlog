
package com.tech.blog.entities;
import java.sql.*;
public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private Timestamp dateTime;
    private String about;
    private String profile;
    
    public User(int id,String name,String email,String password,String gender,String about){
        this.id = id;
        this.name = name;
        this.about = about;
        this.email = email;
        this.password = password;
        this.gender = gender;
      
    }
    public User(){
    
    }
   public User(String name,String email,String password,String gender,String about){
      
        this.name = name;
        this.about = about;
        this.email = email;
        this.password = password;
        this.gender = gender;
       
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    // getters and stters;
    public void setAbout(String about) {
        this.about = about;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getGender() {
        return gender;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public String getAbout() {
        return about;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
   
        
}
    

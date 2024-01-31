
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao {
    Connection con ;
    
    public PostDao(Connection con){
        this.con = con;
    }
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list = new ArrayList<>();
        
        try{
             
            String q = "select * from categories";
            
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description  = set.getString("description");
                Category c = new Category(cid,name,description);
                list.add(c);
            }
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post p){
        boolean f = false;
        
        try{
            
            String q = "insert into posts (ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?)";
           PreparedStatement pstmt = con.prepareStatement(q);
           pstmt.setString(1,p.getPtitle());
           pstmt.setString(2, p.getPcontent());
           pstmt.setString(3, p.getPcode());
           pstmt.setString(4, p.getPpic());
           pstmt.setInt(5, p.getCatid());
           pstmt.setInt(6,p.getUserid());
           pstmt.executeUpdate();
           f = true;
           
           
           
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    // get all the posts;
    public List<Post> getAllPosts(){
        List<Post>list = new ArrayList<>();
        // fetch all the post
        
        try{
            
            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pcontent = set.getString("pcontent");
                String pcode = set.getString("pcode");
                String ppic = set.getString("ppic");
                Timestamp date = set.getTimestamp("pdate");
                int catid = set.getInt("catid");
                int userid = set.getInt("userid");
                
                Post post = new Post(pid, ptitle, pcontent, pcode, ppic, date, catid, userid);
                list.add(post);
                
            }
            
            
        }catch(Exception e){
         e.printStackTrace();   
        }
        
        return list;
    }
    public List<Post> getPostByCatId(int catid){
        List<Post>list = new ArrayList<>();
        // fetch all the post by catid;
         try{
            
            PreparedStatement p = con.prepareStatement("select * from posts where catid=?");
            p.setInt(1, catid);
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pcontent = set.getString("pcontent");
                String pcode = set.getString("pcode");
                String ppic = set.getString("ppic");
                Timestamp date = set.getTimestamp("pdate");
              
                int userid = set.getInt("userid");
                
                Post post = new Post(pid, ptitle, pcontent, pcode, ppic, date, catid, userid);
                list.add(post);
                
            }
            
            
        }catch(Exception e){
         e.printStackTrace();   
        }
        
        
        return list;
    }
    
    public Post getPostByPostId(int postid){
        Post post = null;
        String q = "select * from posts where pid = ?";
        try{
                PreparedStatement p = this.con.prepareStatement(q);
                p.setInt(1, postid);
        ResultSet set = p.executeQuery();
        if(set.next()){
          
            int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pcontent = set.getString("pcontent");
                String pcode = set.getString("pcode");
                String ppic = set.getString("ppic");
                Timestamp date = set.getTimestamp("pdate");
                int catid = set.getInt("catid");
                int userid = set.getInt("userid");
                
                 post = new Post(pid, ptitle, pcontent, pcode, ppic, date, catid, userid);
        }
        }catch(Exception e){
            
            e.printStackTrace();
        }
    return post;
    }
  
     public List<Post>postForIndexPage(){
        List<Post>list = new ArrayList<>();
        // fetch all the post by catid;
         try{
            
            PreparedStatement p = con.prepareStatement("select * from posts where catid = ?");
            p.setInt(1, 4);
            
            ResultSet set = p.executeQuery();
            int i=0;
            
            while(set.next() && i<6){
                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pcontent = set.getString("pcontent");
                String pcode = set.getString("pcode");
                String ppic = set.getString("ppic");
                Timestamp date = set.getTimestamp("pdate");
              
                int userid = set.getInt("userid");
                
                Post post = new Post(pid, ptitle, pcontent, pcode, ppic, date, 4, userid);
                list.add(post);
                i++;
            }
            
            
        }catch(Exception e){
         e.printStackTrace();   
        }
        
        
        return list;
    }
}

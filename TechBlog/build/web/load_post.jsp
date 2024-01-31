<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<divc class="row"></div>
<%

    Thread.sleep(500);
PostDao d = new PostDao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post>posts = null;
    if(cid==0){
    
    
      posts = d.getAllPosts();
    }
    else{
     posts = d.getPostByCatId(cid);
    }
    if(posts.size()==0){
    
    out.println("<h3 class = 'display-3 text-center '> No Posts in this category..</h3>");
    return;
    }
    for(Post p : posts){
  


    %>
<div class="col-md-6 mt-2">
    
    <div class="card" >
        <img style="height: 250px;"class="card-img-top" src="blog_pics/<%= p.getPpic()%>" alt="Card image cap">
        <div class="card-body">
           
            <b><%= p.getPtitle()%></b>
         

        </div>
        
            <div class="card-footer  text-center  " style="color:#304146">
                 <a href="#!" class="btn btn-outline-dark btn sm"><i class="fa fa-thumbs-o-up"></i> <span>10</span></a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-dark btn sm">Read More...</a>
                
                <a href="#!" class="btn btn-outline-dark btn sm"><i class="fa fa-commenting-o"> <span>20</span></i></a>
               
            </div>
        
    </div>
    
</div>
    
    
    <%
    
    }




%>
</div>



<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechBlog</title>
        <!--css-->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 85%, 80% 97%, 31% 91%, 0 100%, 0 0)
                </style>
            </head>
            <body>
                <!--navbar-->
                <%@include file="normal_navbar.jsp"%>

                <!--banner-->
                <div class="container-fluid p-0 m-0">

                    <div class="jumbotron primary-background text-white banner-background">
                        <div class="container">
                            <h3 class="display-3"> Welcome to TechBlog</h3>

                            <p> Welcome to technical blog, world of technology A programming language is a system of notation for writing computer programs. Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.</P>
                            <p>Another usage regards programming languages as theoretical constructs for programming abstract machines and computer languages as the subset thereof that runs on physical computers, which have finite hardware resources. John C. Reynolds emphasizes that formal specification languages are just as much programming languages as are the languages intended for execution.</p>

                            <a href="login_page.jsp" class="btn btn-outline-light  btn-lg"> <span class="fa fa-user-plus"> </span> Start ! its Free</a>
                            <a href="login_page.jsp" class="btn btn-outline-light  btn-lg"> <span class="fa fa-user-circle fa-spin"></span> Login</a>
                        </div>
                    </div>

                    <br>

                </div>
                <!--cards-->
                <div class="row " style="margin-left: 30px ; margin-right: 30px">

                <%
                    PostDao pd = new PostDao(ConnectionProvider.getConnection());
                    List<Post> list = pd.postForIndexPage();

                    for (Post p : list) {


                %>
                <div class="col-md-4 " >

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
                </div>
                <!--JavaScripts-->
                <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

            </body>
        </html>

<%-- 
    Document   : show_blog_jsp
    Created on : Aug 25, 2023, 6:43:16 PM
    Author     : hp
--%>

<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage = "error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>


<%    int postid = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postid);
    int userid = p.getUserid();
    UserDao ud = new UserDao(ConnectionProvider.getConnection());
    User puser = ud.getUserByUserId(userid);

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getPtitle()%> || TechBlog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 85%, 80% 97%, 31% 91%, 0 100%, 0 0);
            }
            .post-title{
                font-style: italic;
                color:activecaption;
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25;
            }
            .post-footer{
                color:primary-background;
            }
            .post-date{
                font-style: italic;
                
            }
            .post-user-info{
                font-size: 20px;
             
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px
            }
                    
                </style>
            </head>
            <body>

                <nav class="navbar navbar-expand-lg navbar-dark primary-background ">
                    <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>Tech Blog</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#"> <span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="fa fa-check-square"> </span>  Categories
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">Programming Language</a>
                                    <a class="dropdown-item" href="#">Project Implementation</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Data Structure</a>
                                </div>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#"> <span class="fa fa-address-card"></span> Contact</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="fa fa-asterisk"></span> Do Post</a>
                            </li>


                        </ul>
                        <ul class="navbar-nav mr-right">
                            <%
                                User u = (User) session.getAttribute("currentUser");
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal" > <span class="fa fa-user-circle"></span> <%= u.getName()%> </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus"></span> Logout</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!--end of nav bar-->


                <!--Main content of body-->
                <div  class="row my-4">
                    <div class="col-md-8 offset-md-2">

                        <div class="card">

                            <div class="card-header  text-center">

                                <h4 class="post-title"> <%= p.getPtitle()%></h4>

                            </div>

                            <div class="card-body">
                                 <img class="card-img-top my-2" src="blog_pics/<%= p.getPpic()%>" alt="Card image cap">
                                 
                                 <div class="row my-3 row-user">
                                     
                                     <div class="col-md-8 ">
                                         <p class="post-user-info"> <a href="#!">Posted by : <%=puser.getName()%> </a></p>
                                     </div>
                                     <div class="col-md-4">
                                         <p class="post-date"><%=p.getPdate().toLocaleString()%></p>
                                     </div>
                                     
                                 </div>
                                 
                                 <p class="post-content"> <%=p.getPcontent()%></p>
                                <br>
                                <div class="post-code">
                                <pre><%= p.getPcode()%></pre>
                                </div>

                            </div>

                            <div class="card-footer post-footer primary-background">
                                <a href="#!" class="btn btn-outline-light btn sm"><i class="fa fa-thumbs-o-up "></i> <span>10</span></a>


                                <a href="#!" class="btn btn-outline-light btn sm"><i class="fa fa-commenting-o"> <span>20</span></i></a>


                            </div>    

                        </div>

                    </div>

                </div>

                <!--End of Main content of body-->



                <!-- Modal -->
                <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header primary-background text-white ">
                                <div class="container text-center">
                                    <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>

                                </div>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="container text-center">



                                    <img src="pics/<%=u.getProfile()%>" class="img-fluid" style="border-radius: 50% ;
                                    max-width: 150px"  alt="alt"/>
                                    <h5 class="modal-title mt-3" id="exampleModalLabel"><%=u.getName()%></h5>


                                    <!--about logic start-->


                                    <!--about logic--> 

                                    <!--details-->
                                    <div id="profile-details">
                                        <table class="table">

                                            <tbody>
                                                <tr>
                                                    <th scope="row">ID :</th>
                                                    <td><%=u.getId()%></td>

                                                </tr>
                                                <tr>
                                                    <th scope="row">Email :</th>
                                                    <td><%=u.getEmail()%></td>

                                                </tr>
                                                <tr>
                                                    <th scope="row">Gender :</th>
                                                    <td><%=u.getGender()%></td>

                                                </tr>
                                                <tr>
                                                    <th scope="row">Registered on :</th>
                                                    <td><%=u.getDateTime().toString()%></td>

                                                </tr>
                                                <tr>
                                                    <th scope="row">About :</th>
                                                        <%
                                                            String about = u.getAbout();
                                                            if (about.equals("")) {

                                                        %>
                                                    <td>Hi i am TechBlog user...</td>
                                                    <%                                      } else {

                                                    %>
                                                    <td><%=u.getAbout()%></td>
                                                    <%
                                                        }
                                                    %>

                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>

                                    <!--profile edit-->
                                    <div id ="profile-edit" style="display:none">
                                        <h3 class="mt-2">Please Edit Carefully</h3>
                                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                                            <table class="table">
                                                <tr>
                                                    <td>ID :</td>
                                                    <td><%=u.getId()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Email :</td>
                                                    <td><input type="email" class="form-control" name="user_email" value="<%=u.getEmail()%>"></td>
                                                </tr>
                                                <tr>
                                                    <td>Name :</td>
                                                    <td><input type="text" class="form-control" name="user_name" value="<%=u.getName()%>"></td>
                                                </tr>
                                                <tr>
                                                    <td>Password :</td>
                                                    <td><input type="password" class="form-control" name="user_password" value="<%=u.getPassword()%>"></td>
                                                </tr>
                                                <tr>
                                                    <td>Gender :</td>
                                                    <td><%=u.getGender().toUpperCase()%></td>
                                                </tr>
                                                <tr>
                                                    <td>About :</td>

                                                    <%

                                                        if (about.equals("")) {

                                                    %>
                                                    <td> <textarea rows="1" class="form-control" name="user_about"> Hi i am TechBlog user</textarea></td>
                                                    <%                                      } else {

                                                    %>
                                                    <td> <textarea rows="1" class="form-control" name="user_about"> <%= u.getAbout()%></textarea></td>
                                                    <%
                                                        }
                                                    %>

                                                </tr>
                                                <tr>
                                                    <td> Profile pic</td>
                                                    <td>
                                                        <input type="file" name="image" class="form-control">
                                                    </td>
                                                </tr>
                                            </table>
                                            <div class="container">
                                                <button type="submit" class="btn btn-outline-primary">Save</button>
                                            </div>
                                        </form>
                                    </div>


                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                            </div>
                        </div>
                    </div>
                </div>


                <!--Modals-->




                <!-- Modal -->
                <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Provide the post details...</h5>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="AddPostServlet" method="POST" id="add-post-form" >
                                    <div class="form-group">
                                        <select class="form-control" name="cid">
                                            <option selected disabled>---Select Category---</option>
                                            <%
                                                PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                                ArrayList<Category> list = list = postd.getAllCategories();

                                                for (Category c : list) {

                                            %>

                                            <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                            <%
                                                }

                                            %> 


                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <input name="ptitle" type="text" placeholder="Enter post Title" class="form-control"/>

                                    </div>
                                    <div class="form-group">
                                        <textarea name="pcontent" class="form-control" placeholder="Enter your content" ></textarea>
                                    </div>

                                    <div class="form-group">
                                        <textarea name="pcode" class="form-control" placeholder="Enter your programm( if any)" ></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Select your pic...</label>
                                        <br>
                                        <input name= "ppic" type="file" class="form-control"/>
                                    </div>
                                    <div class="container text-center ">
                                        <button type ="submit" class="btn btn-outline-primary">Post</button>
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>
                </div>


                <!--End of Modals-->



                <!--end of profile model-->
                <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

                <script>
                    $(document).ready(function () {
                        let editStatus = false;
                        $('#edit-profile-button').click(function () {
//                           alert("button clicked")
                            if (editStatus == false) {
                                $("#profile-details").hide()
                                $("#profile-edit").show();
                                editStatus = true;
                                $(this).text("Back");
                            } else {
                                $("#profile-details").show()
                                $("#profile-edit").hide();
                                editStatus = false;
                                $(this).text("Edit");
                            }

                        })

                    });
                </script>

                <script>
                    $(document).ready(function (e) {

                        $("#add-post-form").on("submit", function (event) {
                            event.preventDefault();
                            console.log("submited");
                            let form = new FormData(this);

                            //  requesting to server;

                            $.ajax({
                                url: "AddPostServlet",
                                type: 'POST',
                                data: form,
                                success: function (data, textStatus, jqXHR) {
                                    console.log(data);
                                    if (data.trim() == 'done') {
                                        swal("Good job!", "Post saved successfully !", "success");
                                    } else {
                                        swal("Error !", " Something went wrong try again !", "error");
                                    }
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    //console.log(data);
                                },
                                processData: false,
                                contentType: false
                            });
                        });

                    });
                </script>
            </body>
        </html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="com.tech.blog.servlets.*" %>
<%@page import="java.util.ArrayList" %>
<%@page errorPage="error_page.jsp" %>


<%
  User user = (User)session.getAttribute("currentUser");  

 if(user==null){
     response.sendRedirect("login_page.jsp");
 }

 int pId = Integer.parseInt(request.getParameter("post_id"));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link href="css/mystyle.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <!--        <style>
                    .banner-background{
                        url(clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 52% 90%, 23% 100%, 0 83%, 0 0));
                    }
                </style>-->
    </head>
    <body>
         <!--Nav Bar-->
        <nav class="navbar navbar-expand-lg navbar-light primary-background">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> TechBlog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.jsp"><span class="fa fa-home"></span>Home</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="fa fa-archive"></span> Categories
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Programming Language</a></li>
                                <li><a class="dropdown-item" href="#">Project Implementation</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Data Structure</a></li>
                            </ul>
                        </li>

                        <!--                <li class="nav-item">
                                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">More</a>
                                        </li>-->

                        <li class="nav-item">
                            <a class="nav-link" href="#"><span class="fa fa-phone-square"></span> Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span> Do Post</a>
                        </li>


                    </ul>

                    <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal" ><span class="fa fa-user-circle"></span> <%= user.getName() %></a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="logoutservlet"><span class="fa fa-user-plus"></span> Logout</a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
        <!--End of NavBar-->


        <%
            Message m = (Message) session.getAttribute("msg");
                               
            if(m != null){
        %>
        <div class="alert <%= m.getCssClass() %> text-center" role="alert">
            <%= m.getContent() %>
        </div>
        <%
            session.removeAttribute("msg");
            }
        %>
        
           <!--Start of Profile Modal-->
        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel"> TechBlog</h5

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>

                    <div class="modal-body">
                        <div class="container text-center">

                            <img src="pics/<%= user.getProfile() %>" alt="<%= user.getProfile() %>" class="img-fuild" style="max-height: 120px; border-radius: 50%; max-width: 120px;"/>

                            <%--<%= user.getProfile() %>--%>
                            <!--<br>-->
                            <%--<%= user.getDateTime() %>--%>
                            <h5 class="modal-title display-6 pb-3" id="exampleModalLabel"><u> <%= user.getName() %> </u></h5>

                            <!--Details-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID : </th>
                                            <td><input class="form-control" type="text" name="id" value="<%= user.getId() %>" readonly></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email : </th>
                                            <td><input class="form-control" type="text" name="email" value="<%= user.getEmail() %>" readonly></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender : </th>
                                            <td><input class="form-control" type="text" name="gender" value="<%= user.getGender() %>" readonly></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Status : </th>
                                            <td><input class="form-control" type="text" name="status" value="<%= user.getAbout() %>" readonly></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered Date : </th>
                                            <td><input class="form-control" type="text" name="date" value="<%= user.getDateTime().toString() %>" readonly></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--End of Detail-->       


                            <!--Profile Edit-->
                            <div id="profile-edit" style="display: none;">
                                <!--<h4>Please Edit Carefully</h4>-->

                                <form id="form-save" action="editservlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><input class="form-control" type="text" id="user_id" name="id" value="<%= user.getId() %>" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input class="form-control" type="email" id="email" name="user_email" value="<%= user.getEmail() %>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input class="form-control" type="text" id="name" name="user_name" value="<%= user.getName() %>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input class="form-control" type="password" id="password" name="user_password" value="<%= user.getPassword() %>">
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><input class="form-control" type="text" id="gender" name="gender" value="<%= user.getGender() %>" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>About :</td>
                                            <td>
                                                <textarea class="form-control" id="about" name="user_about" rows="2"><%= user.getAbout() %></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Upload Profile :</td>
                                            <td><input class="form-control" type="file" id="profile" name="image"></td>
                                        </tr>
                                    </table>

                                </form>

                            </div>
                            <!--End of Profile Edit-->

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                        <button id="profile-form-save" type="buttosn" class="btn btn-outline-primary" style="display: none;">Save</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Profile Modal-->


        <!--Add Post Modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h4 class="modal-title display-6" id="exampleModalLabel">Provide Post Details</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <!--Form-->
                        <form id="add-post-form" action="addpostservlet" method="POST">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option class="text-center" selected disabled>***Select Categories***</option>

                                    <% 
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        
                                        ArrayList<Category> list = postd.getAllCategories();
                                        
                                        for(Category c: list){
                                    %>

                                    <option value="<%= c.getCid() %>"><%= c.getName() %></option>

                                    <%
                                        }     
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"  />
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" id="content" name="pContent" rows="4" placeholder="Enter your Content" ></textarea>
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" id="code" name="pCode" rows="4" placeholder="Enter your Programming Code (If Any)" ></textarea>
                            </div>

                            <div class="form-group">
                                <label>Select Your Post Image</label>
                                <input name="pic" type="file" class="form-control"  />
                            </div>

                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary">Save changes</button>
                            </div>    
                        </form>

                        <!--                        <div class="container">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>-->

                        <!--Form End-->       

                    </div>

                </div>
            </div>
        </div>
        <!--End Post Modal-->


        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
            
            
            $(document).ready(function () {

                let editStatus = false;

                $("#edit-profile-button").click(function () {

                    if (editStatus === false) {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        $("#profile-form-save").show();
                        editStatus = true;
                        $(this).text("Back");
                        $("#profile-form-save").click(function () {
                            $("#form-save").submit();
                        });
                        console.log(editStatus);

                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        $('#profile-form-save').hide();
                        editStatus = false;
                        $(this).text("Edit");
                        $("#profile").val("");
                        console.log(editStatus);
                    }

                });


                $("#add-post-form").on("submit", function (event) {

                    event.preventDefault();

                    let form = new FormData(this);

                    $.ajax({
                        url: "addpostservlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {

                            if (data.trim() === "completelydone") {
                                swal("Great job!", "Blog Post Uploaded Successfully : Including Post Image.", "success").then((value) => {
                                    window.location = "profile.jsp";
                                });

                            } else if (data.trim() === "done") {
                                swal("Better job!", "Blog Post Uploaded Successfully : Except Blog Post Image.", "success").then((value) => {
                                    window.location = "profile.jsp";
                                });
                            } else if (data.trim() === "imgProblem") {
                                swal("Good job!", "Only Blog Post Image Not Uploaded. Something went Wrong in Uploading Image Part.", "success").then((value) => {
                                    window.location = "profile.jsp";
                                });
                            } else {
                                swal("Error!", "Something went Wrong!", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                        },
                        contentType: false,
                        processData: false
                    });

                });
                
               
            });

        </script>


    </body>
</html>

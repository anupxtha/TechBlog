<%-- 
    Document   : index
    Created on : Jul 5, 2021, 9:57:11 AM
    Author     : Anup-Xtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  

<%@page import="com.tech.blog.entities.*" %>

<%@page errorPage="error_page.jsp" %>


<%
  User user = (User)session.getAttribute("currentUser");  

 if(user!=null){
     
%>
<script>
    window.location.href = 'profile.jsp';
</script>
<%
}

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

        <!--CSS-->
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

    <!--Including NavBar-->
    <%@include file="normal_navbar.jsp" %>

    <!--Banner-->
    <div class="container-fluid m-0 p-0 ">
        <div class="jumbotron primary-background text-white pt-3">
            <div class="container pt-5 pb-5 ps-5">
                <h3 class="display-3 pt-4 ps-5">Welcome To Tech Blog</h3>
                <p class="pt-2 ps-5">Programming languages are one kind of computer language and 
                    are used in computer programming to implement algorithms.<br>
                    Most programming languages consist of instructions for computers. 
                    Programming languages are one kind of computer <br> language and 
                    are used in computer programming to implement algorithms.<br>
                    Most programming languages consist of instructions for computers. </p>
                <br>

                <div class="pb-5 ps-5">
                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-external-link"></span> Start! It's Free</button>&nbsp;&nbsp;&nbsp;
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin"></span> Login</a>
                </div>
            </div>
        </div>
    </div>


    <!--Card-->
    <div class="container pt-5 pb-5 ps-5">
        <div class="row ps-3">

            <div class="col-md-4">
                <div class="card"">
                    <!--<img src="..." class="card-img-top" alt="...">-->
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card"">
                    <!--<img src="..." class="card-img-top" alt="...">-->
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card"">
                    <!--<img src="..." class="card-img-top" alt="...">-->
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>                

        </div>

        <div class="row pt-3 ps-3">

            <div class="col-md-4">
                <div class="card"">
                    <!--<img src="..." class="card-img-top" alt="...">-->
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card"">
                    <!--<img src="..." class="card-img-top" alt="...">-->
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card"">
                    <!--<img src="..." class="card-img-top" alt="...">-->
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>                

        </div>
    </div>

    <!--To connect with Database / MySQL-->
    <%
    Connection con =  ConnectionProvider.getConnection();
    %>


    <!--JavaScript-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    <script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>

<%-- 
    Document   : login_page
    Created on : Jul 5, 2021, 8:17:01 PM
    Author     : Anup-Xtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <title>Login Page</title>

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


        <!--Login Form-->
        <main class="d-flex align-items-center primary-background" style="height: 84vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">

                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <p>Login Here</p>
                            </div>

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


                            <div class="card-body">
                                <form action="loginservlet" method="POST">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <!--  <div class="mb-3 form-check">
                                          <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                          <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                                                        </div>-->

                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Login</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </main>


        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>

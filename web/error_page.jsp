<%-- 
    Document   : error_page
    Created on : Jul 6, 2021, 5:36:59 PM
    Author     : Anup-Xtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry Something Went Wrong</title>
        
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
        
        <div class="container text-center">
            <img style="height: 480px;" class="img-fuild" src="img/error.png" alt="Error in site"/>
            <h4 class="display-3">Sorry! Something went Wrong...</h4>
            <p><%= exception %></p>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3"><< Go To Home</a>
        </div>
        
    </body>
</html>

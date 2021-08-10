<%-- 
    Document   : register_page
    Created on : Jul 5, 2021, 8:55:38 PM
    Author     : Anup-Xtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

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


        <!--Registration Form-->
        <main class="d-flex align-items-center primary-background" style="height: 130vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">

                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-3x fa-user-circle"></span>
                                <br>
                                Register Here
                            </div>

                            <div class="card-body">
                                <form id="reg-form" action="registerservlet" method="post">
                                    <div class="mb-3">
                                        <label for="user_name" class="form-label">Name</label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email</label>
                                        <input name="user_email"  type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="mb-3">
                                        <label for="gender" class="form-label">Select Gender</label>
                                        <br>
                                        <input type="radio" name="gender" value="male" >&nbsp; Male  &nbsp;&nbsp;
                                        <input type="radio" name="gender" value="female">&nbsp; Female
                                    </div>
                                    <div class="mb-3">
                                        <textarea name="about" class="form-control" id="note" rows="5" placeholder="Enter something about yourself"></textarea>
                                    </div>
                                    <div class="mb-3 form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree Terms & Conditions</label>
                                    </div>

                                    <br>
                                    <div class="container text-center" id="loader" style="display: none;"> 
                                        <span class="fa fa-refresh fa-spin fa-4x"></span>
                                        <h4>Please Wait...</h4>
                                    </div>
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                </form>
                            </div>

                            <div class="card-footer">

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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
            $(document).ready(function () {

                $("#reg-form").on("submit", function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#loader").show();
                    $("#submit-btn").hide();

                    // Send to register servlet
                    $.ajax({
                        url: "registerservlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
//                            console.log(data);
                            $("#loader").hide();
                            $("#submit-btn").show();

                            if (data.trim() === "done") {
                                swal("Registered Successfully... Redirecting to Login Page")
                                        .then((value) => {
                                            window.location = "login_page.jsp";
                                        });
                            } else {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
//                            console.log(jqXHR);
                            $("#loader").hide();
                            $("#submit-btn").show();
                            swal("Something Went Wrong... Try again...");
                        },
                        processData: false,
                        contentType: false
                    });

                });
            });

        </script>

    </body>
</html>

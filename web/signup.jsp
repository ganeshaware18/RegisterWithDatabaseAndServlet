<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </head>
    <body style="background: url(https://wallpaperaccess.com/full/5542490.jpg);background-position: center">

        <div class="container">
            <div class="row">

                <div class="col m6 offset-m3">

                    <div class="card">

                        <div class="card-content">
                            <h4 style="text-align: center;">Register Here</h4>
                            <p id="msg" style="font-weight: bold;"></h5>
                            <div class="form center-align">

                                <form action="Register" method="post" id="regform">
                                    <input type="text" name="user_name" placeholder="Enter Your User nmae">
                                    <input type="password" name="user_password" placeholder="Enter Your Password">
                                    <input type="email" name="user_email" placeholder="Enter Your Email">
<!--                                    <div class="file-field input-field">
                                        <div class="btn">
                                            <span>File</span>
                                            <input type="file" name="image">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>-->
                                    <button type="submit" class="btn pink accent-2">Submit</button>
                                </form>
                            </div>
                            <div class="loader center-align" style="margin-top: 10px; display: none">

                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                <h5>please wait ......</h5>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("page is ready");

                $("#regform").on('submit', function (event) {
                    event.preventDefault();

                    var f = $(this).serialize();

                    $(".loader").show();
                    $(".form").hide();
                    $.ajax({
                        url: "Register",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("sucess....");
                            $(".loader").hide();
                            $(".form").show();

                            if (data.trim() === 'done') {

                                $("#msg").html("succefully register");
                                $("#msg").addClass("green-text");
                            } else {
                                $("#msg").html("something wrong");
                                $("#msg").addClass("red-text");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            console.log("error....");
                            $(".loader").hide();
                            $(".form").show();
                            $("#msg").addClass("red-text");
                        }
                    });
                });
            });
        </script>
    </body>
</html>

<html>
    <head>
       <title>Login Failed..</title>
    </head>
    <body>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
     swal( "Login Failed!","EmailID or Password is incorrect.","error").then(function() {
    window.location = "http://localhost:8080/EmailSystem/index.html";
});
</script>
    </body>
</html>

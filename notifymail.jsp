<%-- 
    Document   : notifymail
    Created on : 15 Jun, 2019, 2:07:49 PM
    Author     : Yashasvi Pandey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metacube Mail Login|Signup</title>
    </head>
    <body>
        <% 
      String id =   request.getParameter("id");
      System.out.println("pass..notify");
        %>
         <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js'></script>
<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>
<script>
      swal("Registered Successfully!","Your EmailId is:<%out.print(id);%>","success").then(function() {
    window.location = "http://localhost:8080/EmailSystem/index.html";
});
</script>
    </body>
</html>

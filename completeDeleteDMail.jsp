<%-- 
    Document   : msgbody
    Created on : Jun 11, 2019, 1:03:53 AM
    Author     : Yashasvi Pandey
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>deleting mail....</title>
    </head>
    <body>
        <% 
      String id =   request.getParameter("id");
     Connection con;
    Class.forName("org.gjt.mm.mysql.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/"+"maildb","root", "root");
  
 try {
     System.out.println("Complete delete...pass1");
     java.sql.Statement st2 = con.createStatement();
     st2.executeUpdate("delete from draft where did='"+id+"'");
     st2.close();
     System.out.println("delete..pass2");
   }catch(Exception e1){
       System.out.print("Exception2:"+e1);
          
      }
 
    
      %>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--<script>
    jQuery(function() {
        swal("Deleted Successfully!");
    });
</script>
        
    <% //response.sendRedirect("http://localhost:8080/EmailSystem/inbox.jsp");  %>  -->
    
    
    <script>
    swal({
    title: "Done!",
    text: "Mail Deleted!",
    type: "success"
}).then(function() {
    window.location = "http://localhost:8080/EmailSystem/draft.jsp";
});
</script>
    </body>
</html>



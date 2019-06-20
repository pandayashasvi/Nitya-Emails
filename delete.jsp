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
    ResultSet rs;  
    String to="";
    String from="";
    String sub="";
    String mssg="";
    Class.forName("org.gjt.mm.mysql.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/"+"maildb","root", "root");
      try {
    java.sql.Statement st = con.createStatement();
     rs=st.executeQuery("SELECT * FROM inbox where iid='"+id+"'");
     while(rs.next()){
         to=rs.getString(2);
         from= rs.getString(3);
        sub =  rs.getString(4);
         mssg =  rs.getString(5);
       }
     rs.close();
     st.close();
     System.out.println("delete.....pass2");
   }catch(Exception e){
       System.out.print("Exception1:"+e);
          
      }
      
 try {
    java.sql.Statement st1 = con.createStatement();
     st1.executeUpdate("insert into trash(tto,tfrom, tsubject, tmessage) values('"+to+"', '"+from+"', '"+sub+"', '"+mssg+"' )");
     st1.close();
     System.out.println("delete...pass3");
     java.sql.Statement st2 = con.createStatement();
     st2.executeUpdate("delete from inbox where iid='"+id+"'");
     st2.close();
     System.out.println("delete..pass4");
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
    text: "Mail deleted successfully!",
    type: "success"
}).then(function() {
    window.location = "http://localhost:8080/EmailSystem/inbox.jsp";
});
</script>
    </body>
</html>



<%-- 
    Document   : msgbody
    Created on : Jun 11, 2019, 1:03:53 AM
    Author     : Ayush Dixit
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
      String id =   request.getParameter("id");
            
      try {
    Connection con;
    ResultSet rs;
    Class.forName("org.gjt.mm.mysql.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/"+"maildb","root", "root");
    // out.println ("maildb"+ "database successfully opened.");
    java.sql.Statement st = con.createStatement();
     rs=st.executeQuery("SELECT * FROM inbox where iid='"+id+"'");
     while(rs.next()){
        String from= rs.getString(3);
        String sub =  rs.getString(4);
        String msg =  rs.getString(5);
        out.print(msg);
     }
   }catch(Exception E){
          
      }
   %>
        
        
    </body>
</html>



<%-- 
    Document   : inbox
    Created on : 31 May, 2019, 10:39:44 AM
    Author     : Yashasvi Pandey
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send Messages</title>
          <link rel="Stylesheet" href="https://code.jquery.com/jquery-1.12.3.js"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"/> 
              <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.js"></script>
              <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
        
        <script>
        $(document).ready(function() {  
    $('#MyTable').DataTable( {  
        initComplete: function () {  
            this.api().columns().every( function () {  
                var column = this;  
                var select = $('<select><option value=""></option></select>')  
                    .appendTo( $(column.footer()).empty() )  
                    .on( 'change', function () {  
                        var val = $.fn.dataTable.util.escapeRegex(  
                            $(this).val()  
                        );  
                //to select and search from grid  
                        column  
                            .search( val ? '^'+val+'$' : '', true, false )  
                            .draw();  
                    } );  
   
                column.data().unique().sort().each( function ( d, j ) {  
                    select.append( '<option value="'+d+'">'+d+'</option>' )  
                } );  
            } );  
        }  
    } );  
} );    
        </script>
        
        <style>
/* Style the body */
body {
  font-family: Arial;
  margin: 0;
}

/* Header/Logo Title */
.header {
  padding: 50px;
  text-align: center;
  background-image: url("pic/6.png");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  color: white;
  font-size: 30px;
  
}

/* Page Content */
.content {padding:20px;}

</style>

        <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>-->
        <style>
            body {
    background: #fafafa url(https://jackrugile.com/images/misc/noise-diagonal.png);
    color: #444;
    font: 100%/30px 'Helvetica Neue', helvetica, arial, sans-serif;
    text-shadow: 0 1px 0 #fff;
}

strong {
    font-weight: bold; 
}

em {
    font-style: italic; 
}

table {
    background: #d5e5da;
    border-collapse: collapse;
    box-shadow: inset 0 1px 0 #fff;
    line-height: 24px;
    text-align: left;
    width: 100%;
}   

th {
    background: url(https://jackrugile.com/images/misc/noise-diagonal.png), linear-gradient(#777, #444);
    border-left: 1px solid #555;
    border-right: 1px solid #777;
    border-top: 1px solid #555;
    border-bottom: 1px solid #333;
    box-shadow: inset 0 1px 0 #999;
    color: #fff;
  font-weight: bold;
    padding: 10px 15px;
    position: relative;
    text-shadow: 0 1px 0 #000;  
}

th:after {
    background: linear-gradient(rgba(255,255,255,0), rgba(255,255,255,.08));
    content: '';
    display: block;
    height: 25%;
    left: 0;
    margin: 1px 0 0 0;
    position: absolute;
    top: 25%;
    width: 100%;
}

th:first-child {
    border-left: 1px solid #777;    
    box-shadow: inset 1px 1px 0 #999;
}

th:last-child {
    box-shadow: inset -1px 1px 0 #999;
}

td {
    border-right: 1px solid #fff;
    border-left: 1px solid #e8e8e8;
    border-top: 1px solid #fff;
    border-bottom: 1px solid #e8e8e8;
    padding: 10px 15px;
    position: relative;
    transition: all 300ms;
}

td:first-child {
    box-shadow: inset 1px 0 0 #fff;
}   

td:last-child {
    border-right: 1px solid #e8e8e8;
    box-shadow: inset -1px 0 0 #fff;
}   

tr {
    background: url(https://jackrugile.com/images/misc/noise-diagonal.png); 
}

tr:nth-child(odd) td {
    background: #f1f1f1 url(https://jackrugile.com/images/misc/noise-diagonal.png); 
}

tr:last-of-type td {
    box-shadow: inset 0 -1px 0 #fff; 
}

tr:last-of-type td:first-child {
    box-shadow: inset 1px -1px 0 #fff;
}   

tr:last-of-type td:last-child {
    box-shadow: inset -1px -1px 0 #fff;
}   

tbody:hover td {
    color: transparent;
    text-shadow: 0 0 3px #aaa;
}

tbody:hover tr:hover td {
    color: #444;
    text-shadow: 0 1px 0 #fff;
}
            </style>
 
    </head>
    <body>
        <%!String uname; %>
        <div class="header">
             <h1>Hii <%  session=request.getSession();
                        uname=(String)session.getAttribute("username");
                        out.print(uname);%></h1>
        <h4>Your send mails are under here...</h4>
         </div>

        <br>
        
             <div>     
               <table id="MyTable" class="display" cellspacing="0" width="100%">
                    <thead>
                <tr>
                     <th>Subject</th>
                    <th>Receiver Mail Id </th>
                   
                    <th></th>
                    </tr>
                    </thead>
                    
        <tbody>
                    
  <%
  try {
    java.sql.Connection con;
    java.sql.ResultSet rs;

    Class.forName("org.gjt.mm.mysql.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/"+"maildb","root", "root");
    // out.println ("maildb"+ "database successfully opened.");
    java.sql.Statement st = con.createStatement();
  //  String s1 = (String)session.getAttribute("mailid");
    String s1 =(String)session.getAttribute("mailid");
    rs=st.executeQuery("SELECT * FROM sent where sfrom='"+s1+"'"); 
    while(rs.next()){
      String s =  rs.getString(1);
     %>
     <tr>
          <td><a style="color:black" href="http://localhost:8080/EmailSystem/msgbody.jsp?id=<%out.print(s);%>"><% out.println(rs.getString(4)); %></a></td>
         <td> <a style="color:black" href="http://localhost:8080/EmailSystem/msgbody.jsp?id=<%out.print(s);%>"> <% out.println(rs.getString(2)); %></a> </td>    
    
     <td><a style="color:black" href="http://localhost:8080/EmailSystem/completeDeleteSMail.jsp?id=<%out.print(s);%>">Delete</a></td>
     </tr>
    
     
     <%
    }
  rs.close();
 con.close();
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>
</tbody>
               </table>

              </div>




              
          <div>
            <form action="http://localhost:8080/EmailSystem/logout" method="get">
           <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" name="button" value="Go Back">
            <input type="submit" name="button" value="Logout">
            </form>
        </div>
    </body>
</html>

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class compose extends HttpServlet{
    HttpSession hs;
    Connection co;
    String userid;
    String username;
    String from;
    ResultSet rs;
    Statement st,st1;
    
    public void doPost(HttpServletRequest req, HttpServletResponse rep) throws IOException ,ServletException
    {
        hs=req.getSession();
        co=(Connection)hs.getAttribute("connection");
        userid=(String)hs.getAttribute("sessionid");
        username=(String)hs.getAttribute("username");
        from=(String)hs.getAttribute("mailid");
        String to=req.getParameter("email");
        String subject=req.getParameter("subject");
        String message=req.getParameter("message");
        String button=req.getParameter("button");
        System.out.print("Compose java: Pass 1");
        
        
        if(button.equals("Send Mail")){
        try{
        st=co.createStatement();
        st.executeUpdate("insert into inbox(ito, ifrom, isubject, imessage) values('"+to+"','"+from+"','"+subject+"','"+message+"')");
        st.close();
        
        st1=co.createStatement();
        st1.executeUpdate("insert into sent(sto, sfrom, ssubject, smessage) values('"+to+"','"+from+"','"+subject+"','"+message+"')");
        st1.close();
        System.out.print("Compose java: Pass 2");
        rep.sendRedirect("http://localhost:8080/EmailSystem/home");
        }catch(Exception e1){
        System.out.print("Exception2:"+e1);
        }
            
        }
        
        
        
        else if(button.equals("Save")){
    
            try{
        st=co.createStatement();
        st.executeUpdate("insert into draft(dto, dfrom, dsubject, dmessage) values('"+to+"','"+from+"','"+subject+"','"+message+"')");
        st.close();
        System.out.print("Compose java: Pass 3");
        rep.sendRedirect("http://localhost:8080/EmailSystem/home");
        }catch(Exception e2){
        System.out.print("Exception2:"+e2);
        }
            
        }
        
        
        
        else if(button.equals("Go Back")){
        rep.sendRedirect("http://localhost:8080/EmailSystem/home");
        
        }
        
        
    }
}
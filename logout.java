import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class logout extends HttpServlet
{
    HttpSession hs;
    
   
    public void doGet(HttpServletRequest req, HttpServletResponse rep) throws IOException, ServletException
    {    String button=req.getParameter("button");
      
        System.out.println("pass1");
        
        
        if(button.equals("Logout")){
              hs=req.getSession();
        hs.invalidate();
        rep.sendRedirect("http://localhost:8080/EmailSystem/index.html");
        System.out.println("pass2");
        }
        else if(button.equals("Go Back")){
             System.out.println("go back initiated...pass3");
           rep.sendRedirect("http://localhost:8080/EmailSystem/home"); 
            System.out.println("go back done...pass3");
        }
        
    }
    public void doPut (HttpServletRequest req, HttpServletResponse rep) throws IOException, ServletException{
        System.out.println("pass1..put");
       hs=req.getSession();
        hs.invalidate();
        rep.sendRedirect("http://localhost:8080/EmailSystem/index.html");
        System.out.println("pass2..put"); 
    } 
}
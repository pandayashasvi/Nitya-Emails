import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class validationP extends HttpServlet{
 
	Connection co;
	Statement st;
	ResultSet rs;
        HttpSession hs;

	public void init(){
            System.out.print("pass init");
		try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.print("passs");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/maildb","root","root");
		}catch(Exception e1){
			System.out.print("Exception 1"+e1);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse rep) throws IOException, ServletException{
		
                hs=req.getSession();
                hs.setAttribute("connection", co);
		String s1= req.getParameter("mailId");
		String s2= req.getParameter("password");
             

		PrintWriter pw=rep.getWriter();
                int c=0;
			try{
			st=co.createStatement();
			System.out.print("pass 2");
			rs=st.executeQuery("SELECT userid, username, mailid FROM userinfo where mailid='"+s1+"' and userpassword='"+s2+"'"); 
			while(rs.next()){
		                System.out.print("pass 3");
				c=c+1;
                              String sessionid=rs.getString(1);
                              String username=rs.getString(2);
                              String mailid=rs.getString(3);
                              hs.setAttribute("sessionid", sessionid);
                              hs.setAttribute("username", username);
                              hs.setAttribute("mailid", mailid);
			}
			rs.close();
			st.close();
		        }catch(Exception e2){
			System.out.print("Exception 2"+e2);
		        }
		if(c==0){

                rep.sendRedirect("http://localhost:8080/EmailSystem/loginfailed.jsp");
		}
		else{
			
			//RequestDispatcher rd=req.getRequestDispatcher("home.java");
			//rd.forward(req,rep);
                        rep.sendRedirect("http://localhost:8080/EmailSystem/home");

		}

	}
} 


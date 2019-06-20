import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class signUpP extends HttpServlet{
	Connection co;
	Statement st;
	ResultSet rs;
        HttpSession hs;
         
        
        
	public void init(){
		try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.print("passs");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/maildb","root","root");
		}catch(Exception e1){
			System.out.print("Exception 1"+e1);
		}
	}

	public void doGet(HttpServletRequest req, HttpServletResponse rep) throws IOException, ServletException{
		
                int maxuserid;
                String a="";
		String name= req.getParameter("name");
		String password= req.getParameter("password");
                String address= req.getParameter("address");
                String sex= req.getParameter("sex");
                String mailid;
               
                
			try{
			st=co.createStatement();
			System.out.print("pass 2");
			rs=st.executeQuery("select max(userid) from userinfo"); 
                        while(rs.next())
                        {
                          a=rs.getString(1);
                          
                        }
			rs.close();
			st.close();
		        }catch(Exception e2){
			System.out.print("Exception 2"+e2);
		        }
                        
                            maxuserid=Integer.parseInt(a);
                           maxuserid=maxuserid+1;
                           a=Integer.toString(maxuserid);
                           mailid=name+a+"@metacube.com";
                           System.out.print(mailid);
                       
                      
                       try{
			st=co.createStatement();
			System.out.print("pass 3");
			st.executeUpdate("insert into userinfo (username,userpassword,useraddress,gender,mailid) values('"+name+"','"+password+"','"+address+"','"+sex+"','"+mailid+"')"); 
                        st.close();
             
		        }catch(Exception e3){
			System.out.print("Exception 3"+e3);
		        }
                       
                       System.out.println("pass4");
                       rep.sendRedirect("http://localhost:8080/EmailSystem/notifymail.jsp?id="+mailid);
                       //code of pop up here.............
                     
                
                        //System.out.println("pass5");
                        //rep.sendRedirect("http://localhost:8080/EmailSystem/index.html");
                       
                       
                       
                        
                        
		

	}
} 


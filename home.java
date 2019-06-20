/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package home;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Yashasvi Pandey
 */
public class home extends HttpServlet {
  HttpSession hs;
  PrintWriter pw;
  String uname;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        hs=request.getSession();
        uname=(String)hs.getAttribute("username");
        pw=response.getWriter();
        pw.print("<!DOCTYPE html>\n" +
"<html>\n" +
"    <head>\n" +
"        <title>Home Page</title>\n" +
"        <meta charset=\"UTF-8\">\n" +
"        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
"        <style>\n" +
"/* Style the body */\n" +
"body {\n" +
"  font-family: Arial;\n" +
"  margin: 0;\n" +
"}\n" +
"\n" +
"/* Header/Logo Title */\n" +
".header {\n" +
"  padding: 60px;\n" +
"  text-align: center;\n" +
"  background: #1abc9c;background-image: url(\"pic/usa-2777088_1920.jpg\");\n" +
"  background-position: center;\n" +
"  background-repeat: no-repeat;\n" +
"  background-size: cover;\n" +
"  color: white;\n" +
"  font-size: 30px;\n" +
"}\n" +
"\n" +
"/* Page Content */\n" +
".content {padding:20px;}\n" +
"</style>\n" +
"\n" +
"  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\n" +
"  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js\"></script>\n" +
"  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\n" +
"  <style>\n" +
"  .fakeimg {\n" +
"    height: 200px;\n" +
"    background: #aaa;\n" +
"  }\n" +
"  </style>\n" +
"    </head>\n" +
"    <body bgcolor=\"#E6E6FA\">\n" +
"      \n" +
"        \n" +
"        <div class=\"header\">\n" +
"        <h1>Welcome "+uname+"</h1>\n" +
"        <p>to Nitya Email Platform.</p>\n" +
"        \n" +
"        </div>\n" +
"        \n" +
"        <div class=\"content\">\n" +
"         <ul class=\"nav nav-pills nav-stacked\">\n" +
"            <li class=\"active\"><a href=\"compose.html\">Compose</a></li>\n" +
"        <li class=\"active\"><a href=\"inbox.jsp\">Inbox</a></li>\n" +
"        <li class=\"active\"><a href=\"draft.jsp\">Draft</a></li>\n" +
"        <li class=\"active\"><a href=\"sent.jsp\">Sent</a></li>\n" +
"        <li class=\"active\"><a href=\"trash.jsp\">Trash</a></li>\n" +
      
"        </ul>\n" +
"            </div>\n" +
"        \n" +
"        <div>\n" +
"            <form action=\"http://localhost:8080/EmailSystem/logout\" method=\"get\">\n" +
"            <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<input type=\"submit\" name=\"button\" value=\"Logout\">\n" +
"            </form>\n" +
"        </div>\n" +
"    </body>\n" +
"</html>\n" +
"");
        
     
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

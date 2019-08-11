/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.security.*;
import java.math.*;

/**
 *
 * @author NITHISHKUMAR K R
 */
public class AddOb extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public String hashPassword(String password){
        try { 
            // Static getInstance method is called with hashing MD5 
            MessageDigest md = MessageDigest.getInstance("MD5"); 
  
            // digest() method is called to calculate message digest 
            //  of an input digest() return array of byte 
            byte[] messageDigest = md.digest(password.getBytes()); 
  
            // Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, messageDigest); 
  
            // Convert message digest into hex value
            String hashtext = no.toString(16); 
            while (hashtext.length() < 32) { 
                hashtext = "0" + hashtext; 
            } 
            //out.println(hashtext);
            return hashtext;
        }  
  
            // For specifying wrong message digest algorithms 
            catch (NoSuchAlgorithmException e) 
            {
                throw new RuntimeException(e); 
            } 
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter obj = response.getWriter();
        
        String name = request.getParameter("username");
        String club = request.getParameter("club");
        String rollno = request.getParameter("rollno");
        String dept = request.getParameter("dept");
        String password = hashPassword("clubob");
        String username="";
        for(int i=0;i<name.length();i++){
            char c = name.charAt(i);
            if(c!='@')
                username += String.valueOf(c);
            else
                break;
        }
        try{
            Connection con;
            PreparedStatement ps;
            ResultSet rs;

            String driverName = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/club";
            String user = "root";
            String dbpsw = "system";

            String sql = "insert into detail(email, password, rollno, department, username, type, club) values('"+name+"',"
                    + "'"+password+"', '"+rollno+"', "
                    + "'"+dept+"', '"+username+"','ob', '"+club+"');";
            
            //String sql = "insert into detail(email, password, rollno, department, username, type, club) values(?,?,?,?,?,?)";
            Class.forName(driverName);
            con = (Connection)DriverManager.getConnection(url, user, dbpsw);
            /*
            ps = (PreparedStatement)con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setString(3, rollno);
            ps.setString(4, username);
            ps.setString(5, "ob");
            ps.setString(6, club);
            
            ps.executeQuery();
            */
            Statement stmt = con.createStatement();
            stmt.executeUpdate(sql);
            
            obj.println("<script>alert('Added Successfully')</script>");
            response.sendRedirect("http://localhost:8080/MepcoClubServer/components/LoggedInPage.jsp");
        }
        catch(ClassNotFoundException | SQLException ex){
            obj.println(ex);
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddOb</title>");    
            
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
        }
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

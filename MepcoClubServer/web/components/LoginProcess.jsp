<%-- 
    Document   : LoginProcess.jsp
    Created on : 17 Mar, 2019, 7:58:08 PM
    Author     : NITHISHKUMAR K R
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.security.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../img/collegeLogo.jpg">
    </head>
    <body>
        <% String hashtext="";
           String password="";
           String email="";
           String redirectUrl = "http://localhost:8080/MepcoClubServer/components/";
           String redirect = "";
        %>
        <%
            try{
                email = request.getParameter("email");
                password = request.getParameter("password"); 
                //out.println(email+" "+password);
                Cookie cookie[] = request.getCookies();
                
            }
            catch(Exception ex){
                out.println(ex);
                %>
                <jsp:forward page="Login.jsp"></jsp:forward>
                <%
            }
        
        %>
        
        <%
            //Hashing method MD5 :-)
            try { 
            // Static getInstance method is called with hashing MD5 
            MessageDigest md = MessageDigest.getInstance("MD5"); 
  
            // digest() method is called to calculate message digest 
            //  of an input digest() return array of byte 
            byte[] messageDigest = md.digest(password.getBytes()); 
  
            // Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, messageDigest); 
  
            // Convert message digest into hex value 
            hashtext = no.toString(16); 
            while (hashtext.length() < 32) { 
                hashtext = "0" + hashtext; 
            } 
            //out.println(hashtext);
        }  
  
            // For specifying wrong message digest algorithms 
            catch (NoSuchAlgorithmException e) 
            {
                %>
                <jsp:forward page="Login.jsp"></jsp:forward>
                <%
                throw new RuntimeException(e); 
            } 
        %>
        
        <%
            Connection con= null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            String driverName = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/club";
            String user = "root";
            String dbpsw = "system";

            String sql = "select password, type, username from detail where email="+"'"+email+"';";
        
            Class.forName(driverName);
            con = (Connection)DriverManager.getConnection(url, user, dbpsw);
            ps = (PreparedStatement)con.prepareStatement(sql);
            rs = (ResultSet)ps.executeQuery();
            String dbPasswd="", userType="", username="";
            int flag = 1;
            Cookie user_cook= new Cookie("username",null);
            Cookie type_cook= new Cookie("type", null);
            while(rs.next())
            {
                dbPasswd = rs.getString("password");
                userType = rs.getString("type");
                username = rs.getString("username");
                user_cook = new Cookie("username", username);
                type_cook = new Cookie("type", userType);
                if(dbPasswd.equals(hashtext)){
                    out.println("<br><br><br>welcome "+username+" ,");
                    flag = 0;
                    out.println(username+" "+userType);
                    
                    out.println("<script>alert('Cookie Added');</script>");
                    response.addCookie(user_cook);
                    response.addCookie(type_cook);
                    
                    redirect = redirectUrl+"LoggedInPage.jsp";
                    out.println(redirect);
                    response.sendRedirect(redirect);
                }
                else{
                    %>
                <jsp:forward page="Login.jsp"></jsp:forward>
                    <%
                }
            }
            if(flag==1){
                    %>
                <jsp:forward page="Login.jsp"></jsp:forward>
                    <%
            }
           %>
    </body>
</html>

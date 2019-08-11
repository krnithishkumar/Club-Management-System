<%-- 
    Document   : math
    Created on : 25 Mar, 2019, 8:03:11 PM
    Author     : NITHISHKUMAR K R
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Math Club</title>
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../../css/style.css">
        <link rel="icon" href="../../img/coCurricular/math.png">
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-secondary" id="navBar">
            <div class="container">
               <ul class="navbar-nav">
                  <li class="nav-item" id="titleArena">
                      Math Club
                  </li>
                </ul>
                
                <div>
                    <a href="../../index.html">
                        <img src="../../img/collegeLogo.jpg" alt="not available" width="100" height="100" class="img-thumbnail">
                    </a>
                </div>
                <div>
                    <img src="../../img/coCurricular/math.png" alt="not available" width="50" height="50" class="img-thumbnail">
                </div>
            </div>
        </nav>
        <section class="testimonials text-center bg-light" id="about">
            <div class="container">
              <h2 class="mb-5" >About Us</h2>
               <div class="row">
                       <p>
                        Math club is excellent Platform to develop communication skills, soft skills,
                        Management skills, etc.Necessity is not only the mother of Invention but also 
                        of Innovation.Innovative and creative ideas are the means to thrive in this world. 
                        The main aim of this club is to create intuition in terms of creative 
                        design ideas in various fields in an aesthetic approach. Innovative club 
                        assists students and also encourages young talents minds, by providing 
                        them a perfect platform for show casing their talents, work together as
                        teams and participate in various competitions. It also serves to provide
                        the students a platform to excel in their specialized area of interest. 
                        Since then the introduction of the club a decade back during 2005, it is
                        serving as a platform to showcase and build up the student talents in their
                        own streams.    
                        </p>
               </div>
            </div>
        </section>
        <table class="table table-striped" width="50%" height="50%" align="center" style="text-align: center">
            <tr>
                <td>Staff In-charge</td>
                <td>Deepa Laxmi AP Mathematics</td>
            </tr>
        </table>
        <h1 style="text-align: center">Events</h1>
        <table class="table table-hover" style="text-align: center">
            <thead class="thead-dark">
            <tr>
                <th>Sl No.</th>
                <th>Date</th>
                <th>Event Name</th>
            </tr>
            </thead>
            <%
                Connection con= null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                String driverName = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/club";
                String user = "root";
                String dbpsw = "system";

                String sql = "select Date, eventname from event where club='math' order by Date desc;";

                Class.forName(driverName);
                con = (Connection)DriverManager.getConnection(url, user, dbpsw);
                ps = (PreparedStatement)con.prepareStatement(sql);
                rs = (ResultSet)ps.executeQuery();

                int flag = 1;
                while(rs.next())
                {
                    String date_value = rs.getString("Date");
                    String event = rs.getString("eventname");
                    %>
                    <tr>
                    <td>
                    <%
                        out.println(flag);
                        flag++;
                    %>
                    </td>
                    <td>
                    <%
                        out.println(date_value);
                    %>
                    </td>
                    <td>
                    <%
                        out.println(event);
                    %>
                    </td>
                    </tr>
                    <%
                }
               %>
            </tr>
        </table>
    </body>
</html>

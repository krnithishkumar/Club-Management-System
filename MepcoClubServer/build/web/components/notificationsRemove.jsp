<%-- 
    Document   : notifications
    Created on : 25 Mar, 2019, 10:24:54 PM
    Author     : NITHISHKUMAR K R
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notifications</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../img/extraCurricular/photography.png">
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-secondary" id="navBar">
            <div class="container">
               <ul class="navbar-nav">
                  <li class="nav-item" id="titleArena">
                      Delete Events
                  </li>
                </ul>

            </div>
        </nav>
        
        
        <%
            java.util.Date now = new java.util.Date();
            String now_str = String.valueOf(now);
            String arr[] = now_str.split("\\s");
            //out.println(now_str+" "+(now.getMonth()+1));
            String dateValue = "2019-"+String.valueOf((now.getMonth()+1))+"-"+arr[2];
            dateValue = "'"+dateValue+"'";
        %>
        
        
        <div>
        <h1 style="text-align: center">Remove Events</h1>
        <form action="/MepcoClubServer/RemoveEvent" method="GET">
        <table class="table table-hover" style="text-align: center">
            <thead class="thead-dark">
            <tr>
                <th>Sl No.</th>
                <th>Date</th>
                <th>Event Name</th>
                <th>CLUB</th>
                <th>Venue</th>
                <th>Delete</th>
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
                String sql_today = " select * from event where date="+dateValue+";";
                
                Class.forName(driverName);
                con = (Connection)DriverManager.getConnection(url, user, dbpsw);
                
                ps = con.prepareStatement(sql_today);
                rs = ps.executeQuery();
                int flag = 1;
                
                String sql = "select Date, eventname, club, venue from event where date <"+dateValue+"order by Date asc;";

                
                ps = (PreparedStatement)con.prepareStatement(sql);
                rs = (ResultSet)ps.executeQuery();

                flag = 1;
                while(rs.next())
                {
                    String date_value = rs.getString("Date");
                    String event = rs.getString("eventname");
                    String clubName = rs.getString("club");
                    String venue = rs.getString("venue");
                    String arr_date[] = date_value.split("-");
                    String datePrint = arr_date[2]+"-"+arr_date[1]+"-"+arr_date[0];
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
                        out.println(datePrint);
                    %>
                    </td>
                    <td>
                        <input type="text" value="<%out.println(event);%>" name="eventName" id="nameValue">
                    </td>
                    <td class="text-uppercase">
                    <%
                        out.println(clubName);
                    %>
                    </td>
                    <td>
                    <%
                        out.println(venue);
                    %>
                    </td>
                    
                    <td>
                        <input type="submit" value="delete" class="btn badge-danger">
                    </td>
                    </tr>
                    <%
                }
               %>
            </tr>
        </table>
        </form>
        </div>
            <script>
                function doIt(){
                    alert("hai");
                    alert(document.getElementById("nameValue").value);
                }
                </script>
    </body>
</html>

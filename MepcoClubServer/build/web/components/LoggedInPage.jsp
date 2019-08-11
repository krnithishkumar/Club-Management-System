<%-- 
    Document   : AdminLoggedInPage.jsp
    Created on : 17 Mar, 2019, 11:27:44 PM
    Author     : NITHISHKUMAR K R
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../img/collegeLogo.jpg">
        <script type="text/javascript" src="../js/click.js"></script>
    </head>
    <body onload="setIt()">
        <%
            String driverName = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/club";
            String user = "root";
            String dbpsw = "system";
            String redirectUrl = "http://localhost:8080/MepcoClubServer/components/";
        %>
        
        <%
            Cookie cookie[] = request.getCookies();
            String redirect="";
            String cook_user="";
            String cook_type="";
            if(cookie==null){
                redirect = redirectUrl+"Login.jsp";
                out.println(redirect);
                response.sendRedirect(redirect);
            }
            else{
                for(int i=0;i<cookie.length;i++){
                    //out.println("<script>alert('"+cookie[i].getValue()+" "+cookie[i].getName()+"');</script>");
                    if(cookie[i].getName().equals("username"))
                    {
                        cook_user = cookie[i].getValue();
                        //out.println("<script>alert('"+cook_user+"');</script>");
                    }
                    if(cookie[i].getValue().equals("admin")){
                        out.println("<input type='hidden' value='admin' id='displaySubmenu'/>");
                    }
                    if(cookie[i].getValue().equals("ob")){
                        cook_user = cookie[i].getName();
                        out.println("<input type='hidden' value='ob' id='displaySubmenu'/>");
                    }    
                }
            }
        %>
        <div>
            <table  width="100%"  border="1" >
                <tr>
                    <td colspan="2">
                          <jsp:include page="HeaderLogout.jsp"></jsp:include>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">Welcome <%out.println(cook_user);%>,</td>
                </tr>
                <tr>
                    <td><center>
                            <div class="list-group">
                                <span href="#" class="list-group-item active">
                                    Actions
                                    <span class="pull-right" id="slide-submenu">
                                        <i class="fa fa-times"></i>
                                    </span>
                                </span>
                                <span class="adminSubMenu">
                                <a href="#" class="list-group-item" onclick="displayAddOb()" id="adminSubMenu">
                                    Add OB
                                </a>
                                </span>
                                <span class="adminSubMenu">
                                <a href="#" class="list-group-item" onclick="displayRemoveOb()" id="adminSubMenu">
                                    Remove OB
                                </a>
                                </span>
                                <span class="adminSubMenu" onclick="displayViewOb()">
                                <a href="#" class="list-group-item">
                                    View Ob
                                </a>
                                </span>
                                <span class="obSubMenu" onclick="displayAddEvent()">
                                <a href="#" class="list-group-item">
                                    Add Event
                                </a>
                                </span>
                                <span class="obSubMenu">
                                <a href="#" class="list-group-item" onclick="displayRemoveEvent()" >
                                    Remove Event
                                </a>
                                </span>
                                <span class="obSubMenu" onclick="displayViewMembers()">
                                <a href="#" class="list-group-item" >
                                    View Club Members
                                </a>
                                </span>
                                <span>
                                <a href="#" class="list-group-item" onclick="displayChangePassword()">
                                    Change Password
                                </a>
                                </span>
                                </div>        
                </center>
                    </td>
                     <td id="intro">You can do some operations by choosing the sub menu</td>
                    <td>
                        <div id="addOb">
                            <form action="/MepcoClubServer/AddOb" method="POST">
                            <table id="submenuTable" align="center" border='1'>
                                
                                <tr>
                                    <td>Choose Club: </td>
                                    <td>
                                        <select name="club">
                                            <option value="google">Google</option>
                                            <option value="math">Math</option>
                                            <option value="microsoft">Microsoft</option>
                                            <option value="csi">CSI</option>
                                            <option value="innovative">Innovative</option>
                                            <option value="health">Health</option>
                                            <option value="finearts">Fine Arts</option>
                                            <option value="photography">Photography</option>
                                        </select>   
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email: </td>
                                    <td><input type="email" name="username" size="30" required></td>
                                </tr>
                                <tr>
                                    <td>Roll Number: </td>
                                    <td><input type="text" name="rollno" size="10" required></td>
                                </tr>
                                <tr>
                                    <td>Department: </td>
                                    <td>
                                        <select name="dept">
                                            <option value="it">IT</option>
                                            <option value="cse" selected>CSE</option>
                                            <option value="ece">ECE</option>
                                            <option value="others">Other</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="submit" width="50%">
                                    </td> 
                                </tr>
                            </table>
                            </form>
                        </div>
                        <div id="removeOb">
                            <form action="/MepcoClubServer/RemoveOb" method="POST">
                            <table id="submenuTable" align="center" border='1'>
                                <tr>
                                    <td>Choose User: </td>
                                    <td>
                                    <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/club" user="root" password="system"/>
                                    <sql:query var="ob">
                                        select * from detail where type='ob';
                                    </sql:query> 
                                    <input list="users" name="users">
                                        <datalist id="users">
                                            <c:forEach var="detail" items="${ob.rows}">
                                                <option size="30">
                                                    <c:out value="${detail.email}" />   
                                                    <c:out value="${detail.rollno}" />
                                                </option>
                                            </c:forEach>
                                        </datalist>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="submit" width="50%">
                                    </td> 
                                </tr>
                            </table>
                            </form>
                        </div>
                                    
                        <div id="viewOb">
                            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/club" user="root" password="system"/>
                            <sql:query var="ob">
                                select * from detail where type='ob';
                            </sql:query> 
                                        
                            <table class="table table-hover" style="text-align: center">
                                <thead class="thead-dark">
                                <tr>
                                    <th>Name</th>
                                    <th>ROLL NO</th>
                                    <th>DEPARTMENT</th>
                                    <th>CLUB</th>
                                </tr>
                                <c:forEach var="detail" items="${ob.rows}">
                                    <tr>
                                        <td><c:out value="${detail.email}" /></td>   
                                        <td class="text-uppercase"><c:out value="${detail.rollno}" /></td>
                                        <td class="text-uppercase"><c:out value="${detail.department}" /></td>
                                        <td class="text-uppercase"><c:out value="${detail.club}" /></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>      
                                    
                        <div id="addEvent">
                            <form action="/MepcoClubServer/AddEvent" method="POST">
                            <table id="submenuTable" align="center" border='1'>
                                
                                <tr>
                                    <td>Choose Club: </td>
                                    <td>
                                        <select name="club">
                                            <option value="google">Google</option>
                                            <option value="math">Math</option>
                                            <option value="microsoft">Microsoft</option>
                                            <option value="csi">CSI</option>
                                            <option value="innovative">Innovative</option>
                                            <option value="health">Health</option>
                                            <option value="finearts">Fine Arts</option>
                                            <option value="photography">Photography</option>
                                        </select>   
                                    </td>
                                </tr>
                                <tr>
                                    <td>Event Name: </td>
                                    <td><input type="text" name="eventName" size="30" required></td>
                                </tr>
                                <tr>
                                    <td>Date: </td>
                                    <td><input type="date" name="eventDate" required></td>
                                </tr>
                                <tr>
                                    <td>Venue: </td>
                                    <td>
                                        <input list="venue" name="venue">
                                        <datalist id="venue">
                                            <option value="SSL Lab">
                                            <option value="ECE Seminar Hall">
                                            <option value="AJ 20">
                                            <option value="Mech Seminar Hall">
                                            <option value="ADA Lab">
                                            <option value="Physics Lab">
                                            <option value="EEE Seminar Hall">
                                            <option value="GBL Lab">
                                            <option value="MCC">
                                        </datalist>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="submit" width="50%">
                                    </td> 
                                </tr>
                            </table>
                            </form>
                        </div>
                         
                        <div id="removeEvent">
                            <form action="/MepcoClubServer/RemoveEvent" method="POST">
                            <table id="submenuTable" align="center" border='1'>
                                <tr>
                                    <td>Remove Event</td>
                                    <td><a href="notificationsRemove.jsp" class="btn btn-danger" taget="">Go</a></td>
                                </tr>
                            </table>
                            </form>
                        </div>
                            
                        
                         <div id="viewMembers">
                            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/club" user="root" password="system"/>
                            <sql:query var="ob">
                                select * from members;
                            </sql:query> 
                                        
                            <table class="table table-hover" style="text-align: center">
                                <thead class="thead-dark">
                                <tr>
                                    <th>Email</th>
                                    <th>ROLL NO</th>
                                    <th>DEPARTMENT</th>
                                    <th>CLUB</th>
                                </tr>
                                <c:forEach var="detail" items="${ob.rows}">
                                    <tr>
                                        <td><c:out value="${detail.email}" /></td>   
                                        <td class="text-uppercase"><c:out value="${detail.rollno}" /></td>
                                        <td class="text-uppercase"><c:out value="${detail.department}" /></td>
                                        <td class="text-uppercase"><c:out value="${detail.club}" /></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                            
                           
                        <!------------------------------------------------------------------>            
                        <div id="changePassword">
                            <form action="/MepcoClubServer/ChangePassword" method="POST">
                            <table id="submenuTable" align="center" border='1'>
                                
                                <tr>
                                    <td>Email</td>
                                    <td>
                                        <input type="text" name="emailGet" value="<%=cook_user%>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>New Password: </td>
                                    <td>
                                        <input type="password" name="chpwd" id="retypeIt1">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Re-Type New Password: </td>
                                    <td>
                                        <input type="password" name="chpwd" id="retpeIt2">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="submit" width="50%">
                                    </td> 
                                </tr>
                            </table>
                            </form>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        
    </body>
</html>

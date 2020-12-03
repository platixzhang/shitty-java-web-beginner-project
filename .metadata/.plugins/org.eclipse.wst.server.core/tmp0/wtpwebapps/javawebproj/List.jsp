<%@ page import="webproject.JDBCKonnekt" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>LIST | Student Management System</title>
</head>
<body>
<div class="container" >
<center> <h3>Users</h3> </center>
    <form id="form2">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th style="text-align: center">username</th>
                <th style="text-align: center">password</th>
            </tr>
            <c:forEach var="Users" items="${usersList}" >
                <tr>
                    <td align="center">${Users.username}</td>
                    <td align="center">${Users.password}</td>
                </tr>
            </c:forEach>
        </table>
     </form>
</div>
<div class="container" >
<center> <h3>Persons</h3> </center>
    <form id="form2">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th style="text-align: center">username</th>
                <th style="text-align: center">name</th>
                <th style="text-align: center">age</th>
                <th style="text-align: center">teleno</th>
            </tr>
            <c:forEach var="Person" items="${personList}" >
                <tr>
                    <td align="center">${Person.username}</td>
                    <td align="center">${Person.name}</td>
                    <td align="center">${Person.age}</td>
                    <td align="center">${Person.teleno}</td>
                </tr>
            </c:forEach>
        </table>
     </form>
</div>

<center><h4><a href="test.jsp">RETURN TO INDEX</a></h4> </center>

<%
JDBCKonnekt jk = (JDBCKonnekt)getServletConfig().getServletContext().getAttribute("jk");
%>
</body>
</html>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>DATA OPERATION | Student Management System</title>
</head>
<body>
	<center><h3>Add Person Result</h3></center>
	<c:choose>
        <c:when test="${returnType==0&&operatorResult==0}">
            <h2 align="center">person:${username}&nbsp;Insert Failed!</h2>
        </c:when>
        <c:when test="${returnType==0&&operatorResult==1}">
            <h2 align="center">person:${username}&nbsp;Insert Successful!</h2>
        </c:when>
        <c:when test="${returnType==0&&operatorResult==2}">
            <h2 align="center">person:${username}&nbsp;Update Failed!</h2>
        </c:when>
        <c:when test="${returnType==0&&operatorResult==3}">
            <h2 align="center">person:${username}&nbsp;Update Successful!</h2>
        </c:when>
        <c:when test="${returnType==1&&operatorResult==0}">
            <h2 align="center">user:${username}&nbsp;Delete User Failed! (No User Found)</h2>
        </c:when>
        <c:when test="${returnType==1&&operatorResult==1}">
            <h2 align="center">user:${username}&nbsp;Delete User Successful!</h2>
        </c:when>
        <c:when test="${returnType==2&&operatorResult==0}">
            <h2 align="center">user:${username}&nbsp;Delete Person Failed! (No Person Found)</h2>
        </c:when>
        <c:when test="${returnType==2&&operatorResult==1}">
            <h2 align="center">user:${username}&nbsp;Delete Person Successful!</h2>
        </c:when>
        <c:when test="${returnType==3&&operatorResult==0}">
            <h2 align="center">user:${username}&nbsp;Password set Failed!(No User)</h2>
        </c:when>
        <c:when test="${returnType==3&&operatorResult==1}">
            <h2 align="center">user:${username}&nbsp;Password set Successful!(No User)</h2>
        </c:when>
        <c:otherwise>
            <h4>Error Happened!</h4>
        </c:otherwise>
    </c:choose>
    <form action="${pageContext.request.contextPath}/listInfoServlet" onsubmit="return checkList()" method="post">
    <div class="form-group" style="text-align: center">
	<center>
              <input class="btn btn-primary" type="submit" value="CHECK YOUR LIST" />
              <center><h4><a href="test.jsp">RETURN TO INDEX</a></h4> </center>
    </center>
    </div>
    </form>
</body>
</html>
<%@ page import="java.util.Date" %>
<%@ page import="webproject.JDBCKonnekt" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>INDEX | Student Management System</title>

      <script type="text/javascript">
	      function checkUsername()
		  {
	          var flag = true;
	          var element = document.getElementById("username").value;
	          var regNumber = /^.{0,10}$/ ;
	          if(element==""||element==null) {
	              return false;
	          }
	          else if(!regNumber.test(element)) {
	              alert("Username's length should be no more than 10!");
	              flag = false;
	          }
	          if(flag) document.getElementById("usernamespan").innerHTML=
	        	  "<font style='color:green;font-size:15px' <b>VALID</b> </font>"
	          else document.getElementById("usernamespan").innerHTML=
	        	  "<font style='color:red;font-size:15px' <b>INVALID</b> </font>"
	          return flag;
	      }
	      
	      function checkUsername2()
		  {
	          var flag = true;
	          var element = document.getElementById("username2").value;
	          var regNumber = /^.{0,10}$/ ;
	          if(element==""||element==null) {
	              return false;
	          }
	          else if(!regNumber.test(element)) {
	              alert("Username's length should be no more than 10!");
	              flag = false;
	          }
	          if(flag) document.getElementById("usernamespan2").innerHTML=
	        	  "<font style='color:green;font-size:15px' <b>VALID</b> </font>"
	          else document.getElementById("usernamespan2").innerHTML=
	        	  "<font style='color:red;font-size:15px' <b>INVALID</b> </font>"
	          return flag;
	      }
	      
	      function checkUsername3()
		  {
	          var flag = true;
	          var element = document.getElementById("username3").value;
	          var regNumber = /^.{0,10}$/ ;
	          if(element==""||element==null) {
	              return false;
	          }
	          else if(!regNumber.test(element)) {
	              alert("Username's length should be no more than 10!");
	              flag = false;
	          }
	          if(flag) document.getElementById("usernamespan3").innerHTML=
	        	  "<font style='color:green;font-size:15px' <b>VALID</b> </font>"
	          else document.getElementById("usernamespan3").innerHTML=
	        	  "<font style='color:red;font-size:15px' <b>INVALID</b> </font>"
	          return flag;
	      }
	      
	      function checkUsername4()
		  {
	          var flag = true;
	          var element = document.getElementById("username4").value;
	          var regNumber = /^.{0,10}$/ ;
	          if(element==""||element==null) {
	              return false;
	          }
	          else if(!regNumber.test(element)) {
	              alert("Username's length should be no more than 10!");
	              flag = false;
	          }
	          if(flag) document.getElementById("usernamespan4").innerHTML=
	        	  "<font style='color:green;font-size:15px' <b>VALID</b> </font>"
	          else document.getElementById("usernamespan4").innerHTML=
	        	  "<font style='color:red;font-size:15px' <b>INVALID</b> </font>"
	          return flag;
	      }
	      
          function checkName()
		  {
              var flag = true;
              var element = document.getElementById("name").value;
              var regNumber = /^.{0,10}$/ ;
              if(element==""||element==null){
                  return false;
              }
              if(!regNumber.test(element)) {
                  alert("Name's length should be no more than 10!");
                  flag = false;
              }
              if(flag) document.getElementById("namespan").innerHTML=
            	  "<font style='color:green;font-size:15px' <b>VALID</b> </font>"
              else document.getElementById("namespan").innerHTML=
            	  "<font style='color:red;font-size:15px' <b>INVALID</b> </font>"
              return flag;
          }
          
          function checkAge()
		  {
              var flag = true;
              var element = document.getElementById("age").value;
              var regNumber = /^[0-9]+$/ ;
              if(element==null||element=="") return false;
              if(!regNumber.test(element)) {
                  alert("Age's type should be integer!");
                  flag = false;
              }
              if(flag) document.getElementById("agespan").innerHTML=
                  "<font style='color:green;font-size:15px' <b>VALID</b> </font>"
              else document.getElementById("agespan").innerHTML=
                  "<font style='color:red;font-size:15px' <b>INVALID</b> </font>"
              return flag;
          }

          function checkTeleno()
          {
              var flag = true;
              var element = document.getElementById("teleno").value;
              var regNumber = /^1[3456789]\d{9}$/ ;					//This is how teleno works
              if(element==""||element==null) return flag;
              if(!regNumber.test(element)) {
                  alert("Telenum's format is wrong!");
                  flag = false;
              }
              if(flag) document.getElementById("telenospan").innerHTML=
            	  "<font style='color:green;font-size:15px' <b>VALID</b> </font>"
              else document.getElementById("telenospan").innerHTML=
            	  "<font style='color:red;font-size:15px' <b>INVALID</b> </font>"
              return flag;
          }
          function checkSubmit1() {
              if(document.getElementById("username").value==null||document.getElementById("username").value==""){
                  alert("Please input person'username !");
                  document.getElementById("usernamespan").innerHTML=
                      "<font style='color:red;font-size:15px' <b>username is empty</b> </font>"
                  return false;
              }
              if (document.getElementById("name").value==null||document.getElementById("name").value==""){
                  alert("Please input person'name!");
                  document.getElementById("namespan").innerHTML=
                      "<font style='color:red;font-size:15px' <b>name is empty</b> </font>"
                  return false;
              }
              var flag = checkTelenum()&&checkAge()&&checkUsername1()&&checkName();
              if(!flag){
                  alert("Submit Error!")
              }
              return flag;
          }

          function checkSubmit2() {
        	  if(document.getElementById("username2").value==null||document.getElementById("username2").value==""){
                  alert("Please input username !");
                  document.getElementById("usernamespan2").innerHTML=
                      "<font style='color:red;font-size:15px' <b>username is empty</b> </font>"
                  return false;
              }
              var flag = checkUsername2()
              if(!flag){
                  alert("Submit Error!")
              }
              return flag;
          }
          
          function checkSubmit3() {
        	  if(document.getElementById("username3").value==null||document.getElementById("username3").value==""){
                  alert("Please input username !");
                  document.getElementById("usernamespan3").innerHTML=
                      "<font style='color:red;font-size:15px' <b>username is empty</b> </font>"
                  return false;
              }
              var flag = checkUsername3()
              if(!flag){
                  alert("Submit Error!")
              }
              return flag;
          }
          
          function checkPassword()
          {
        	  if (document.getElementById("username4").value==null||document.getElementById("username4").value==""||!checkUsername4()){
                  alert("Username invalid!");
                  document.getElementById("usernamespan4").innerHTML=
                      "<font style='color:red;font-size:15px' <b>name is empty</b> </font>"
                  return false;
              }
          }
      </script>

</head>
<body>
<%
        JDBCKonnekt jk = new JDBCKonnekt();
        application.setAttribute("jk",jk);
%>
<div class="container">

<center> <h3>Insert Person Info</h3> </center>
<form action="${pageContext.request.contextPath}/addPersonServlet" onsubmit="return checkSubmit1()" method="post">
	<div class="form-group">
	<center>
	<label align="center" style="text-align:center">User Name </label><span id="usernamespan"></span>
	<input type="text" class="form-control" id="username" name="username" size="25" maxlength="15" value="" onblur="checkUsername()" align="center" placeholder="type user name here">
	</center>
	</div>
	<div class="form-group">
	<center>
	<label align="center" style="text-align:center">Name </label><span id="namespan"></span>
	<input type="text" class="form-control" id="name" name="name" size="25" maxlength="20" value="" onblur="checkName()" align="center" placeholder="type name here">
	</center>
	</div>
	<div class="form-group">
	<center>
	<label align="center" style="text-align:center">Age </label><span id="agespan"></span>
	<input type="text" class="form-control" id="age" name="age" size="25" maxlength="4" value="" onblur="checkAge()" align="center" placeholder="type current age here">
	</center>
	</div>
	<div class="form-group">
	<center>
	<label align="center" style="text-align:center">Phone Number </label><span id="telenospan"></span>
	<input type="text" class="form-control" id="teleno" name="teleno"  size="25" maxlength="20" value="" onblur="checkTeleno()" align="center" placeholder="type phone number here">
	</center>
	</div>
	<div class="form-group" style="text-align: center">
	<center>
              <input class="btn btn-primary" type="submit" value="SUBMIT" />
              <input class="btn btn-default" type="reset" value="RESET" />
    </center>
    </div>
</form>
</div>
    
<div class="container">    
<center> <h3>Delete Users</h3> </center>
	<form action="${pageContext.request.contextPath}/delUserServlet" onsubmit="return checkSubmit2()" method="post">
	<div class="form-group">
	<center>
	<label align="center" style="text-align:center">User Name </label><span id="usernamespan2"></span>
	<input type="text" class="form-control" id="username2" name="username2" size="25" maxlength="15" value="" onblur="checkUsername2()" align="center" placeholder="type user name here">
	</center>
	</div>
	
	<div class="form-group" style="text-align: center">
	<center>
              <input class="btn btn-primary" type="submit" value="SUBMIT" />
              <input class="btn btn-default" type="reset" value="RESET" />
    </center>
    </div>
	</form>
</div>

<div class="container"> 
<center> <h3>Delete Person</h3> </center>
	<form action="${pageContext.request.contextPath}/delPersonServlet" onsubmit="return checkSubmit3()" method="post">
	<div class="form-group">
	<center>
	<label align="center" style="text-align:center">User Name </label><span id="usernamespan3"></span>
	<input type="text" class="form-control" id="username3" name="username3" size="25" maxlength="15" value="" onblur="checkUsername3()" align="center" placeholder="type user name here">
	</center>
	</div>
	
	<div class="form-group" style="text-align: center">
	<center>
              <input class="btn btn-primary" type="submit" value="SUBMIT" />
              <input class="btn btn-default" type="reset" value="RESET" />
    </center>
    </div>
	</form>
</div>

<div class="container"> 
<center> <h3>Set Password</h3> </center>
	<form action="${pageContext.request.contextPath}/setPasswordServlet" onsubmit="return checkPassword()" method="post">
	<div class="form-group">
	<center>
	<label align="center" style="text-align:center">User Name </label><span id="usernamespan4"></span>
	<input type="text" class="form-control" id="username4" name="username4" size="25" maxlength="15" value="" onblur="checkUsername4()" align="center" placeholder="type user name here">
	</center>
	</div>
	<div class="form-group">
	<center>
	<label align="center" style="text-align:center">Password</label><span id="password"></span>
	<input type="password" class="form-control" id="password" name="password" size="25" maxlength="15" value="" align="center" placeholder="type your password here">
	</center>
	</div>
	
	<div class="form-group" style="text-align: center">
	<center>
              <input class="btn btn-primary" type="submit" value="SUBMIT" />
              <input class="btn btn-default" type="reset" value="RESET" />
    </center>
    </div>
	</form>
</div>

<center><h4><a href="<%=request.getContextPath()%>/listInfoServlet">Show Database</a></h4> </center>
	
</body>
</html>
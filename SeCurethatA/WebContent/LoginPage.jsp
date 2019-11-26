<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="LoginPage.css" />
<script>

function validate() {
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", "LoginServlet?username=" + document.loginform.username.value + "&password=" + document.loginform.password.value, false);
	xhttp.send();
	if (xhttp.responseText.trim().length > 0) {
		document.getElementById("errMsg").innerHTML = xhttp.responseText;
		return false;
	}
	else {
/* 		window.sessionStorage.setItem('user', document.loginform.username.value);
		window.sessionStorage.setItem('loggedIn', 'yes'); */
		return true;
	}
}

</script>

</head>
<body>

	<div id="header">
	
		<form name="myform" action="SearchServlet">
			<div id="search">
				<input id="search-button" type="submit" name="submit" value="Sumbit" />
				<input id="input" type="text" name="search-bar" placeholder=" Search...">
			</div>

			<div id="choice">		
				<label class="radio"> 
					<input type="radio" name="radio-button" value="Professor" id="radio1">
					Professor 
				</label>
				
				<label class="radio"> 
					<input type="radio" name="radio-button" value="Course" id="radio2"> 
					Course
				</label>
			</div>
<%
	String n = (String)session.getAttribute("username");
	if(n!=null){ //someone logged in
%>
		<a href="LogoutServlet"><div id="right-button"> Sign out </div></a>
		<a href="Upload.jsp"><div id="left-button"> Upload GPA </div></a>
<%
	}else{
%>		
		<a href="RegisterPage.jsp"><div id="right-button"> Register </div></a>
		<a href="Homepage.jsp"><div id="left-button"> Homepage </div></a>
<%
	}
%>
			<!-- <a href="RegisterPage.jsp"><div id="right-button"> Register </div></a>
			<a href="Homepage.jsp"><div id="left-button"> Homepage </div></a> -->
		</form>
			
			
		<div class='clear-float'></div>

	</div>
	

	<div id="main">
		<form name="loginform">
		
			<div id="errMsg"></div>
			
			<div class="info">
				<h3>Username</h3>
				<input id="username" type="text" name="username" /><br /> 
			</div>
			
			<div class="info">
				<h3>Password</h3>
				 <input id="password" type="text" name="password" /><br />
			</div>
			
			<div id="button">
				<input id="submit" type="submit" name="submit" value="Sign In" />
			</div>	

			<div class='clear-float'></div>
		</form>
	
	</div>

</body>
</html>
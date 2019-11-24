<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
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
		window.sessionStorage.setItem('user', document.loginform.username.value);
		window.sessionStorage.setItem('loggedIn', 'yes');
		return true;
	}
}

</script>
<style type="text/css">
	body{
		margin: 0px;
		background-color: #FFF4F4;
	}

	#header{
		height: 100px;
		background-color: #000;
		color: #D56AA0;
	}

	.clear-float{
		clear: both;
	}

	#search{
		float: left;
		line-height: 100px;
		text-align: center;
		margin-left: 10%;
	}

	#search-button{
		margin-left: 10px;
		height: 30px;
		width: 70px;
		color: #FFF;
		font-size: 13px;
		border-radius: 5px;
		background-color: #D56AA0;
	}

	#input{
		margin-left: 10px;
		height: 25px;
		width: 400px;
		font-size: 13px;
		border-radius: 5px;
	}

	#choice{
		float: left;
		text-align: center;
		line-height: 100px;
		font-size: 17px;
		margin-left: 40px;
		color: #FFC7D4;
	}
	
	.radio{
		margin-right: 15px;
	}

	#left-button{
		float: right;
		line-height: 100px;
		color: #FFC7D4;
		margin-right: 50px;
	}

	#right-button{
		float: right;
		line-height: 100px;
		color: #FFC7D4;
		margin-right: 10%;
	}
	
	#main{
		width: 80%;
		margin: auto;		
	}
	
	h3{
		color: black;
		margin-top: 50px;
	}

	#username, #password{
		width: 100%;
		height: 35px;
		border-radius: 5px;
	}
	
	#submit{
		width: 10%;
		height: 30px;
		font-size: 18px;
		margin-top: 40px;
		color: white;
		border-radius: 5px;
		background-color: #D56AA0;
		float: right;
	}
</style>
</head>
<body>

	<div id="header">
	
		<form name="myform">
			<div id="search">
				<input id="search-button" type="submit" name="submit" value="Sumbit" />
				<input id="input" type="text" name="search-bar" placeholder=" Search...">
			</div>

			<div id="choice">		
				<label class="radio"> 
					<input type="radio" name="radio-button" value="Name" id="radio1">
					Professor 
				</label>
				
				<label class="radio"> 
					<input type="radio" name="radio-button" value="ISBN" id="radio2"> 
					Course
				</label>
			</div>

			<a href="RegisterPage.jsp"><div id="right-button"> Register </div></a>
			<a href="Homepage.jsp"><div id="left-button"> Homepage </div></a>
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
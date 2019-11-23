<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Homepage</title>
<style type="text/css">
	body{
		margin: 0px;
		background-color: #FFF4F4;
	}

	#header{
		height: 120px;
		background-color: #000000;
		
	}

	#left-button{
		float: right;
		line-height: 120px;
		color: #FFC7D4;
		font-size: 20px;
		margin-right: 50px;
	}

	#right-button{
		float: right;
		line-height: 120px;
		color: #FFC7D4;
		font-size: 20px;
		margin-right: 10%;
	}

	.clear-float{
		clear: both;
	}

	#heading{
		text-align: center;
		font-size: 55px;
		margin-top: 100px;
	}

	#search{
		text-align: center;
	}

	#search-bar{
		width: 70%;
		height: 35px;
		border-radius: 15px;
		font-size: 20px;
		margin-bottom: 30px;
	}

	#button{
		width: 90px;
		height: 30px;
		border-radius: 5px;
		font-size: 15px;
	}

	#radio-button, #button-button{
		float: left;
		margin-right: 20%;
		margin-left: 20%;
	}

	input{
		margin-bottom: 5px;
	}
</style>
</head>
<body>

	<div id="header">
		<a href="RegisterPage.jsp"><div id="right-button"> Register </div></a>
		<a href="LoginPage.jsp"><div id="left-button"> Login </div></a>
	</div>

	<div class="clear-float"></div>

	<div id="main">
		<h1 id="heading">SeCure that A!</h1>

		<div id="search">
			<form>
				<div>
					<input id="search-bar" type="text" placeholder=" Search..">
				</div>
				
				<div id="radio-button">
					<input type="radio" name="professor" value="professor"> Professor <br>
					<input type="radio" name="course" value="course"> Course <br>
				</div>

				<div id="button-button">
					<button id="button">Search</button>
				</div>

				<div class="clear-float"></div>
			</form>
		</div>
	</div>
		
</body>
</html>
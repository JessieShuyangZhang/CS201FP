<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Homepage</title>
<link rel="stylesheet" type="text/css" href="Homepage.css" />
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
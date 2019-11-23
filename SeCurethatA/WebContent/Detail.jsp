<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>

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
<%-- 	<div class="header">
		<table>
			<tr>
				<td><a href="HomePage.jsp"><h1 style="color:pink">SeCureThatA</h1></a>
				<td>
					<form name="myform" method="GET" action="SearchResult">
						<input type="text" class="input-field" name="keywords" placeholder="Search a course" >
				<td>	<button type="submit" name="submit" value = "Search" class="button"/></button>
					</form>
				<td> <span style="float:right;padding:10px;"><a href="Logout" >Sign Out</a></span>
				<td> <h4><%=session.getAttribute("username")%></h4>
			</tr>
		</table>
	</div> --%>
	
	<div>
		<h1><%=session.getAttribute("courseName")%></h1>
		<h3><%=session.getAttribute("courseDescription")%></h3>
	</div>
	<hr class="line" style="width:100%; position:relative;left:0%;"></hr>
	
	<table>
		<tr>
			<td>
				<h4 style="color:grey">Term</h4>
				<select name="term" onchange="selectTerm()">
					<option value="201803">2018 Fall</option>
				    <option value="201901">2019 Spring</option>
				    <option value="201902">2019 Summer</option>
				    <option value="201903">2019 Fall</option>
		  		</select>
		  	<td>
		  		<h4 style="color:grey">Professor</h4>
				<select name="professor" onchange="selectProfessor()">
					<option value="Olivera Grujic">Olivera Grujic</option>
				    <option value="Andrew Goodney">Andrew Goodney</option>
				    <option value="Mark Redekopp">Mark Redekopp</option>
				    <option value="Aaron Cote">Aaron Cote</option>
		  		</select>
		</tr>
	</table>
	
	<h1>The average GPA for <%=session.getAttribute("term")%> by <%=session.getAttribute("professor")%> is</h1>
	<div><%=session.getAttribute("avgGPA")%></div>
	<h1><%=session.getAttribute("percentage")%> of the students think the course with this professor is challenging</h1>
	<table>
		<tr>
			<td><img src="histogram.png">
			<td><img src="line_chart.png">
		</tr>
	</table>
	<script>
		function selectTerm(){
			
		}
		
		function selectProfessor(){
			
		}
		
	</script>
</body>
</html>
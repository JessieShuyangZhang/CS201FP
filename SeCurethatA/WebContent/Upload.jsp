<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload</title>
<link rel="stylesheet" href="template.css" type="text/css">
</head>
<body>
	<div class="header">
		<table>
			<tr>
				<td><a href="HomePage.jsp"><h1 style="color:pink">SeCureThatA</h1></a>
				<td>
					<form name="myform" method="GET" action="SearchResult">
						<input type="text" class="input-field" name="keywords" placeholder="Search a course" >
				<td>	<button type="submit" name="submit" value = "Search" class="button"/></button>
					</form>
				<td> <span style="float:right;padding:10px;"><a href="Logout" >Sign Out</a></span>
				<td> <h4><%=session.getAttribute("username")%></h1>
			</tr>
		</table>
	</div>
	
	<h3 style="text-align:center">Upload Your GPA</h3>
	<hr class="line" style="width:100%; position:relative;left:0%;"></hr>
	
	<form style="padding-left:60px;"name="login" method="POST" action="LoginServlet">
		<h4 style="color:grey">Select a Course</h4>
		<select name="course">
		    <option value="CSCI 102">CSCI 102</option>
		    <option value="CSCI 103">CSCI 103</option>
		    <option value="CSCI 104">CSCI 104</option>
		    <option value="CSCI 170">CSCI 170</option>
		    <option value="CSCI 201">CSCI 201</option>
		    <option value="CSCI 270">CSCI 270</option>
		    <option value="CSCI 310">CSCI 310</option>
		    <option value="CSCI 350">CSCI 350</option>
		    <option value="CSCI 356">CSCI 356</option>
		    <option value="CSCI 360">CSCI 360</option>
  		</select>
		
		<h4 style="color:grey">Select a Term</h4>
		<select name="term">
			<option value="201803">2018 Fall</option>
		    <option value="201901">2019 Spring</option>
		    <option value="201902">2019 Summer</option>
		    <option value="201903">2019 Fall</option>
  		</select>
		
		<h4 style="color:grey">Professor</h4>
		<select name="professor">
			<option value="Olivera Grujic">Olivera Grujic</option>
		    <option value="Andrew Goodney">Andrew Goodney</option>
		    <option value="Mark Redekopp">Mark Redekopp</option>
		    <option value="Aaron Cote">Aaron Cote</option>
  		</select>
  		
  		<h4 style="color:grey">Your GPA</h4>
  		<input type="text" name="gpa" class="input-field">
  		<h4 style="color:grey">Do you recommend this course with this professor?</h4>
  			<input type="radio" name="recommend" value="yes">Yes
  			<input type="radio" name="recommend" value="no">No
  		<h4 style="color:grey">Is this course challenging for you?</h4>
  			<input type="radio" name="challenging" value="yes">Yes
  			<input type="radio" name="challenging" value="no">No
  			
		<br /><br /><br />
		<input class="button" type="submit" value="Upload">
	</form>
</body>
</html>
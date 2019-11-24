<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload</title>
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
<script type="text/javascript"> 
	var msg = "<%=session.getAttribute("message")%>";
	if(msg != null)
		alert(msg);
</script>
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
	
	<h3 style="text-align:center">Upload Your GPA</h3>
	<hr class="line" style="width:100%; position:relative;left:0%;"></hr>
	
	<form style="padding-left:60px;"name="upload" method="POST" action="UploadServlet">
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
  		<input type="text" name="gpa" value=<%=session.getAttribute("gpa") != null?session.getAttribute("gpa"):"" %>>
  		<h4 style="color:grey">Do you recommend this course with this professor?</h4>
  			<input type="radio" name="recommend" value="yes">Yes
  			<input type="radio" name="recommend" value="no">No
  		<h4 style="color:grey">Is this course challenging for you?</h4>
  			<input type="radio" name="challenging" value="yes">Yes
  			<input type="radio" name="challenging" value="no">No
  			
		<br /><br /><br />
		<input class="button" type="submit">
		
	</form>
</body>
</html>
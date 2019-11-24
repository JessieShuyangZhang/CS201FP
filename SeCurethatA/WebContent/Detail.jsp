<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Detail Page</title>

		<link rel="stylesheet" type="text/css" href="DetailPage.css" />

		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    	<script type="text/javascript">
      		google.charts.load("current", {packages:['corechart']});
      		google.charts.setOnLoadCallback(drawChart);
      		function drawChart() {
        		var data = google.visualization.arrayToDataTable([
          			["Professor", "GPA", { role: "style" } ],
          			["Mark Redekopp", 4.0, "#809BCE"],
          			["Olivera Grujic", 2.5, "#95B8D1"],
          			["Jeffrey Miller", 3.5, "#B8E0D2"],
          			["Andrew Goodney", 3.3, "#D6EADF"]
        		]);

        		data.addRows([["Average", 3.0, "#EAC4D5"]]);
	
       			var view = new google.visualization.DataView(data);
        		view.setColumns(
	        	[0, 1,
	            	{ 
	        			calc: "stringify",
	                	sourceColumn: 1,
	                	type: "string",
	                	role: "annotation" 
	                },
	            2]);
	
		        var options = {
		        	title: "GPA of CSCI201 in Fall 2019",
		        	width: 600,
		        	height: 400,
		        	bar: {groupWidth: "90%"},
		        	legend: { position: "none" },
		        };
	      		var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
	      		chart.draw(view, options);
  			}
		</script>
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
	
	<div id="columnchart_values"></div>
	
	<script>
		function selectTerm(){
			
		}
		
		function selectProfessor(){
			
		}
		
	</script>
</body>
</html>
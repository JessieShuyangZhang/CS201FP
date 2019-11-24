<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList"%>
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
				<select name="term" onchange="select()">
					<option value="none">Select a Term</option>
					<%
						ArrayList<String> terms = (ArrayList<String>)(session.getAttribute("terms"));
						for(int i = 0; i < terms.size(); i++){
					%>
						<option value="<%=terms.get(i)%>"><%=terms.get(i)%></option>
					<% 
						}
					%>
		  		</select>
		  	<td>
		  		<h4 style="color:grey">Professor</h4>
				<select name="professor" onchange="select()">
					<option value="none">Select a Professor</option>
					<%
						ArrayList<String> professors = (ArrayList<String>)(session.getAttribute("professors"));
						for(int i = 0; i < professors.size(); i++){
					%>
						<option value="<%=professors.get(i)%>"><%=professors.get(i)%></option>
					<% 
						}
					%>
		  		</select>
		</tr>
	</table>
	
	<h1>The average GPA for <span id="term"></span> by <span id="professor"></span> is</h1>
	<div style="text-align:center"><%=session.getAttribute("specificGPA")%></div>
	
	<%
		if(session.getAttribute("challenging") != null){
	%>
			<h1><%=session.getAttribute("challenging")%>% of the students think the course with this professor is challenging.</h1>
	<% 
		}
		if(session.getAttribute("recommendRate") != null){
	%>
			<h1><%=session.getAttribute("recommendRate")%>% of the students recommend this course with this professor.</h1>
	<% 
		}
	%>
	
	<div id="columnchart_values"></div>
	
	<script>
		function select(){
			var term = document.term.value;
			var professor = document.professor.value;
 			var xhr = new XMLHttpRequest();
	 		xhr.open('GET',"DetailServlet?term="+term+"&professor="+professor+"&courseName="+session.getAttribute("courseName"),true);
	 		xhr.onreadystatechange = function(){
	 			if(term == "none"){
	 				document.getElementById("term").innerHTML = '"all terms"';
	 			}
	 			else{
	 				document.getElementById("term").innerHTML = 'term';
	 			}
	 			if(professor == "none"){
	 				document.getElementById("professor").innerHTML = '"all professors"';
	 			}
	 			else{
	 				document.getElementById("professor").innerHTML = 'professor';
	 			}
	 		}
	 		console.log("term="+ term);
	 		console.log("professor="+professor)
	 		xhr.send();
		}
		
		
		
	</script>
</body>
</html>
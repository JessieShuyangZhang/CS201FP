<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList"%>
    <%@ page import="Database.Database" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Detail Page</title>

		<link rel="stylesheet" type="text/css" href="DetailPage.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    	<script type="text/javascript">
    	
    	//for debug-Jessie
    	console.log("courseName:"+"<%=request.getParameter("courseName")%>");
    	console.log("courseDescription:"+"<%=request.getParameter("courseDescription")%>");
    	
      		google.charts.load("current", {packages:['corechart']});
      		google.charts.setOnLoadCallback(drawChart);
      		
      		function drawChart(id, listProfessor, listGPA) {
      			
        		var data = google.visualization.arrayToDataTable([
          			["Professor", "GPA", { role: "style" } ],
/*           			["Mark Redekopp", 4.0, "#809BCE"],
          			["Olivera Grujic", 2.5, "#95B8D1"],
          			["Jeffrey Miller", 3.5, "#B8E0D2"],
          			["Andrew Goodney", 3.3, "#D6EADF"]  */
        		]);
				
      			var i;
      			for (i = 0; i < listProfessor.length; i++) {
      				var outer = [];
      				var inner = [];
      				inner.push(listProfessor[i]);
      				inner.push(listGPA[i]);
      				outer.push(inner);
      				data.addRows(outer);
      			}
        		
        		/* data.addRows([["Average", 3.0, "#EAC4D5"]]); */
	
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
		        	backgroundColor: '#FFF4F4',
		        };
	      		var chart = new google.visualization.ColumnChart(document.getElementById(id));
	      		chart.draw(view, options);
  			}

      		function getChartInfo(){
      			console.log("in getChartInfo()");
      			var xhttp = new XMLHttpRequest();
      			var term = document.getElementById('term-dropdown').value;
      			xhttp.open("GET", "chartServlet?term=" + term.options[term.selectedIndex].text + "&course=" + document.getElementById("course").value, true);
      			
      			var id = 'columnchart_values';
      			xhttp.onreadystatechange = function(){
      				var listProfessor = (<%=(ArrayList<String>)request.getAttribute("listProfessor") %>);
      				var listGPA = (<%=(ArrayList<Integer>)request.getAttribute("listGPA") %>);
      				drawChart(id, listProfessor, listGPA);
      			}
      			xhttp.send();		
      		}

		</script>
	</head>
<body>
<div id="header">	
	<form name="myform" action="SearchServlet">
		<div id="search">
			<input id="search-button" type="submit" name="submit" value="Submit" />
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
	String coursename = request.getParameter("courseName");
	String coursedescription = request.getParameter("courseDescription");
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
<%-- 		<h1 id="course"><%=request.getAttribute("courseName")%></h1>
		<h3><%=request.getAttribute("courseDescription")%></h3> --%>
		
		<h1 id="course"><%=coursename%></h1>
		<h3><%=coursedescription%></h3>
	</div>
	<hr class="line" style="width:100%; position:relative;left:0%;"></hr>
	
	<table>
		<tr>
			<td>
				<h4 style="color:grey">Term</h4>
				<select id="term-dropdown" name="term" onchange="select(); getChartInfo()">
					<option value="none">Select a Term</option>
					<%				
						Database db = new Database();
						ArrayList<String> terms = (ArrayList<String>)(db.getTerms(coursename));
					if(terms==null){
						System.out.println("in details,terms:"+terms);	
					}else{
						for(int i = 0; i < terms.size(); i++){
					%>
						<option value="<%=terms.get(i)%>"><%=terms.get(i)%></option>
					<% 
						}}
					%>
		  		</select>
		  	
		  	<td>
		  		<h4 style="color:grey">Professor</h4>
				<select name="professor" id="professor-dropdown" onchange="select()">
					<option value="none">Select a Professor</option>
					<%
						ArrayList<String> professors = (ArrayList<String>)(db.getProfessors(coursename));
					if(terms==null){
						System.out.println("in details,professors:"+terms);	
					}else{	
					for(int i = 0; i < professors.size(); i++){
					%>
						<option value="<%=professors.get(i)%>"><%=professors.get(i)%></option>
					<% 
						}}
					%>
		  		</select>
		  	
		</tr>
	</table>
	
	<h1>The average GPA for <span id="term"></span> by <span id="professor"></span> is</h1>
	<div id="specificGPA" style="text-align:center"></div>
	<p id="challenging"></p>
	<p id="recommendRate"></p>
	
	<div id="columnchart_values"></div>
	
	<script>
		function select(){
			//console.log("in select()");			
			var term = document.getElementById("term-dropdown").value;
			var professor = document.getElementById("professor-dropdown").value;
			console.log("in jsp, term:"+term);
			console.log("in jsp, professor:"+professor);
			if(term == "none"){
 				document.getElementById("term").innerHTML = "all terms";
 			}
 			else{
 				document.getElementById("term").innerHTML = term;
 			}
 			if(professor == "none"){
 				document.getElementById("professor").innerHTML = "all professors";
 			}
 			else{
 				document.getElementById("professor").innerHTML = professor;
 			}
			
	 		var xhr = new XMLHttpRequest();
		 	xhr.open('GET',"DetailServlet?term="+term+"&professor="+professor+"&courseName="+"<%=coursename%>",false);
		 	xhr.send();
			
	 		console.log(xhr.responseText);
	 		var str = xhr.responseText;
	 		var arr = str.split(" ");
	 		if(arr[0]!=-1){
	 			document.getElementById("specificGPA").innerHTML=arr[0];
	 		}
	 		if(arr[1]!=-1){
				document.getElementById("challenging").innerHTML=arr[1]+'% of the students think this course is challenging.';
	 		}
			if(arr[2]!=-1){
				document.getElementById("recommendRate").innerHTML=arr[2]+'% of the students recommend this course with this professor.';
			}
		 	<%-- document.getElementById("specificGPA").innerHTML="<%=session.getAttribute("specificGPA") %>";
			document.getElementById("challenging").innerHTML="<%=session.getAttribute("challenging") %>"+'% of the students think the course with this professor is challenging.';
		 	document.getElementById("recommendRate").innerHTML="<%=session.getAttribute("recommendRate") %>"+ '% of the students recommend this course with this professor.';--%>		 			
		}
		
	</script>
</body>
</html>
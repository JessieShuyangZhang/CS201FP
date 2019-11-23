<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SeCure that A|search results</title>
<link rel="stylesheet" type="text/css" href="searchresults.css" />
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
	
	<!-- <div id="topbar">
		<form name="form" method="GET" action="BookServlet">
			<table>
				<tr>
					<td>
						<h1>SeCure that A!</h1>
					</td>
					<td><input id="searchbar" type="text" placeholder="Type..."
						name="searchbar"
					></td>

					<td>
						<button type="submit" id="submit">
							<img src="magnifying_glass.png" alt="Search" height="27"
								width="34"
							/>
						</button>
					</td>
					<td><input type="radio" name="searchtype" value="Professor" />Professor<br />
					</td>
					<td><input type="radio" name="searchtype" value="Course" />Course<br />
					</td>
				</tr>
			</table>
		</form>

		<br />
	</div> -->



	<div id="results">
		<h3 id="results-title">Results for "CSCI 201"</h3>
		<hr />
		<%-- 	<h3 id="result-title">Results for "<%= searchbar %>"</h3><hr/>--%>

		<!-- below are placeholders...needs to get from database -->

		<div class="single-result">
			<div class="course-card">
				<div class="course-id">CSCI 201</div>
				<div class="course-title">Principle of Software Development</div>

				<div class="course-discription">
					<p>Object-oriented paradigm for programming-in-the-large in
						Java; writing sophisticated concurrent applications with animation
						and graphic user interfaces; using professional tools on team
						project.</p>
				</div>
			</div>
			<div class="gpa">
				<div class="gpa-title">
					<strong>Overall</strong> <br />
					<h2 style="margin: 0; padding: 0;">GPA</h2>
				</div>
				<div class="gpa-number">
					<strong>2.8</strong>
				</div>
			</div>
		</div>


	</div>


	<div id="sidebar">
		<h2 id="sidebar-title">Recommended</h2>

		<!-- below are placeholders...needs to get from database -->

		<div class="recommend">
			<h3>CSCI 270</h3>
			<p>Introduction to Algorithms and Theory of Computing</p>
		</div>

	</div>
	
<%--
    String searchbar = request.getParameter("searchbar");
--%>	
	
<%--	
		Database db = new Database();
		db.searchCourses(searchbar);
		for(int i=0; i<db.courseArray.size(); i++){
			String bookUrl=db.courseArray.get(i);
--%>


<!-- <script>
	function handleResponse(response) {
	
	}
</script> -->


</body>
</html>
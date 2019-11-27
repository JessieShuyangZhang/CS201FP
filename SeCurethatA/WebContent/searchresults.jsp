<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<%@ page import="java.util.*" %>
<%@ page import="Database.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SeCure that A|search results</title>
<link rel="stylesheet" type="text/css" href="searchresults.css" />
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
	
	<div id="results">
<%
    String input = request.getParameter("search-bar");
%>	
		<h3 id="result-title">Results for "<%= input %>"</h3><hr/>	
<%
		Database db = new Database();	
		String searchby = (String)request.getAttribute("resultsby");
		Vector<String> res = new Vector<String>();
		if(searchby==null){
			System.out.println("searchby is null");//for debug
		}
		else{System.out.println("searchby "+searchby);//for debug
		if(searchby.contentEquals("Course")){
			res = db.searchCourseByCourse(input);
		}
		else{
			res = db.searchCourseByProf(input);
		}}
		if(res.size()==0){
%>
<p>No results...try again!</p>
<%
		}
		else{
		for(int i=0; i<res.size(); i++){
			String coursename = res.elementAt(i);
			String coursetitle = db.getCourseTitle(coursename);
			String coursedescription=db.getDescription(coursename);
			double gpa = db.getGPA(coursename);
			int temp = (int)(gpa*100);
			gpa = temp/100.0;
%>
		<div class="single-result">
			<div class="course-card">				
				<div class="course-id">
<%
	if(n!=null){ //someone logged in
%>
		<a href="Detail.jsp?courseName=<%=coursename%>&courseDescription=<%=coursedescription%>">
					<%=coursename %></a>
<%
	}else{ //guest, no access to details page
%>		
<!-- Trigger/Open The Modal -->
<a href="" name="myBtn"><%=coursename %></a>
<%
	}
%>
				</div>
				
				<div class="course-title"><%=coursetitle%></div>
				<div class="course-discription">
					<p><%=coursedescription%></p>
				</div>
			</div>
			<div class="gpa">
				<div class="gpa-title">
					<strong>Overall</strong> <br />
					<h2 style="margin: 0; padding: 0;">GPA</h2>
				</div>
				<div class="gpa-number">
				<%if(gpa<0){%>
					<strong><%= gpa%></strong>
				<%}else{%>
					<strong>N/A</strong>
				<%}%>
				</div>
			</div>
		</div>
<%
		}}
%>
	</div>


	<div id="sidebar">
		<h2 id="sidebar-title">Recommended</h2>
		
<%	
		Vector<String> recomm = new Vector<String>();
		if(searchby==null){
			System.out.println("searchby is null");//for debug
		}
		else{System.out.println("searchby "+searchby);//for debug
		if(searchby.contentEquals("Course")){
			recomm = db.getRecommendByCourse(input);
		}
		else{
			recomm = db.getRecommendByProf(input);
		}}		
		if(recomm.size()==0){
%>
		<p>Nothing to recommend</p>
<%
		}
		else{
		for(int i=0; i<recomm.size(); i++){
			String coursename = recomm.elementAt(i);
			String coursetitle = db.getCourseTitle(coursename);
			String coursedescription=db.getDescription(coursename);
%>
		<div class="recommend">
		<%
	if(n!=null){ //someone logged in
%>
		<h3><a href="Detail.jsp?courseName=<%=coursename%>&courseDescription=<%=coursedescription%>">
					<%=coursename %></a></h3>
<%
	}else{ //guest, no access to details page
%>		
<!-- Trigger/Open The Modal -->
<h3><a href="" name="myBtn"><%=coursename %></a></h3>
<%
	}
%>
			
			<p><%=coursetitle%></p>
		</div>
<%
		}}
%>

	</div>

<!-- The Modal -->
<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p><strong>Please log in to view course details</strong></p>
  </div>
</div>	
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
//var btn = document.getElementById("myBtn");
var btns = document.getElementsByName("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
for(var i=0; i<btns.length; i++){
	btns[i].onclick = function() {
	  modal.style.display = "block";
	}
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
</html>
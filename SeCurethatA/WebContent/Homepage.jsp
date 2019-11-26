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
<%
	String n = (String)session.getAttribute("username");
	System.out.println("in homepage, session username:"+n);
	if(n!=null){ //someone logged in
%>
		<!-- <a href="LogoutServlet"><div id="right-button"> Sign out </div></a>
		<a href="Upload.jsp"><div id="left-button"> Upload GPA </div></a> -->
		<a href="LogoutServlet"><div id="right-button"> Sign out </div></a>
		<a href="Homepage.jsp"><div id="left-button"> Homepage </div></a>
<%
	}else{
%>		
		<a href="RegisterPage.jsp"><div id="right-button"> Register </div></a>
		<a href="LoginPage.jsp"><div id="left-button"> Login </div></a> 
<%
	}
%>
<!-- 		<a href="RegisterPage.jsp"><div id="right-button"> Register </div></a>
		<a href="LoginPage.jsp"><div id="left-button"> Login </div></a> -->
	</div>

	<div class="clear-float"></div>

	<div id="main">
		<h1 id="heading">SeCure that A!</h1>
		
		<h3><div id="text"></div></h3>

		<div id="search">
			<form name="myform" action="SearchServlet">
				<div>
					<input id="search-bar" name="search-bar" type="text" placeholder=" Search..">
				</div>
				
				<div id="choice">
					<input type="radio" name="radio-button" value="Professor"> Professor <br>
					<input type="radio" name="radio-button" value="Course"> Course <br>
				</div>

				<div id="button-button">
					<button id="button">Search</button>
				</div>

				<div class="clear-float"></div>
			</form>
		</div>
		<div id="error_msg">
	    	<%= request.getAttribute("error") != null ? request.getAttribute("error"):"" %>
	    </div>
	</div>
	
	<script>
	    // List of sentences
	    var _CONTENT = [ "Find what you're looking for", "The Best Darn Grade You Can Get", ""];
	
	    // Current sentence being processed
	    var _PART = 0;
	
	    // Character number of the current sentence being processed 
	    var _PART_INDEX = 0;
	
	    // Holds the handle returned from setInterval
	    var _INTERVAL_VAL;
	
	    // Element that holds the text
	    var _ELEMENT = document.querySelector("#text");
	
	    // Implements typing effect
	    function Type() { 
	      var text =  _CONTENT[_PART].substring(0, _PART_INDEX + 1);
	      _ELEMENT.innerHTML = text;
	      _PART_INDEX++;
	
	      // If full sentence has been displayed then start to delete the sentence after some time
	      if(text === _CONTENT[_PART]) {
	        clearInterval(_INTERVAL_VAL);
	        setTimeout(function() {
	          _INTERVAL_VAL = setInterval(Delete, 50);
	        }, 1000);
	      }
	    }

	    // Implements deleting effect
	    function Delete() {
	      var text =  _CONTENT[_PART].substring(0, _PART_INDEX - 1);
	      _ELEMENT.innerHTML = text;
	      _PART_INDEX--;
	
	      // If sentence has been deleted then start to display the next sentence
	      if(text === '') {
	        clearInterval(_INTERVAL_VAL);
	
	        // If last sentence then display the first one, else move to the next
	        if(_PART == (_CONTENT.length - 1))
	          _PART = 0;
	        else
	          _PART++;
	        _PART_INDEX = 0;
	
	        // Start to display the next sentence after some time
	        setTimeout(function() {
	          _INTERVAL_VAL = setInterval(Type, 100);
	        }, 200);
	      }
	    }
	
	    // Start the typing effect on load
	    _INTERVAL_VAL = setInterval(Type, 100);
	</script>
</body>
</html>
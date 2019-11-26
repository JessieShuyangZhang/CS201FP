<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.google.*" %>
<%@  page import= "Database.DatabaseOperator1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	DatabaseOperator1 do1 = new DatabaseOperator1();
	do1.addUser("root", "123456");
	//authenticate test
	if(!do1.authenticate("root", "1234")) {
		out.println("pass authenticate test with not correct password.");
	}
	else {
		out.println("fail authenticate test with not correct password.");
	}
	out.println("/n");
	if(do1.authenticate("root", "123456")) {
		out.println("pass authenticate test with correct password.");
	}
	else {
		out.println("fail authenticate test with correct password.");
	}
	out.println("/n");
	//user exist test
	if(!do1.userExist("trojan")) {
		out.println("pass user not exist test.");
	}
	else {
		out.println("fail user not exist test.");
	}
	out.println("/n");
	if(do1.userExist("root")) {
		out.println("pass user exist test.");
	}
	else {
		out.println("fail user exist test.");
	}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Scriptlets</title>
</head>
<body>
	<%
	for (int i = 0 ; i < 15 ; i++){
		out.println(i);
	%>
	<br />
	<%	
	}
	%>
</body>
</html>
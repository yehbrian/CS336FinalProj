<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe Jewelry Website</title>
</head>
<body>
Register<!-- the usual HTML way -->

<br>
	<form method="post" action="newUser.jsp">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="password"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="register">
	</form>
<br>

</body>
</html>
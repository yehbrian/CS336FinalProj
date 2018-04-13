<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:include page="head.jsp"></jsp:include>
<body>
	Welcome
	<%=session.getAttribute("user")%>
	<%
	int item = 0;

		if ((session.getAttribute("user") != null)) {
			int u = Integer.parseInt(session.getAttribute("userID").toString());
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			String cond = request.getParameter("cond");
			String brand = request.getParameter("brand");
			String metal = request.getParameter("metal");
			String stone = request.getParameter("stone");
			String color = request.getParameter("color");
			String description = request.getParameter("description");
			String startingBid = request.getParameter("startingBid");
			String increment = request.getParameter("increment");
			String minimum = request.getParameter("minimum");
			String hours = request.getParameter("date");
			
			
			long h = System.currentTimeMillis() + (long)(Integer.parseInt(hours)*3600000);
			java.sql.Timestamp time = new java.sql.Timestamp(h);
			System.out.println(time.toString());
			
			String str = "INSERT INTO Items(itemID,sellerID,name,category,cond,brand,metal,stone,color,description,startingBid,increment,hiddenMinPrice,endTime)"
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(str);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setInt(1, item);
			ps.setInt(2, u);
			ps.setString(3, name);
			ps.setString(4, category);
			ps.setString(5, cond);
			ps.setString(6, brand);
			ps.setString(7, metal);
			ps.setString(8, stone);
			ps.setString(9, color);
			ps.setString(10, description);
			ps.setFloat(11, Float.parseFloat(startingBid));
			ps.setFloat(12, Float.parseFloat(increment));
			ps.setFloat(13, Float.parseFloat(minimum));
			ps.setTimestamp(14, time);
			
			ps.executeUpdate();
			
			con.close();
			
			response.sendRedirect("home.jsp");
			
			
			
			
			
			
		} else {
	%>
	You are not logged in
	<br />
	<a href="login.jsp">Please Login</a>

	<%
		}
	%>

</body>
</html>
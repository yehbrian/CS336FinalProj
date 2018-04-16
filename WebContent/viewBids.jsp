<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="head.jsp"></jsp:include>
<body>
<style>
table{
		border:1px solid black;
		padding:2px;
		background-color: white;
		width:100%;
	}
	th, td {
		border: 1px solid black;
		padding: 2px;
	}
}
</style>
	<%
		if ((session.getAttribute("user") != null)) {
			int u = Integer.parseInt(session.getAttribute("userID").toString());
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			String id = request.getParameter("itemID");
			int itemID = Integer.parseInt(id.toString());
			String torun = String.format("SELECT * FROM Bids WHERE itemID = '%d' ORDER BY amount DESC", itemID);

			ResultSet result = stmt.executeQuery(torun);

			out.print("<table id=\"fixedheight\">");
			out.print("<tr>");

			out.print("<td>");
			out.print("itemID");
			out.print("</td>");

			out.print("<td>");
			out.print("Amount");
			out.print("</td>");

			out.print("<td>");
			out.print("Time");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Username");
			out.print("</td>");

			out.print("</tr>");
			while (result.next()) {
				String torun2 = String.format("SELECT * FROM Users WHERE userID = '%d'", result.getInt("buyerID"));
				Statement stmt2 = con.createStatement();
				ResultSet result2 = stmt2.executeQuery(torun2);
				while (result2.next()) {
					if (result.getFloat("amount") > 0) {
						out.print("<tr>");

						out.print("<td>");
						out.print(result.getInt("itemID"));
						out.print("</td>");

						out.print("<td>");
						out.print(result.getFloat("amount"));
						out.print("</td>");

						out.print("<td>");
						out.print(result.getTimestamp("time"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result2.getString("username"));
						out.print("</td>");

						out.print("</tr>");
					}
				}

			}
			con.close();
		}

		else {
	%>
	You are not logged in
	<br />
	<a href="login.jsp">Please Login</a>

	<%
		}
	%>

</body>
</html>
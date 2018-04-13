<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="head.jsp"></jsp:include>

<body>

	<header>
	<div class="banner">
		<h1 style="font-size: 60px">
			<a id="banner_home" href="home.jsp">BuyMe</a>
		</h1>
	</div>
	</header>

	<%
		if ((session.getAttribute("user") == null)) {
	%>
	You are not logged in
	<br />
	<a href="login.jsp">Please Login</a>
	<%
		}
		//we need to check to see if the user is a user, admin, or customer rep
		else {
	%>
	Welcome
	<%=session.getAttribute("user")%>
	<a href='logout.jsp'>Log out</a>
	<%
		
		
	out.print("<form method = 'post' action = searchResults.jsp>");
	out.print("<div>");
	out.print("<div>");
	out.print("<div>");
	out.print("Searh for an item here");
	out.print("<input type ='text' name='search' >");
	out.print("</div>");
	
	out.print("<div>");
	out.print("<a href='auction.html'>Create Auction here!</a>");
	out.print("</div>");
	out.print("<a href='viewauction.jsp'>View Auctions here!</a>");
	out.println("<div>");	
	out.print("<a href='deletAccount.jsp'>Delete Your Account Here! Sad to see you go!</a>");
	out.println("</div>");
	
		}
	
	
	%>


</body>
</html>
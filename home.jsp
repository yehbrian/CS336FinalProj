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
	<a href="index.jsp">Please Login</a>
<%
	}
	//we need to check to see if the user is a user, admin, or customer rep
	else {
		int permissions = (Integer) session.getAttribute("permissions");
%>
		Welcome
<%
		if(permissions == 2) {
%>
			<section class="container">
		    <div class="login">
		      <h1>Summary Statistics</h1>
		      <form method="post" action="stats.jsp">
		        <select name="stats">
				<option>Total earnings</option>
				<option>Earnings by item</option>      
				<option>Earnings by item type</option>  
				<option>Earnings by user</option>
				<option>Best selling items</option>
				<option>Best buyers</option>
				</select>
				
		        <p class="submit"><input type="submit" value="Submit"></p>
		    	</form>
		      
		    	<p><a id="register" href="registerCustomerRep.jsp">Create customer representative account here</a></p>	
		    </div>
			</section>
<%
		}
		if(permissions == 1) {
%>
			<section class="container">
		    <div class="login">
		    <h1>Select function</h1>
		    <form method="post" action="customerRepRedirect.jsp">
				<select name="function">
				<option>Modify user information</option>
				<option>Delete illegal bids</option>
				<option>Delete illegal auctions</option>
				</select>
				
		        <p class="submit"><input type="submit" value="Submit"></p>
		    	</form>
		      
		    </div>
			</section>
<%
		}
%>
		<a href='logout.jsp'>Log out</a>
	
		<div class="search">
		<form method ="post" action = "searchResults.jsp">
			<p>Search for an item here <input type ="text" name="search" id="searchItem"></p>
		</form>
		</div>
	
		<div>
		<a href='auction.html'>Create a listing</a>
		</div>
		
		<div>
		<a href='viewAuctions.jsp'>View all listings</a>
		</div>
		
		<div>
		<a href='setAlert.html'>Set an alert</a>
		</div>
		
		<div>
		<a href='deleteAccount.jsp'>Delete Your Account</a>
		</div>
		
<%
	}
%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
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

<section class="items">
	<table border="1" height="100%">
		<%
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			Statement stmt = con.createStatement();
			
	        ResultSet result;
	        
	        String getAllItems = "SELECT * from Items;";
	        result = stmt.executeQuery(getAllItems);
	        
	        ResultSetMetaData metaData = result.getMetaData();
	        
	        while(result.next())
	        {
	            %>
	                <tr>
	                 <%
	                 for(int i = 1; i<=metaData.getColumnCount();i++)
	                    { %>
	                     <td>
	                     <%= result.getString(i)%>
	                     </td>
	                <% 
	                    }
	                %>                   
	                </tr>
	            <% 
	        }
	    %>
	</table>
</section>


</body>
</html>
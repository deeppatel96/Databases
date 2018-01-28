<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Representative Home</title>
<style>
body {
background-image: url(https://spirilio.gr/wp-content/uploads/2016/10/travelco-logo-1.jpg);
-moz-background-size: cover;
-webkit-background-size: cover;
background-size: cover;
background-position: center center !important;
background-repeat: no repeat !important;
background-attachment: fixed;
}
</style>
</head>
<body>
<div align="left">
<a href="EmployeeLogout.jsp">Logout</a>
</div>
<br>
<br>
	<%
	try {
			
			//Create a connection string
			String url = "jdbc:mysql://cs336project2017summer.cdbdnh5z4lat.us-west-2.rds.amazonaws.com:3306/cs336";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "cs336", "cs336test");
					
			//Create a SQL statement
			Statement stmt = con.createStatement();

			// Check user id
			if(request.getSession().getAttribute("userid") != null){
				String id = (String) request.getSession().getAttribute("userid");
				//Make a SELECT query from the Employee table
				String str = "SELECT * FROM Emp_CustomerRep C WHERE C.ID = '" + id +"'";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				//Check the result
				if (!result.next() ) {
					//Employee is a Manager
					response.sendRedirect("Manager.jsp");
					}
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
				
			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("Problem with Database, please contact help desk. Sorry for the inconvenience.");
			request.getSession().setAttribute("userid", null);
		}
%>


Pick one of the following Customer Representative Actions below:
<br>

 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<form method="get" action="CustomerRepActions.jsp" enctype=text/plain>
    <!-- note the CustomerRepActions.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
  <input type="radio" name="command" value="1"/> Record a reservation
  <br>
  <input type="radio" name="command" value="2"/> Add, Edit and Delete information for a customer
  <br>
   <input type="radio" name="command" value="3"/> View Reservation Portfolio for a Customer
  <br>
  <input type="submit" value="submit" />
</form>
<br>
	


</body>
</html>
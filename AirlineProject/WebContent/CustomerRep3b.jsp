<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cancel Reservation</title>
</head>
<body>
<div align="left">
<a href="CustomerRep.jsp">Home</a>
</div>
<div align="left">
<a href="EmployeeLogout.jsp">Logout</a>
</div>
<div align="left">
<a href="CustomerRep3a.jsp">Back</a>
</div>
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
			
			String res = request.getParameter("Reservation");

			//Cancel the reservation
			Statement stmtdel = con.createStatement();
			
			String strdel = "DELETE FROM Passenger WHERE resNo=\""+res+"\";";
			stmtdel.executeUpdate(strdel);
			
			
			strdel = "DELETE FROM Leg WHERE Res_No=\""+res+"\";";
			stmtdel.executeUpdate(strdel);
			

			strdel = "DELETE FROM Reservation WHERE Res_No=\""+res+"\";";
			stmtdel.executeUpdate(strdel);
		
			//close the connection.
			con.close();
			
			out.print("Reservation number "+res+" has been cancelled");
			
		} catch (Exception e) {
			out.print("ERROR: Cancellation failed");
			e.printStackTrace(new java.io.PrintWriter(out));
		}

%>




</body>
</html>
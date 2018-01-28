<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd'});
  } );
  </script>
  <script>
	function onSubmit() {
	    document.getElementById("datepicker").value
	}
	</script>
    <title>Search for Multi-City Flights</title>
        <div align="left">
    <a href="searchReserve.jsp">Home</a>
    </div>
    <div>
    <a href="CustomerLogout.jsp">Logout</a>
    </div>
    <div>
    <a href="makeRes3.jsp">Back</a>
    </div>
</head>
    
<body>			  
<h3>Search for Multi-City Flights</h3>

	<form method="query" action="multiFlightsb.jsp">
	Please enter in the corresponding airport codes.
	<table>
	<tr><td><strong>Origin</strong></td><td><input type="text" maxlength="3" name="origin"></td></tr>
	<tr><td><strong>Destination</strong></td><td><input type="text" maxlength="3" name="destination"></td></tr>
	<tr><td><strong>Date:</strong></td><td><input type="text" id="datepicker" name="departDate"></td></tr>
	</table> 
	
	<input type="submit" value="Find Another Flight">
	</form>
	
	<form method="post" action="res3b.jsp">
		<input type="submit" value="Proceed to Final Checkout">
	</form>
<br>
<br>

</body>
</html>
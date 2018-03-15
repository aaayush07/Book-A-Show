<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Login.loginClass"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book My Show || Show Selection</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<% 
	request.getSession(false);
	if((int)session.getAttribute("userid") > 0){
		int id = (int)session.getAttribute("userid"); 
	}
	else{
		response.sendRedirect("LoginPage");
	}
%>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Book My Show</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span><% String name = nameParse( (String)session.getAttribute("username"));  %> <%= name %></a></li>
      <li><a href="LogOut.jsp"><span class="glyphicon glyphicon-log-in"></span>Log Out</a></li>
    </ul>
  </div>
</nav>
	

	<%
        loginClass obj = new loginClass();
        Connection con = obj.getConnection();
        int city_id = (int)request.getSession(false).getAttribute("city_id");
        int movie_id = (int)request.getSession(false).getAttribute("movie_id");
        String date = (String)request.getSession(false).getAttribute("date");
        int theatre_id[]  = new int[500];
        int i = 0;
        PreparedStatement ps=con.prepareStatement("select theatre_id , theatre_name  from  theatres where city_id = " + city_id + " movie_id = " + movie_id);  
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			theatre_id[ i ] = rs.getInt(1);
			
			 %><button type ="button" class = "btn"><%= rs.getString(2) %></button><br><%
			
				PreparedStatement ps1 =con.prepareStatement("select show_time from Time where theatre_id = " + theatre_id[i] + "and date =" + date +" and movie_id = " + movie_id);  
				ResultSet rs1 = ps.executeQuery();
				while(rs1.next()){
					%><button type = " button" class = "btn"><%= rs1.getString(1) %></button><% 
				}
				i++;
					 
		}
		rs.close();
		ps.close();
        %>

<%!
 		public String nameParse(String id){
		int endIndex = id.indexOf('@');
		return id.substring(0, endIndex);
	}
 %>
</body>
</html>
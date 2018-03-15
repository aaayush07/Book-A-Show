<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Login.loginClass"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book My Show || Welcome Page</title>
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
<div class = "row">
<div class = "col-lg-4"></div>
<div class = "col-lg-4">
<div class="container">
  <form action = "movieToShow">
    <div class="form-group">
      <select class="form-control" id="sel1" name = "city">
        <option disabled selected>Select City</option>
        <%
        loginClass obj = new loginClass();
        Connection con = obj.getConnection();
        PreparedStatement ps=con.prepareStatement("select city_name from  Cities ");  
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			 %><option> <%= rs.getString(1) %></option><% 
		}
		rs.close();
		ps.close();
        %>
      </select>
       
      <select class="form-control" id="sel1" name = "movie">
        <option disabled selected>Select Movie</option>
        <%
        ps = con.prepareStatement("select movie_name from  movies ");  
		rs = ps.executeQuery();
		while(rs.next()) {
		%><option> <%= rs.getString(1) %></option><% 
		}
		rs.close();
		ps.close();
		con.close();
        %>
      </select>

      <input type="date" class="form-control" id="usr" name = "date">
      </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>
</div>
<div class = "col-lg-4"></div>
</div>

<%!
 		public String nameParse(String id){
		int endIndex = id.indexOf('@');
		return id.substring(0, endIndex);
	}
 %>
</body>
</html>
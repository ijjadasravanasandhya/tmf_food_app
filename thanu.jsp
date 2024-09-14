<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="thanu.css">
<style >

.logo-img{

 width: 300px;
  height: 200px;
}




</style>
</head>
<body>

	<div class="header">
            <div class="logo">
                <img class="logo-img" src="https://static.vecteezy.com/system/resources/previews/004/204/924/original/food-logo-template-design-icon-illustration-vector.jpg"/>
            </div>
             <div class="nav-items">
        		<ul>
          			<li>Home</li>
          			<li>About Us</li>
          			<li>Contact Us</li>
          			<li>Cart</li>
       			</ul>
      		 </div>
    </div>
    
    
    <%
    
    String jdbcURL = "jdbc:mysql://localhost:3306/tmf_fiood";
    String jdbcUsername = "root";
    String jdbcPassword = "sgst@123";

    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
       
        Class.forName("com.mysql.cj.jdbc.Driver");

       
        con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

       
        statement = con.createStatement();

        
        String sql = "SELECT * FROM restuarant_owner";
        resultSet = statement.executeQuery(sql);

       
        while (resultSet.next()) {
            String res_img = resultSet.getString(15);
            String name = resultSet.getString(2);
            String avg = resultSet.getString(3);
            String costForTwo = resultSet.getString(4);
            String open_time=resultSet.getString(5);
            String close_time=resultSet.getString(6);
            String cuisins=resultSet.getString(8);
%>
    
    <div class="res-container">
    <div class="res-card" >
        <img
          class="res-logo"
          alt="res-logo"
          src="<%= res_img %>";  
        />
        <h3><%= name %></h3>
        <h4><%= avg %></h4>
        <h4><%= costForTwo %></h4>
        <h4><%= open_time%></h4>
        <h4><%= close_time %></h4>
        <h4><%= cuisins %></h4>
    </div>
    </div>
    
<%
        } 
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
       if (con != null) try { con.close(); } catch (SQLException ignore) {}
    }
%>

</body>
</html>
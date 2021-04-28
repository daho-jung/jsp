<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	try{
		String url = "jdbc:mysql://localhost:3306/shop_db";
		String user = "root";
		String pwd = "5328";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pwd);
	}catch(SQLException e){
		out.println(e.getMessage());
	}finally{
		//if(conn != null)
			//conn.close();
	}
%>
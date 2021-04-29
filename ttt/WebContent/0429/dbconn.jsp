<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	try{
		String url = "jdbc:mysql://localhost:3306/shopping";
		String user = "root";
		String pwd = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pwd);
		out.println("connect success<br>");
	}catch(SQLException e){
		out.println(e.getMessage());
	}finally{
		//if(conn != null)
			//conn.close();
	}
%>
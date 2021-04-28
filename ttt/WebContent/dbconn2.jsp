<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/product";
	String user = "root";
	String pwd = "";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, pwd);
	
	out.println("succ");
%>

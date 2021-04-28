<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String price = request.getParameter("price");
	String date = request.getParameter("date");
	String company = request.getParameter("comp");
	String rem = request.getParameter("rem");
	
	Statement stmt = null;
	ResultSet rs = null;
	try{
		String sql = "select * from  product";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			out.print("p_name= "+rs.getString("pname")+", price= "+rs.getString("price")+", ");
			out.print("date: "+rs.getString("pdate")+", company= "+rs.getString("pcomp")+", ");
			out.print("remain= "+rs.getString("remain")+"<br>");
		}
	}catch(SQLException e){
		out.println("select fail");
		out.println(e.getMessage());
	}finally{
		if(stmt != null)
			stmt.close();
		if(conn != null)
			conn.close();
	}
	%>
	
</body>
</html>
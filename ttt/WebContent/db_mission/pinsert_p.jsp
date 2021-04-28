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
	// insert into product values('11','11','2011-1-1','1','1');
	try{
		String sql = "insert into product values('"+name+"', '";
		sql+= price+"', '"+date+"', '"+company+"', '"+rem+"');";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		out.println("insert succ");
	}catch(SQLException e){
		out.println("insert fail");
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
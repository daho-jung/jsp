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
	String id = request.getParameter("id");
	
	Statement stmt = null;
	ResultSet rs = null;
	try{
		String sql = "select * from  member where mem_id='"+id+"';";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			String qid = rs.getString("mem_id");
			String name = rs.getString("mem_name");
			String pw = rs.getString("mem_pass");
			out.println("id :"+qid+" name :"+name+" pwd :"+pw+"<br>");
		}
	}catch(SQLException e){
		out.println("del fail");
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
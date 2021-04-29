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
	String pw = request.getParameter("pw");
	
	Statement stmt = null;
	ResultSet rs = null;
	try{
		String sql = "select * from  member where id='"+id+"';";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		int cnt = 0;
		while(rs.next()){
			String qid = rs.getString("id");
			//String name = rs.getString("mem_name");
			String qpw = rs.getString("mem_pass");
			if(pw.equals(qpw)){//login succ
				session.setAttribute("mem_id", qid);
				session.setAttribute("mem_pass", qpw);
//				out.println("id :"+qid+" name :"+name+" pwd :"+pw+"<br>");
				out.println("<a href='http://localhost:8080/ttt/4_1cli.jsp?'>login</a>");
			}else
				out.println("password is incorrect");
			cnt++;
		}
		if(cnt == 0)
			out.println("there is no user "+id);
	}catch(SQLException e){
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
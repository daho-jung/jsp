<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	
	Statement stmt = null;
	ResultSet rs = null;
	try{
		String sql = "select ID from  members where name='"+name+"';";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		int cnt = 0;
		while(rs.next()){
			out.print("id : "+rs.getString("ID")+"<br>");
			cnt++;
		}
		if(cnt == 0)
			out.print("no result!");
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
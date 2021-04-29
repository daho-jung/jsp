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
	String id = request.getParameter("ID");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	Statement stmt = null;
	// insert into product values('11','11','2011-1-1','1','1');
	if(!id.equals("") && !password.equals("") && !name.equals("")){
		try{
			String sql = "insert into members values('"+id+"', '";
			sql+= password+"', '"+name+"', '"+address+"', '"+email+"', '"+phone+"');";
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
	}else{
		out.println("id, password, name is neccessary!");
	}
	
	%>
</body>
</html>
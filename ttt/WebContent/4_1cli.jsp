<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String mem_id = (String)session.getAttribute("mem_id");
	String mem_pass = (String)session.getAttribute("mem_pass");
	if(mem_id == null || mem_pass == null){
		out.println("access deny");
		return;
	}
%>
<form action="4_1server.jsp" method="post" enctype="multipart/form-data" name="fileform">
	<p> file :<input type="file" name="fname">
	<p> out_filename :<input type="text" name="out_fn">
	<p> <select name="opt">
		<option value="">--choice--</option>
		<option value="1">move</option>
		<option value="2">inv</option>
		<option value="3">add value</option>
		<option value="4">emphasize</option>
		<option value="5">shrink</option>
		<option value="6">masking blur</option>
		<option value="7">masking embos</option>
		<option value="8">bandw</option>
		<option value="9">rotate</option>
		</select>
	<p> value :<input type="text" name="vvv"><br>
	<input type="submit" value="do it!">
</form>
</body>
</html>
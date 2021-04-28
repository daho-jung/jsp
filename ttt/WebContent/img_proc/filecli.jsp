<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name="fileform" method="post" enctype="multipart/form-data" action="fileserv.jsp">
	<p> name : <input type="text" name="name">
	<p> sub : <input type="text" name="sub">
	<p>file :<input type="file" name="fname">
	<p><input type="submit" value="upload">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="login_p.jsp">
		<p> id: <input type="text" name="id">
		<p> pw: <input type="password" name="pw">
		<p><input type="submit" value="ok"><br>
		<p><a href='http://localhost:8080/ttt/register.jsp'>register</a>
		<p><a href='http://localhost:8080/ttt/fid.jsp'>find id</a>
	</form>
</body>
</html>
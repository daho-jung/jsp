<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="img_serv.jsp" method="post">
	<p> input file path :<input type="text" name="file_path" value="C:/Users/Administrator/Desktop/images/RAW/256/">
	<p> inp_filename :<input type="text" name="in_fn" value="LENA256.RAW">
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
		<option value="8">b&w</option>
		<option value="9">rotate</option>
		</select>
	<p> value :<input type="text" name="vvv"><br>
	<input type="submit" value="do it!">
</form>
</body>
</html>
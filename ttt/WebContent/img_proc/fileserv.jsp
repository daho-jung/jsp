<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	MultipartRequest multi = new MultipartRequest(request, "C:\\upload",5*1024*1024, "utf-8",new DefaultFileRenamePolicy());
	
	String tmp;
	Enumeration params = multi.getParameterNames();
	
	tmp = (String) params.nextElement();
	String name = multi.getParameter(tmp);
	tmp = (String) params.nextElement();
	String sub = multi.getParameter(tmp);
	out.println("n :"+name+" sub :"+sub);
	
	Enumeration files = multi.getFileNames();
	tmp = (String) files.nextElement();
	String fname = multi.getFilesystemName(tmp);//saved filename
	
	out.println("fname :"+fname);
%>
</body>
</html>
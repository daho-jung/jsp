<%@ page contentType="application;" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.text.*"%>
<%
	// use => http://localhost:8080/projectname…/download.jsp?file=filename…

	String strFilename=java.net.URLDecoder.decode(request.getParameter("file"));
	String strFilenameOutput=new String(strFilename.getBytes("euc-kr"),"8859_1");
	File file=new File("c:/upload/"+strFilename); 
	byte b[]=new byte[(int)file.length()];
	response.setHeader("Content-Disposition","attachment;filename="+strFilenameOutput);
	response.setHeader("Content-Length",String.valueOf(file.length()));
	if(file.isFile()){
		out.clear();
		out=pageContext.pushBody();
		BufferedInputStream fin=new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream outs=new BufferedOutputStream(response.getOutputStream());
		int read=0;
		while((read=fin.read(b))!=-1){
			outs.write(b,0,read);
		}
		outs.close();
		fin.close();

		
	}
%>
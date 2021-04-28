<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- file in C:\Users\Administrator\Desktop\images\RAW\256 -->
	<%
	//
		File inf, outf;
		FileInputStream infs;
		FileOutputStream outfs;
		String filepath = "C:/Users/Administrator/Desktop/images/RAW/256/";
		inf = new File("C:/Users/Administrator/Desktop/images/RAW/256/LENA256.RAW");
		outf = new File(filepath+"lena-inv.RAW");
		
		infs = new FileInputStream(inf.getPath());
		outfs = new FileOutputStream(outf.getPath());
		//
		int fw = 256, fh  = 256;
		int outw=256,outh=256;
		
		int[][] inimg = new int[fw][fh];
		int[][] outimg = new int[outw][outh];
		//
		for(int i=0;i<fw;i++){
			for(int j=0;j<fh;j++){
				inimg[i][j] = infs.read();
			}
		}
		
		for(int i=0;i<fw;i++){
			for(int j=0;j<fh;j++){
				outimg[i][j] = 255-inimg[i][j];
			}
		}
		
		for(int i=0;i<fw;i++){
			for(int j=0;j<fh;j++){
				outfs.write(outimg[i][j]);
			}
		}
		
		infs.close();
		outfs.close();
	%>

</body>
</html>
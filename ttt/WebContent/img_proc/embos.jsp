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
		outf = new File(filepath+"lena-emb.RAW");
		
		infs = new FileInputStream(inf.getPath());
		outfs = new FileOutputStream(outf.getPath());
		//
		int fw = 256, fh  = 256;
		int outw=256,outh=256;
		
		int[][] inimg = new int[fw][fh];
		int[][] outimg = new int[outw][outh];
		int[][] mask = {{-1,0,0},{0,0,0},{0,0,1}};
		//
		for(int i=0;i<fw;i++){
			for(int j=0;j<fh;j++){
				inimg[i][j] = infs.read();
			}
		}
		
		for(int i=0;i<fw;i++){
			for(int j=0;j<fh;j++){
				if((i > 0 && i < outw-1) && (j>0 && j<outh-1))
					outimg[i][j] = inimg[i-1][j-1]*mask[0][0] + inimg[i+1][j+1]*mask[2][2];
				else
					outimg[i][j] = 0;
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
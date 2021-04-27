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
	int opt = Integer.parseInt(multi.getParameter(tmp));
	tmp = (String) params.nextElement();
	int value = Integer.parseInt(multi.getParameter(tmp));
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String savefname = multi.getFilesystemName(fname);
	
	
	File inf, outf;
	FileInputStream infs;
	FileOutputStream outfs;
	String filepath = "C:/upload/";
	inf = new File(filepath+savefname);
	outf = new File(filepath+name);
	
	infs = new FileInputStream(inf.getPath());
	outfs = new FileOutputStream(outf.getPath());
	//
	int fw, fh;	//filewidth, fileheight
	int outw=0, outh=0;
	long flen = inf.length();
	fw = fh = (int)Math.sqrt(flen);
	
	int[][] inimg = new int[fw][fh];
	for(int i=0;i<fw;i++){
		for(int j=0;j<fh;j++){
			inimg[i][j] = infs.read();
		}
	}
	infs.close();
	if(inf.exists())
		inf.delete();
	
	int[][] outimg=null;
	outw = outh = fw;
	
	switch(opt){
	case 1 ://move point
		outimg = new int[outw][outh];
		for(int i=0;i<outw;i++){
			for(int j=0;j<outh;j++){
				if(i<=value || j<=value){
					outimg[i][j] = 0;
				}else if(i+value < outw && j+value < outh)
					outimg[i+value][j+value] = inimg[i][j];
				
			}
		}
		break;
	case 2 ://inverse
		outimg = new int[outw][outh];
		for(int i=0;i<fw;i++){
			for(int j=0;j<fh;j++){
				outimg[i][j] = 255-inimg[i][j];
			}
		}
		break;
	case 3 ://addvalue
		outimg = new int[outw][outh];
		for(int i=0;i<fw;i++){
			for(int j=0;j<fh;j++){
				outimg[i][j] = inimg[i][j]+value;
				if(outimg[i][j] > 255)
					outimg[i][j] = 255;
				else if(outimg[i][j] <0)
					outimg[i][j] = 0;
			}
		}
		break;
	case 4 ://empasize
		outw = value*fw;
		outh = value*fh;
		outimg = new int[outw][outh];
		for(int i=0;i<outw;i++){
			for(int j=0;j<outh;j++){
				outimg[i][j] = inimg[i/value][j/value];
			}
		}
		break;
	case 5 ://shrink
		outw = fw/value;
		outh = fh/value;
		outimg = new int[outw][outh];
		for(int i=0;i<outw;i++){
			for(int j=0;j<outh;j++){
				outimg[i][j] = inimg[i*value][j*value];
			}
		}
		break;
	case 6://mask-blur
		outimg = new int[outw][outh];
		int t1=1,t2=9;
		double maskv = (double)t1/t2;
		double[][] maskb = {{maskv,maskv,maskv},{maskv,maskv,maskv},{maskv,maskv,maskv}};
		double temp=0.0;
		for(int i=0;i<outw;i++){
			for(int j=0;j<outh;j++){
				if((i >0 && i < outw-1) && (j>0 && j<outh-1)){
					for(int x=0;x<3;x++){
						for(int y=0;y<3;y++){
							temp += maskb[x][y]*inimg[i-1+x][j-1+y];
						}
					}
					outimg[i][j] = (int)temp;
					temp = 0.0;
				}
				else	
					outimg[i][j] = inimg[i][j];
			}
		}
		break;
	case 7 ://mask-embos
		outimg = new int[outw][outh];
		int[][] maskemb = {{-1,0,0},{0,0,0},{0,0,1}};
		int tem = 0;
		for(int i=0;i<fw;i++){
			for(int j=0;j<fh;j++){
				if((i > 0 && i < outw-1) && (j>0 && j<outh-1)){
					for(int x=0;x<3;x++){
						for(int y=0;y<3;y++){
							tem += maskemb[x][y]*inimg[i-1+x][j-1+y];
						}
					}
					outimg[i][j] = tem;
					tem=0;
				}
				else
					outimg[i][j] = 0;
			}
		}
		break;
	case 8 ://b&w
		outimg = new int[outw][outh];
		for(int i=0;i<fw;i++){
			for(int j=0;j<fh;j++){
				if(inimg[i][j] < 128){
					outimg[i][j] = 0;
				}else
					outimg[i][j] = 255;
			}
		}
		break;
	case 9 ://rot
		outimg = new int[outw][outh];
		int c = outw/2, xd, yd;
		double rad = value*Math.PI/180.0;
		for(int i=0;i<outw;i++){
			for(int j=0;j<outh;j++){
				xd = (int)(Math.cos(rad)*(j-c) - Math.sin(rad)*(i-c)+c);
				yd = (int)(Math.sin(rad)*(j-c)+Math.cos(rad)*(i-c)+c);
				if((0<=xd && xd<outh) && (0<=yd && yd<outw))
					outimg[i][j] = inimg[xd][yd];
			}
		}
	}//end switch
	
	for(int i=0;i<outw;i++){
		for(int j=0;j<outh;j++){
			outfs.write(outimg[i][j]);
		}
	}
	outfs.close();
%>
success?
</body>
</html>
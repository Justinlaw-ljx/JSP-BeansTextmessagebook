<%@ page import ="java.util.*" %>
<%@ page contentType="text/html; charset=GBK" %>
<jsp:useBean id="redhat" class="com.my.www.redhat.myfile"  scope="request" />
<%@ include file="config.jsp" %>
<%@ include file="checkData.jsp" %>
<%
String inpass = request.getParameter("inpass");
String id = request.getParameter("id");
String remsg = "";
String html = "";
if(request.getParameter("remsg") != null){
remsg = new String(request.getParameter("remsg").getBytes("ISO8859-1"));
}
if(request.getParameter("html") != null){
	html = request.getParameter("html");
	checkData cData = new checkData(remsg);//��ʼ��ʵ��
	if(html.equals("yes") == true){//���ʹ��HTML��ʽ�ظ�����\
    remsg = cData.killHtml(false);   //�����ε����HTML����Ĵ���
	}
	else {//�������ô���
	remsg = cData.formatHtml(false);
	}
}
String s1 = "";
//����Beansȡ�ø�ID���ļ�����
redhat.setFile(file);
String s = new String(redhat.fileRead());
String[] tmp = s.split(sp1);
String[] tmps;
int i = 0;
StringBuffer sb = new StringBuffer("");

if(inpass != null){

	if(inpass.equals(pass)){
    
       for(;i<tmp.length;i++){
		   tmps = tmp[i].split(sp);
		   if(tmps[0].equals(id)){ sb.append(tmps[0]+sp+tmps[1]+sp+tmps[2]+sp+tmps[3]+sp+tmps[4]+sp+tmps[5]+sp+tmps[6]+sp+tmps[7]+sp+tmps[8]+sp+remsg);
		   }
		   else{
			   sb.append(tmp[i]);
		   }
		   sb.append(sp1);
	}
                //  out.println(sb);

                redhat.setMsg( new String(sb) );
				redhat.fileWrite();
                out.println("<html><head><title>���Իظ��ɹ�</title><meta HTTP-EQUIV=\"REFRESH\" CONTENT=\"2;URL=index.jsp\"></head></body>");
				out.println("<a href=\"index.jsp\">�ظ����Գɹ�������˴��ص����Ա���ҳ</a></body></html>");
    }
	else {
		out.println("�������,<a href=\"JavaScript:window.history.back(-1)\">����</a>");
	}

}

//�������뻭��
else {

for(;i<tmp.length;i++){
    tmps = tmp[i].split(sp);
	if(tmps[0].equals(id)){
		try{
		s1 = tmps[9];
		s1 = s1.replaceAll("&nbsp;"," ");
		s1 = s1.replaceAll("<br>","\n");
		}
		catch(Exception e){}
		break;
	}
}

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%=gbname%>::�ظ�����</title>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=styleFile%>" rel=stylesheet>
</head>
<body bgcolor='#ffffff'>
<center>
<p>
	<span style="font-size:16px;color:#b50000"><%=gbname%>::�ظ�����</span>
	<hr size=1 color=gray>
	<table cellpadding='4' cellspacing='0' border='0' width='60%' align='center' class="write">
<tr bgcolor="white"><Td>
	<form action="<%=request.getRequestURL()%>" method="post">
	<input type="hidden" name="id" value="<%=id%>">
	�ظ����룺<input type="password" name="inpass" >
    <br>
				<p>
		�ظ����ݣ�<textarea name="remsg" cols=50 rows=6><%=s1%></textarea>
		</p>
		ʹ��HTML��ʽ�ظ���&nbsp;&nbsp;��<input type="radio" name="html" value="yes" checked>&nbsp;&nbsp;��<input type="radio" name="html" value="no" >
			
	<br>	<br>
	<center><input type="submit" value="�ظ�">&nbsp;&nbsp;<input type="reset" value="���"></center>
	</form>
</td></tr>
</table>
</p>
			<p><%=copyright%></p>
</center>
</body>
</html>
	<%
}
	%>
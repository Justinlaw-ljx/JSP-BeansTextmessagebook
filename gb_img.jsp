<%@ page import="java.util.*" %>
<%@ include file="config.jsp" %>
<%@ page contentType="text/html; charset=GBK" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%=gbname%>::个性头像查看</title>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=styleFile%>" rel=stylesheet>
</head>
<body>
<table cellspacing=1 cellpadding=3 width=98% bgcolor="black">
<%
int moffset = 5;
int tmp = 0;
int tmp1;
out.println("<tr bgcolor=white>");
for(int i=1;i<=59;i++){
	String s = ( new Integer(i)).toString();
	s =  "Image"+s+".gif";
	out.print("<Td align=\"center\">");
	out.print("<img src=images/"+s+" border=0 width=32 height=32><br>"+s);
	out.print("</td>");
	tmp++;
	if(tmp>=moffset){
		tmp=0;
		out.println("</tr><Tr bgcolor=white>");
	}
	}
	tmp1 = moffset-tmp;
	if(tmp1>=1){
		out.println("<Td colspan="+tmp1+" align=center><button onClick=\"JavaScript:window.close(this.window);\">关闭窗口</button></td></tr>");
}
%>
</table>
</body>
</html>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=GBK" %>
<jsp:useBean id="redhat" class="com.my.www.redhat.myfile" scope="request" />
<%@ include file="config.jsp" %>
<%

String id = "";

if(request.getParameter("id") != null){
id = request.getParameter("id");
}

String inpass;

String errmsg;

redhat.setFile(file);

String s = new String(redhat.fileRead());

String[] tmp = s.split(sp1);

String[] tmps;

StringBuffer sb = new StringBuffer("");

int l = tmp.length;

if(request.getParameter("inpass") != null){

	inpass = request.getParameter("inpass");
	if(inpass.equals(pass)){
    for(int i=0;i<l;i++){
       tmps = tmp[i].split(sp);
	   if(tmps[0].equals(id)){
		   continue;
	   }
	   else{
        sb.append(tmp[i]+sp1);
	   }
	}
	redhat.setMsg(new String(sb));
	redhat.fileWrite();
	out.println("<script language=\"javascript\">alert('ɾ�����Գɹ�');window.location.href=\"index.jsp\";</script>");
		}
    else{
        errmsg = "�������<a href=\"javascript:window.history.back(-1)\">����˴�����</a>";
		out.println(errmsg);
	}
	
}
else{
%>
<html>
<head>
<title>ɾ������</title>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="style.css" rel=stylesheet>
</head>
<body bgcolor='#ffffff'>
<center>
<p>
	<span style="font-size:15px;color:red">ɾ������</span>
	<hr size=1 color=gray>
	<table cellpadding='4' cellspacing='0' border='0' width='60%' align='center' class="write">
<tr bgcolor="white"><Td>
	<form action="<%=request.getRequestURL()%>" method="post">
	<input type="hidden" name="id" value="<%=id%>">
	���룺<input type="password" name="inpass" >
<center><input type="submit" value="ɾ��"></center>
	</form>
</td></tr>
</table>
</p>
</center>
</body>
</html>
<%
}
%>
<%@ include file="config.jsp" %>
<%@ page contentType="text/html; charset=GBK" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>�鿴������IP</title>
<meta http-equiv=Content-Type content="text/html; charset=GBK">
<LINK href="<%=styleFile%>" rel=stylesheet>
</head>
<body bgcolor='#ffffff'>
<center>
<p>
<%

String inpass = request.getParameter("inpass");

if(inpass == null) inpass = "nopass";

String id = request.getParameter("id");

if(id == null) id = "id";

%>
<jsp:useBean id="redhat" class="com.my.www.redhat.myfile" scope="request" />
<%

redhat.setFile(file);
String msg = new String(redhat.fileRead());
String[] tmp = msg.split(sp1);
String[] tmps;
boolean find = false;
for(int i=0;i<tmp.length;i++){
tmps = tmp[i].split(sp);
if( tmps[0].equals(id) && inpass.equals(pass) ){
		 find = true;
		 out.println("IDΪ"+id+"������IPΪ��"+tmps[1]);
         out.println("<p><button onClick=\"javascript:window.history.back(-1);\">����</button></p>");
		 break;
	 }
}
if(!find && inpass.equals(pass)) {
	out.println("�Ҳ���");
    out.println("<p><button onClick=\"javascript:window.history.back(-1);\">����</button></p>");
}

if(inpass.equals("nopass")){

%>
<table cellpadding='4' cellspacing='0' border='0' width='50%' align='center' class="write">
<tr bgcolor="white"><Td>
	<form action="<%=request.getRequestURL()%>" method="post">
	<input type="hidden" name="id" value="<%=id%>">
	������鿴IP���룺<input type="password" name="inpass" >&nbsp;<input type="submit" value="�鿴">
	</form>
</td></tr>
</table>
<%

}


if(!find && inpass.equals("nopass") == false){
out.println("�������");
out.println("<p><button onClick=\"javascript:window.history.back(-1);\">����</button></p>");
}
%>
<p><button onClick="javascript:window.close(this.window);">�رմ���</button></p>
</p>
</center>
</body>
</html>
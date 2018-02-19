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
	checkData cData = new checkData(remsg);//初始化实例
	if(html.equals("yes") == true){//如果使用HTML格式回复留言\
    remsg = cData.killHtml(false);   //则屏蔽掉清除HTML代码的代码
	}
	else {//否则保留该代码
	remsg = cData.formatHtml(false);
	}
}
String s1 = "";
//调用Beans取得该ID的文件内容
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
                out.println("<html><head><title>留言回复成功</title><meta HTTP-EQUIV=\"REFRESH\" CONTENT=\"2;URL=index.jsp\"></head></body>");
				out.println("<a href=\"index.jsp\">回复留言成功，点击此处回到留言薄首页</a></body></html>");
    }
	else {
		out.println("密码错误,<a href=\"JavaScript:window.history.back(-1)\">后退</a>");
	}

}

//输入密码画面
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
<title><%=gbname%>::回复留言</title>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=styleFile%>" rel=stylesheet>
</head>
<body bgcolor='#ffffff'>
<center>
<p>
	<span style="font-size:16px;color:#b50000"><%=gbname%>::回复留言</span>
	<hr size=1 color=gray>
	<table cellpadding='4' cellspacing='0' border='0' width='60%' align='center' class="write">
<tr bgcolor="white"><Td>
	<form action="<%=request.getRequestURL()%>" method="post">
	<input type="hidden" name="id" value="<%=id%>">
	回复密码：<input type="password" name="inpass" >
    <br>
				<p>
		回复内容：<textarea name="remsg" cols=50 rows=6><%=s1%></textarea>
		</p>
		使用HTML格式回复：&nbsp;&nbsp;否<input type="radio" name="html" value="yes" checked>&nbsp;&nbsp;是<input type="radio" name="html" value="no" >
			
	<br>	<br>
	<center><input type="submit" value="回复">&nbsp;&nbsp;<input type="reset" value="清空"></center>
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
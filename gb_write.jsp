<%@ page import ="java.util.*" %>
<%@ include file="config.jsp" %>
<%@ include file="checkData.jsp" %>
<%@ page contentType="text/html; charset=GBK" %>
<%
	//取得相关的变量
	//-----------------------
	//客户留言者IP

String ip = request.getRemoteAddr();//取得留言时间

String errmsg = "";

boolean err = false;

Date d = new Date();long time = d.getTime();

String name = "",email = "",pagename = "",pageurl = "",text = "",sex = "",img = "";

checkData cData = new checkData("");

name = new String(request.getParameter("newname").getBytes("ISO8859-1"));

email = new String(request.getParameter("newemail").getBytes("ISO8859-1"));	
cData.setS(email);
	  if(cData.checkMail() == false) {
		  			errmsg = "Email输入有错";
					err = true;
    	}

pagename = new String(request.getParameter("newpagename").getBytes("ISO8859-1"));

pageurl = new String(request.getParameter("newpageurl").getBytes("ISO8859-1"));

text = new String(request.getParameter("newtext").getBytes("ISO8859-1"));
				
sex = request.getParameter("sex");

img = request.getParameter("img");

cData.setS(name);
name = cData.killHtml(true);

cData.setS(email);
email = cData.killHtml(true);

cData.setS(pagename);
pagename = cData.killHtml(true);

cData.setS(pageurl);
pageurl = cData.killHtml(true);

cData.setS(text);
text = cData.killHtml(false);

cData.setS(sex);
sex = cData.killHtml(true);

cData.setS(img);
img = cData.killHtml(true);
if(name.length() > limit_name) {
		  			errmsg = "昵称最长不能超过<b>"+limit_name+"</b>位字符";
					err = true;
}
if(email.length() > limit_email) {
		  			errmsg = "EMAIL最长不能超过<b>"+limit_email+"</b>位字符";
					err = true;
}
if(pagename.length() > limit_pagename) {
		  			errmsg = "主页名称最长不能超过<b>"+limit_pagename+"</b>位字符";
					err = true;
}
if(pageurl.length() > limit_pageurl) {
		  			errmsg = "主页地址最长不能超过<b>"+limit_pageurl+"</b>位字符";
					err = true;
}
if(text.length() > limit_text) {
		  			errmsg = "留言最长不能超过<b>"+limit_text+"</b>位字符";
					err = true;
}
if(name.equals("") == true || (new String(text)).replaceAll("&nbsp;","").equals("") == true){
			errmsg = "请填好必填项目再提交";
			err = true;
		}
String msg = time+sp+ip+sp+name+sp+email+sp+pagename+sp+pageurl+sp+text+sp+sex+sp+img+sp1;
//out.println(msg);
//-----------------------//获取变量结束
%>
<jsp:useBean id="redhat" class="com.my.www.redhat.myfile" scope="request" />
<%
//调用JAVABEANS以写入留言数据
if(!err){
redhat.setFile(file);
redhat.setMsg(msg);
redhat.fileWrite(true);
out.println("<script>window.location.href=\"index.jsp\";</script>");
}
else{
	out.println(errMsg(errmsg,gbname,copyright));
	/*
	out.println(errmsg+"<br><a href=\"javascript:window.history.back(-1);\">点击此处返回重填</a>");
	*/
	}
	//---------------------//写入数据完毕
%>
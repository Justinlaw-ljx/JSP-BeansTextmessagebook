<%@ page import ="java.util.*" %>
<%@ include file="config.jsp" %>
<%@ include file="checkData.jsp" %>
<%@ page contentType="text/html; charset=GBK" %>
<%
	//ȡ����صı���
	//-----------------------
	//�ͻ�������IP

String ip = request.getRemoteAddr();//ȡ������ʱ��

String errmsg = "";

boolean err = false;

Date d = new Date();long time = d.getTime();

String name = "",email = "",pagename = "",pageurl = "",text = "",sex = "",img = "";

checkData cData = new checkData("");

name = new String(request.getParameter("newname").getBytes("ISO8859-1"));

email = new String(request.getParameter("newemail").getBytes("ISO8859-1"));	
cData.setS(email);
	  if(cData.checkMail() == false) {
		  			errmsg = "Email�����д�";
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
		  			errmsg = "�ǳ�����ܳ���<b>"+limit_name+"</b>λ�ַ�";
					err = true;
}
if(email.length() > limit_email) {
		  			errmsg = "EMAIL����ܳ���<b>"+limit_email+"</b>λ�ַ�";
					err = true;
}
if(pagename.length() > limit_pagename) {
		  			errmsg = "��ҳ��������ܳ���<b>"+limit_pagename+"</b>λ�ַ�";
					err = true;
}
if(pageurl.length() > limit_pageurl) {
		  			errmsg = "��ҳ��ַ����ܳ���<b>"+limit_pageurl+"</b>λ�ַ�";
					err = true;
}
if(text.length() > limit_text) {
		  			errmsg = "��������ܳ���<b>"+limit_text+"</b>λ�ַ�";
					err = true;
}
if(name.equals("") == true || (new String(text)).replaceAll("&nbsp;","").equals("") == true){
			errmsg = "����ñ�����Ŀ���ύ";
			err = true;
		}
String msg = time+sp+ip+sp+name+sp+email+sp+pagename+sp+pageurl+sp+text+sp+sex+sp+img+sp1;
//out.println(msg);
//-----------------------//��ȡ��������
%>
<jsp:useBean id="redhat" class="com.my.www.redhat.myfile" scope="request" />
<%
//����JAVABEANS��д����������
if(!err){
redhat.setFile(file);
redhat.setMsg(msg);
redhat.fileWrite(true);
out.println("<script>window.location.href=\"index.jsp\";</script>");
}
else{
	out.println(errMsg(errmsg,gbname,copyright));
	/*
	out.println(errmsg+"<br><a href=\"javascript:window.history.back(-1);\">����˴���������</a>");
	*/
	}
	//---------------------//д���������
%>
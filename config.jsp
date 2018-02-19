<%
String gbname = "Redhat的留言薄";//留言薄名字
String copyright = "程序：<a href=\"mailto:redhat@2002.buyionline.net\" title=\"给Redhat写信\">Redhat</a>|主页：<a href=\"http://2002.buyionline.net\" title=\"访问Redhat的主页\" target=\"_blank\">http://2002.buyionline.net</a>";//留言薄底部的版权信息
String pass = "redhat";//密码
String data = "text.txt";//数据文件
String styleFile = "style.css";
int offset = 6;//每页显示多少条留言
int limit_text = 1000;//留言超过1000字符即自动剪掉多余字符，以下同理
int limit_name = 15,limit_email = 60,limit_pagename = 60,limit_pageurl = 80;
//limit_name为昵称,limit_email为EMAIL,....
///////////////////////////////////////


String file = request.getRealPath("")+request.getServletPath();
file = file.replace('\\','/');
String[] f_tmp = file.split("/");
StringBuffer f_sb = new StringBuffer("");
for(int i=0;i<f_tmp.length-1;i++){
f_sb.append(f_tmp[i]+"/");
}
f_sb.append("text.txt");
file = new String(f_sb);
//out.println(file);
String sp = "#_#";//字段分隔符
String sp1 = "<!--newLine-->";//行与行之间的分隔符
%>
<%! public String errMsg(String msg,String gbname,String copyright){
	return "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"><html><head><title>"+gbname+"- 出错信息提示</title><meta name=\"Description\"  content=\"PHP,Redhat,PHP开放代码\"><meta name=\"keywords\" content=\"Redhat,http://2002.buyionline.net,PHP开放代码\"><LINK href=\"style.css\" rel=stylesheet><meta http-equiv=Content-Type content=text/html;charset=gb2312></head><body><center><!-----------------------------------center----------------------------------><table border=0 width=590 cellspacing=0 cellpadding=0><tr><td align=right><img src='images/center_error.gif' border=0></td></tr><tr><td align=center height=380><table border=0 cellpadding=0 cellspacing=0 width=534>  <tr>   <td colspan=3><img src=images/error_r1_c1.gif width=534 height=42 border=0></td>   <td><img src=images/error/spacer.gif width=1 height=42 border=0></td>  </tr>  <tr>   <td rowspan=2><img src=images/error_r2_c1.gif width=43 height=239 border=0></td><td width=479 height=228 align=center bgcolor=#f7f7f7 class=htd><font class=red><big>出错啦！</big></font><hr size=1><font color=#336699><b>"+msg+"</b></font><hr size=1><a href=\"#\" onClick=\"JavaScript:window.history.back(-1);\">返回前页</a></td>   <td rowspan=2><img src=images/error_r2_c3.gif width=12 height=239 border=0></td>   <td><img src=images/spacer.gif width=1 height=228 border=0></td>  </tr>  <tr>   <td><img src=images/error_r3_c2.gif width=479 height=11 border=0></td>   <td><img src=images/spacer.gif width=1 height=11 border=0></td>  </tr></table><br></td></tr></table><p>"+copyright+"</p></center></body></html>";
}
%>

<%@ include file="config.jsp" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="ubb" class="com.my.www.redhat.DataFilter"  scope="request" />
<%@ page contentType="text/html; charset=GBK" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%=gbname%></title>
<meta http-equiv=Content-Type content="text/html; charset=GBK">
<LINK href="<%=styleFile%>" rel=stylesheet>
<script language="JavaScript">

function ow(url){
window.open(url,'','width=640,height=400,resizable=yes,scrollbars=1,directories=no');return;
}
</script>
</head>
<body>
<center>
<!-------------------->
<p>
<table cellpadding='4' cellspacing='0' border='0' width='80%' align='center' class="write">
 <tr bgcolor="#eeeeef">
  <td>
  <center><b><%=gbname%>--��<font color=red>*</font>�ŵı��� </b></center>
  <hr size=1 color=gray>
<table border=0 cellpadding=3 cellspacing=2 width="100%" align="center" ><form name="form1" action="gb_write.jsp" method="post" >
        <tr> 
          <td width=20%>�������:<font color=red>*</font></td>
          <td width=30%><input type="text" name="newname"></td>
          <td width=20%>�����ʼ�:<font color=red>*</font></td>
          <td width=30%> <input type="text" name="newemail"></td>
        </tr>
        <tr> 
          <td width=20%>��ҳ����:</td>
          <td width=30%><input type="text" name="newpagename"></td>
          <td width=20%>��ҳ��ַ:</td>
          <td width=30%><input type="text" name="newpageurl" value="http://"></td>
        </tr>
        <tr>
          <td width=20%>�Ա�:</td>
          <TD width=40%><font color="#b50000">�� </font><input type="radio" name="sex" value="a" checked> &nbsp;&nbsp;<font color="#19C108">Ů</font>
            <input type="radio" name="sex" value="b"></td>
          <td width=10%>����ͷ��</td>
		  <td width=30%>
		  <select size=1 name="img" onChange="document.images['face'].src=options[selectedIndex].value;">
		  <%
		  for(int imgi=1;imgi<=59;imgi++){
			  String s = ( new Integer(imgi)).toString();
			  s =  "Image"+s+".gif";
		  out.println("<option value=images/"+s+">"+s+"</option>");
		  }
		  %>
		  </select>&nbsp;<a href="javascript:ow('gb_img.jsp');" title="�鿴����ͷ��"><img src="images/Image1.gif" border=0 name="face" width=32 height=32></a>
		  </td>
        </tr>
        <tr> 
          <td>�������ݣ�<font color=red>*</font><br><font color=#336699>֧��JUBB(����UBB����),����֧����Щ�����Լ��԰�</font></td>
          <td colspan="3"><textarea name="newtext" cols="50" rows="8"></textarea></td>
		  </tr>
        <tr> 
          <td colspan="4"><div align="center">
              <input type="submit" name="Submit" value="�ύ">
              &nbsp; 
              <input type="reset" name="Submit2" value="����">
            </div></td>
        </tr></form>
      </table>
 </td>
 </tr>
</table>
</p><!-------------------->
<jsp:useBean id="redhat" class="com.my.www.redhat.myfile" scope="request" />
<%
//����һЩ��������

int pages ;

String spg;

if(request.getParameter("pg") != null){
spg = request.getParameter("pg");
	}
else spg = "1";
	try{
pages = new Integer(spg).intValue();
	}
	catch(Exception e){pages = 1;}

redhat.setFile(file);

String msg = new String( redhat.fileRead() );//����BEANSȡ����������

String[] retmp = msg.split(sp1);//�ָ����Դ�������tmp[]��

String[] tmp = new String[retmp.length];//��ת�������

int ic = 0;

int ii = retmp.length - 1;

//��ת����
for(;ii>=0;ii--){
	tmp[ic] = retmp[ii];
	ic++;
}

int lines = tmp.length;//�ܹ�����������

int allpage=(lines+offset-1)/offset;//�ܹ�����ҳ

int start_line = offset*pages-offset;//��ʼ������

int end_line = offset*pages;//����������

String[] tmps;

String email;

String homepage;

String remsg;

for(int i=start_line;i<end_line;i++){

   try{
	   tmps = tmp[i].split(sp);
	   if(tmps[4].equals("") == false && tmps[5].equals("") == false){
		     homepage = "<a href="+tmps[5]+" target=_blank title=����"+tmps[2]+"����ҳ��"+tmps[4]+"��>��ҳ</a>";
	   }
	   else  homepage = "<font color=gray>��ҳ</font>";

	   if(tmps[3].equals("") == false){
		     email = "<a href=\"mailto:"+tmps[3]+"\" title=\"��"+tmps[2]+"д��\">�ʼ�</a>";
	   }
	   else email = "<font color=gray>�ʼ�</font>";
       
	   //����ʱ��
	   long sl = (new Long(tmps[0])).longValue();
	   Date d = new Date();
	   d.setTime(sl);
	   /*
	   Calendar c = Calendar.getInstance();
	   c.setTime(d);
	   int month = c.get(Calendar.MONTH)+1;
	   String am_pm;
	   if(c.AM == 0) am_pm = "PM";
	   else am_pm = "AM";
	   String time = " "+ c.get(Calendar.YEAR)+"-"+month+"-"+c.get(Calendar.DATE)+" "+c.get(Calendar.HOUR)+":"+c.get(Calendar.MINUTE)+" "+am_pm+" ";
	   */
	   String time = d.toLocaleString();
	try{
	  String img = tmps[8];
	  if(img.startsWith("images/Image") == false) img = "images/Image1.gif";
	  if(img.endsWith(".gif") == false) img = "images/Image59.gif";
%>
<table cellpadding='5' cellspacing='1' border='0' width='80%' align='center' class="write" style="TABLE-LAYOUT: fixed; WORD-BREAK: break-all; WORD-WRAP: break-word">
	<tr><td colspan=4>
	<p>
      <img src="<%=img%>" border=0 align="left"><%=ubb.getAll(tmps[6])%>
	</p>
	</td></tr>
	<%
	remsg = tmps[9];
    out.println("<Tr><Td colspan=4 width=\"100%\"><table cellspacing=1 cellpadding=3 bgcolor=black width=\"98%\"><Tr bgcolor=#feffef><Td><p>�ظ���<br><font color=#9800cc>");
	out.println(remsg);
    out.println("</font></p></td></tr></table></td></tR>");
    }
	catch(Exception e){}
	%>
    <tr bgcolor="#eeefff" align="center"><td align="left" width=35%>
	�ǳƣ�<font color="<%if(tmps[7].equals("a")) out.print("#b50000"); else out.print("19C108");%>"><b><%=tmps[2]%></b></font></td>
		<Td width=25%><font color=#7489ff><%=time%></font></td>
    	<Td width=10%><%=homepage%>&nbsp;&nbsp;<%=email%></td>
		<td width=30% bgcolor="#eeeeee"><a href="view_ip.jsp?id=<%=tmps[0]%>" title="�鿴IP" target="_blank">�鿴IP</a>&nbsp;&nbsp;<a href="gb_re.jsp?id=<%=tmps[0]%>" title="�ظ�����">�ظ�</a>&nbsp;&nbsp;<a href="gb_del.jsp?id=<%=tmps[0]%>" title="ɾ������">ɾ��</a>
	</td></tr>
</table>

<table cellspacing=0 cellpadding=0 width=100% height=10><tr><td></td></tr></table>
<%
   }
   catch(Exception e){break;}

  }
%>
<table cellspacing=1 cellpadding=3 width=80% height=30 bgcolor="black"><Tr bgcolor="#eeeeff"><Td>
<%
//��ʼ��ҳ
if(allpage>1){
	out.println("��������<font color=red>"+tmp.length+"</font>��,����<font color=red>"+allpage+"</font>ҳ");
for(int pgi = 1;pgi <= allpage;pgi++){
	if(pgi == pages) out.println("<font color=gray>��"+pgi+"ҳ</font>");
	else out.println("<a href="+request.getRequestURL()+"?pg="+pgi+" title=��"+pgi+"ҳ>��"+pgi+"ҳ</a>");
}
}
else{
	out.println("��ǰֻ��<font color=red>1</font>ҳ����<font color=red>"+tmp.length+"</font>������");
}
%>
</td></tr></table>
<p><%=copyright%></p>
</center>
</body>
</html>
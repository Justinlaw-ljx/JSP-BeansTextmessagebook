<%@ page import="java.util.regex.*" %>
<%!
public class checkData{	

	/** �������Ҫƥ��Ĳ��� */
    String s = null;
	/** Pattern ���͵� p */
	Pattern p;
	/** Matcher ���͵� m */
	Matcher m;

//////////////////
   String u_s = new String("haha");
   String u_s1 = new String("haha");
   Pattern u_p;
   Matcher u_m;
   CharSequence u_s2;
   boolean result;
///////////////////
	//���캯��
	checkData(String ins){
		this.s = ins;
	}

	public void setS(String ins){
		this.s = ins;
	}

	public String getS(){
		return this.s;
	}

	/**
	---->���Email�Ƿ���ȷ
	*/
    //����ֵ:����ֵ(boolean)
	public boolean checkMail(){
		if(this.s.equals("")) return false;
		try{
        p = Pattern.compile("^[a-z_\\-0-9]+\\@[a-z_\\.\\-0-9]+$",Pattern.CASE_INSENSITIVE);
		m = p.matcher(this.s);
		return m.matches();
		}
		catch(Exception e){return false;}
	}
    
	/**
	---->��⴦���û�������û����Ƿ�Ϸ�
	*/
	//	����ֵ:����ֵ(boolean)
    public boolean checkNick(){
		if(this.s.equals("")) return false;
		try{
			p = Pattern.compile("^[^\\|\\@!|#|\\$|%|\\^|&|*|\\(|\\)|,|;|:|\"|'|\\.|\\?|<|>|\\/|\\+|=|\\]|\\[|\\{|\\}]+?$",Pattern.CASE_INSENSITIVE);
			m = p.matcher(this.s);
			return m.matches();
		}
		catch(Exception e){return false;}
	}

	/**
	---->����������ַ�Ƿ�Ϸ�
	*/
	//	����ֵ:����ֵ(boolean)
    public boolean checkUrl(){
		if(this.s.equals("")) return false;
		try{
			p = Pattern.compile("^(http:\\/\\/)|(www\\.)[{1}a-z_\\-0-9\\.\\/]+$",Pattern.CASE_INSENSITIVE);
			m = p.matcher(this.s);
			return m.matches();
		}
		catch(Exception e){return false;}
	}

   /**
   ----->����һЩ�����ַ�
   */
   //����ֵ:�ַ���(String)
    public String killHtml(boolean t){
    	if(t) s = s.trim();
    	s = s.replaceAll("<","&lt;");
    	s = s.replaceAll(">","&gt;");
    	s = s.replaceAll("  ","&nbsp;&nbsp;");
    	s = s.replaceAll("#_#","#__#");
    	s = s.replaceAll("\n","<br>");
    	s = s.replaceAll("<!--newLine-->","");
    	return s;
	}

	public String formatHtml(boolean t){
    	if(t) s = s.trim();
    	s = s.replaceAll("  ","&nbsp;&nbsp;");
    	s = s.replaceAll("#_#","#__#");
    	s = s.replaceAll("\n","<br>");
    	s = s.replaceAll("<!--newLine-->","");
    	return s;
	}
}
%>
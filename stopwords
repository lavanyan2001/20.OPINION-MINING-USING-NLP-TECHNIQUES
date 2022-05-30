<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
        </style><style>
.button {
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

.button1:hover {
  background-color: #4CAF50;
  color: white;
}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}

.button2:hover {
  background-color: #008CBA;
  color: white;
}

</style>
</head>
    <body bgcolor="#006699"><form id="form1" method="post" action="Annota">
    <%
	String ok=(String)request.getAttribute("ok");
	String un="";
	if(ok!=null){
	un=(String)request.getAttribute("un");
	}
	
	%>
      <table width="900" border="1" align="center" bgcolor="#FFFFFF" bordercolor="#0099CC">
  <tr>
                <td width="894" height="52" align="center" bgcolor="#0099FF"> <img src="image/hero-img.png" width="886" height="302"	/>			</td>
        </tr>
  <tr>
    <td height="39" align="center" bgcolor="#006699">STOPWORDS</td>
  </tr>
  <tr>
    <td height="171">
                      <%

String chk=(String)request.getAttribute("chk");
String line=(String)request.getAttribute("ok");
String line1=(String)request.getAttribute("ok2");
//Arrayli u=(String)request.getAttribute("ok1");
  
String mes="";
if(chk!=null)
{ 
    mes=(String)request.getAttribute("mes");
    
    
    
}  

%>
		    <p>
		<button class="button button1" name="button2" >Stopwords</button>
<button class="button button2" name="button3">Stemmer</button>
		   <!--   <input type="submit" name="button2" id="stop" value="Stopwords" />
		      <input type="submit" name="button3" id="stemm" value="Stemmer" /> -->
		    </p>
		    <p>
		      
	          <label>STOPWORDS<br>
	          </label>
		      
		      <label for="textfield"></label>
		      <textarea name="textarea1" id="stop" cols="45" rows="5" ><%=un%></textarea>
		      
		      <%if(request.getParameter("button2")!=null){%>
              <label for="textarea2"></label><br>   <br>   <br>
              <textarea name="textarea2" id="stop" cols="45" rows="5" ><%=line%></textarea>
		      <%}%><br>
              <label for="textarea3"></label>
		      <%
                      ArrayList al=(ArrayList)request.getAttribute("ok1");
			if(al!=null)
			{
			Iterator it;
			it=al.iterator();
			
                      %>
              <textarea name="textarea3" id="stemm" cols="45" rows="5"><%while(it.hasNext())
			{%><%=it.next()%><%}}%>
		              </textarea>
        </p>
		    <p>
		      <label for="textarea4"></label>
                       <%if(request.getParameter("button4")!=null){%>
		      <textarea name="textarea4" id="syn" cols="45" rows="5"><%=line1%></textarea>
                       <%}%>
		      <label for="textarea5"></label>
		    </p>
                    <%=mes%>
                    <%
            String lines="",lines1="";
            int pcount=0;
            int ncount=0;
            
            if(request.getParameter("pre")!=null)
            {
            lines=request.getParameter("textarea3");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/anntoating?","root","root");
            Statement st=con.createStatement();
            
                ResultSet rs1=st.executeQuery("select * from posword1");
                while(rs1.next())
                {
                   if(lines.contains(rs1.getString(1)) )
                   {
                       pcount=pcount+1;
                       out.println(rs1.getString(1));
                   }
                }
                Statement st2=con.createStatement();
                ResultSet rs2=st.executeQuery("select * from negword1");
                while(rs2.next())
                {
                   if(lines.contains(rs2.getString(1).trim()) )
                   {
                       ncount=ncount+1;
                       out.println(rs2.getString(1));
                       
                   }
                }
            
            if(pcount>ncount){
                lines1="positive";
            }else if(pcount<ncount){
                lines1="negative";
            }else if(pcount==ncount){
                lines1="Intermediate";
            }else{
                lines1="no Comments";
            }
            
            
            }
            
            %>

            <table align="center" width="500">
                <tr><td height="42"><div align="center"><input type="submit" name="pre" value="Preprocess"></div></td>
              <tr><td><div align="center">
                                        <table align="center" width="500">
                                            <tr><td height="35" bgcolor="#006699"><div align="center" class="style1">Positive</div></td><td bgcolor="#006699"><div align="center" class="style1">Negative</div></td></tr>
                                                <tr><td><div align="center"><%=pcount%></div></td><td><div align="center"><%=ncount%></div></td></tr>
                                              <tr><td height="34" bgcolor="#006699"><div align="center" class="style1">Result</div></td>
                                              <td ><div align="center" class="style1"><%=lines1%></div></td>
                                              </tr>   
                                        </table>
                        </div>
            </table>
	  </td>
  </tr>
</table>
 </form>
      
</body>
</html>

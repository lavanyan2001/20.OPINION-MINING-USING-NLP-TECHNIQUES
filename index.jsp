
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#006699">
    <%
            Connection con;
                                                Statement st;
                                                PreparedStatement ps;

            String content = "";

            
            
            if (request.getParameter("subdset") != null) {
                String dset = request.getParameter("dset");

                BufferedReader br = new BufferedReader(new FileReader(dset));
                String str1 = "", str2 = "";

                while ((str1 = br.readLine()) != null) {
                    str2 = str2 + " " + str1;
                }

                content = str2;
            }

            if (request.getParameter("suburl") != null) {
                String url1 = request.getParameter("url");
                URL url = new URL(url1);
                URLConnection conn = url.openConnection();
                BufferedReader br = new BufferedReader(
                        new InputStreamReader(conn.getInputStream()));
                String str1 = "", str2 = "";

                while ((str1 = br.readLine()) != null) {
                    str2 = str2 + " " + str1;
                }
                content = str2;
                Document doc = Jsoup.parse(content);
               content=doc.text();    
               request.setAttribute("ok", "1");
                request.setAttribute("un", content);
                RequestDispatcher rs=request.getRequestDispatcher("Stopwords.jsp");
                rs.forward(request, response);

            }

        %>

       
       
       <div class="center_content">
         <table width="900" border="1" align="center" bgcolor="#FFFFFF" bordercolor="#0099CC">
		     <tr>
                <td height="52" align="center" bgcolor="#0099FF"> <img src="image/hero-img.png" width="879" height="285"	/>			</td>
            </tr>
                 <tr>
                <td height="52" align="center" bgcolor="#006699"><p class="style1"><strong>OPINION MINING USING NLP TECHNIQUES</strong></p></td>
            </tr>
             
   <TR><TD><div align="center">
          <div align="center">

                            <p>&nbsp;</p>
                            <table width="522" border="1" align="center" bordercolor="#0066CC">
  <tr>
    <td width="516" height="46" align="center" bgcolor="#006699"><span class="style1">DATA EXTRACTION</span></td>
  </tr>
  <tr>
    <td><table align="center" width="685"  >
                                <form action="index.jsp" method="post">
                                    <tr>
                                      <td height="58" ><strong>REVIEW URL</strong> </td>
                                    <td width="495"  align="left" ><b>
                                      <input type="text" style="height: 30px" name="url" size="70" /></b></td></tr>   
                                    <tr><td width="178" height="60"></td>
                                    <td width="495" align="center"><b>
                                    <input type="submit" name="suburl" size="30" value="GetContent" /></b></td></tr> </form>
                          </table></td>
  </tr>
</table>

                  <p>&nbsp;</p>
                            <p>&nbsp;</p>
          </div>
                    </div></TD><TR>
   	     </table>
           
       	<!--end of left content--><!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
      
        
       
       </div>
    

</div>

</body>
</html>


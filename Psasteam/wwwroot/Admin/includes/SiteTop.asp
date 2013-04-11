<html>
<head>
  <title>Plasteam.co.il - Control Panel</title>
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
  <link rel="stylesheet" href="other/style.css" type="text/css">
  <script language="Javascript" src="other/Forms.js"></script>
  <script language="Javascript" src="fckeditor/fckeditor.js"></script>
</head>
<table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0" >
<tr>
  <td height="10">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/admin_04.gif">
    <tr>
	  <td width="144" align="left" valign="top"><img src="images/admin_03.gif" width="114" height="65" /></td>
 	  <td width="45%" align="left" valign="bottom">
        <br />
        <span class="text_maga_heder">Plasteam.co.il</span>
      </td>
	  <td width="46%" align="right" valign="top">
        <table width="149" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="105" height="37" class="text_normal"><div align="center">Logout</div></td>
          <td width="38" align="right"><img src="images/log_out.gif" width="17" height="17" /></td>
        </tr>
        </table>
      </td>
    </tr>
    </table>
  </td>
</tr>
<tr>
  <td valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="adminTable" dir="rtl">
    <tr>
      <td width="200" align="right" valign="top" bgcolor="#F9F7FB">
        <div align="right" style="margin-right:30px">
        <br>
<% If (IsAdmin) Then %>
      <%=AdditionLinks%><br><br>
      <a href="RASE_Options.asp?Action=List&DType=Page">עמודי תוכן</a><br>
	  <a href="RASE_Options.asp?Action=List&DType=Product">מוצרים</a><br>
	  <a href="RASE_Options.asp?Action=List&DType=New">ידיעות</a><br>
	  <br>
<!--	  <a href="RASE_Options.asp?Action=List&DType=User">משתמשים</a><br>
	  <a href="RASE_Options.asp?Action=List&DType=File">קבצים</a>-->
<% End If %>
        <br>
        </div>
     </td>
      <td style="padding:20px;" valign="top">
	  <h1><%=Title%></h1>
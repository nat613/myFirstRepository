<!--#include file="../includes/DB.asp" -->
<%
Title="מערכת הניהול"
Dim isFailed
isFailed=FALSE
Action=Request.QueryString("Action")
If (Action="LogIn") Then
  If (((Request.Form("Username")=NUsername) and (Request.Form("Password")=NPassword)) OR ((Request.Form("Username")=NUsername2) and (Request.Form("Password")=NPassword2))) Then
    Response.Cookies("Plasteam").Expires=Date()+7
    Response.Cookies("Plasteam")("Username")=Request.Form("Username")
    Response.Cookies("Plasteam")("Password")=Request.Form("Password")
    Response.Redirect("index.asp")
  Else
    isFailed=TRUE
  End If
ElseIf (Action="LogOut") Then
  Response.Cookies("Plasteam").Expires=Date()-1
    Response.Redirect("../")
End If
%>
<!--#include file="includes/SiteTop.asp" -->
<% If Not(isAdmin) Then %>
<br><br>
<form method="post" action="index.asp?Action=LogIn">
<table width="250" border="0" cellspacing="5" cellpadding="0" align="center" dir="rtl">
<tr valign="top"> 
  <td align="left"><strong><font color="#000033" size="2" face="Verdana, Arial, Helvetica, sans-serif">שם משתמש:</font></strong></td>
  <td align="left"><input name="UserName" id="UserName" type="text"></td>
</tr>
<tr valign="top"> 
  <td align="left"><strong><font color="#000033" size="2" face="Verdana, Arial, Helvetica, sans-serif">סיסמא:</font></strong></td>
  <td align="left"><input name="Password" id="Password" type="password"></td>
</tr>
<tr>
<tr valign="top"> 
  <td colspan="2" align="left"><input type="submit" value="כניסה"></td>
</tr>
</table>
</form>
<br><br>
<% End If %>
<!--#include file="includes/SiteBottom.asp" -->
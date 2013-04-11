<% Rec.Open Statement,DB %>
<form action="RASE_Options.asp?Action=Edit&DType=<%=DType%>&ItemID=<%=Request.Querystring("ItemID")%>" method="post" onsubmit="return CheckRASE(this,'<%=DType%>');" enctype="multipart/form-data">
<table border="1" cellpadding="2" cellspacing="0" align="center" dir="rtl">
<tr>
  <td width="80">כותרת</td>
  <td align="right"><input type="text" name="Title" id="Title" style="width:460px;" value="<%=Rec("Title")%>"></td>
</tr>
<% If (DType <> "New") Then %>
<tr>
  <td>תיאור</td>
  <td align="right"><textarea name="Description" id="Description" style="width:460px;height:30px;"><%=Rec("Description")%></textarea></td>
</tr>
<tr>
  <td>מילות מפתח</td>
  <td align="right"><textarea name="Keywords" id="Keywords" style="width:460px;height:30px;"><%=Rec("Keywords")%></textarea></td>
</tr>
<!--
<tr>
  <td>תמונה</td>
  <td align="right"><input type="file" name="Image" id="Image" style="width:460px;" onblur="this.form.NewImage.value=this.value;"></td>
  <input type="hidden" name="OldImage" id="OldImage" value="<%=Rec("Image")%>">
  <input type="hidden" name="NewImage" id="NewImage">
</tr>
-->
<%End If%>
<tr>
  <td align="left" valign="top">תוכן</td>
  <td align="right">
    <textarea id="Body" name="Body" style="width:600px;height:500px;"><%=Replace(Rec("Body"),VBCrLf,"")%></textarea>
<script type="text/javascript">
var oFCKeditor = new FCKeditor( 'Body' ) ;
oFCKeditor.BasePath = "fckeditor/" ;
oFCKeditor.Height	= 500;
oFCKeditor.ReplaceTextarea() ;
</script>
  </td>
</tr>
<tr height="30">
  <td colspan="2" align="left" valign="bottom"><input type="submit" value="עדכן תוכן" name="SubmitButton" id="SubmitButton"></td>
</tr>
</table>
</form>
<%
Rec.Close

If (DType="New") Then
%>
<form action="RASE_Options.asp?Action=Add&DType=<%=DType&Request.Querystring("ItemID")%>" method="post" enctype="multipart/form-data">
<table border="1" cellpadding="2" cellspacing="0" align="center" dir="rtl">
<tr>
	<td width="80">כותרת</td>
	<td align="right"><input type="text" name="Title" id="Title" style="width:460px;"></td>
</tr>
<tr>
  <td>תמונה</td>
  <td align="right"><input type="file" name="Image" id="Image" style="width:460px;" onblur="this.form.NewImage.value=this.value;"></td>
  <input type="hidden" name="NewImage" id="NewImage">
</tr>
<tr height="30">
  <td colspan="2" align="left" valign="bottom"><input type="submit" value="הוסף תמונה" name="SubmitButton" id="SubmitButton"></td>
</table>
</form>

<%
Rec.Open "SELECT * FROM RASES WHERE ([DType]='New"&Request.Querystring("ItemID")&"') ORDER BY [Place]",DB,3
If Not(Rec.EOF) Then
%>
<table width="100%" border="1" cellpadding="0" cellspacing="0"  valign="top" bordercolor="black">
<tr> 
  <th width="60" align="center"><strong>מיקום</strong></th>
  <th><strong>כותרת</strong></th>
  <th width="80" align="center"><strong>תאריך</strong></th>
  <th width="35" align="center"><strong>מחק</strong></th>
</tr>

<%Do Until (Rec.EOF)%>
<tr bgcolor="#f7f7f7">
  <td align="center"><input type="button" onClick="location.href='RASE_Options.asp?Action=PlaceUp&ItemID=<%=Rec("ID")%>&Place=<%=Rec("Place")%>&DType=<%=Rec("DType")%>';" style="font-family: Wingdings 3;" value="q" <% If (Rec("Place")=1) Then %>disabled<% End If %>> <input type="button" onClick="location.href='RASE_Options.asp?Action=PlaceDown&ItemID=<%=Rec("ID")%>&Place=<%=Rec("Place")%>&DType=<%=Rec("DType")%>';" style="font-family: Wingdings 3;" value="p" <% If (Rec("Place")=SubMaxPlace) Then %>disabled<% End If %>></td>
  <td align="right"> <%=Rec("Title")%></td>
  <td align="center"><%=Rec("ItemDate")%></td>
  <td align="center"><a href="#" onClick="if (confirm('האם אתה בטוח שברצונך למחוק פריט זה?')) window.location.href='RASE_Options.asp?Action=Del&ItemID=<%=Rec("ID")%>&DType=<%=Rec("DType")%>&Place=<%=Rec("Place")%>';">מחק</a></td>
</tr>
<%
  Rec.MoveNext
Loop
Rec.Close
%>
</table>
<% End If %>
<% End If %>
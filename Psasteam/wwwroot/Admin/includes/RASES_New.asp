<form action="RASE_Options.asp?Action=Add&DType=<%=DType%>" method="post" onsubmit="return CheckRASE(this,'<%=DType%>');" enctype="multipart/form-data">
<table border="1" cellpadding="2" cellspacing="0" align="center" dir="rtl">
<tr>
  <td width="80">כותרת</td>
  <td align="right"><input type="text" name="Title" id="Title" style="width:460px;"></td>
</tr>
<% If (DType <> "New") Then %>
<tr>
  <td>תיאור</td>
  <td align="right"><textarea name="Description" id="Description" style="width:460px;height:30px;"></textarea></td>
</tr>
<tr>
  <td>מילות מפתח</td>
  <td align="right"><textarea name="Keywords" id="Keywords" style="width:460px;height:30px;"></textarea></td>
</tr>
<!--<tr>
  <td>תמונה</td>
  <td align="right"><input type="file" name="Image" id="Image" style="width:460px;" onblur="this.form.NewImage.value=this.value;"></td>
  <input type="hidden" name="NewImage" id="NewImage">
</tr>-->
<%End If%>
<tr>
  <td align="left" valign="top">תוכן</td>
  <td align="right">
<script type="text/javascript">
var sBasePath = "fckeditor/";
var oFCKeditor = new FCKeditor( 'Body' ) ;
oFCKeditor.BasePath	= sBasePath ;
oFCKeditor.Value	= '' ;
oFCKeditor.Width	= 460;
oFCKeditor.Height	= 500;
oFCKeditor.Create() ;
</script>
  </td>
</tr>
<tr height="30">
  <td colspan="2" align="left" valign="bottom"><input type="submit" value="הוסף תוכן" name="SubmitButton" id="SubmitButton"></td>
</table>
</form>
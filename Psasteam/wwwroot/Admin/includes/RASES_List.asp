<%
Rec.Open Statement,DB,3
LastCat=0
If Not(Rec.EOF) Then
%>
<table width="100%" border="1" cellpadding="0" cellspacing="0"  valign="top" bordercolor="black">
<tr> 
  <th width="60" align="center"><strong>�����</strong></th>
  <th><strong>�����</strong></th>
  <th width="80" align="center"><strong>�����</strong></th>
  <%If (False) Then%><th width="35" align="center"><strong>��"�</strong></th><%End If%>
  <th width="45" align="center"><strong>����?</strong></th>
  <th width="40" align="center"><strong>����</strong></th>
  <th width="35" align="center"><strong>���</strong></th>
</tr>

<%Do Until (Rec.EOF)%>
<tr bgcolor="#f7f7f7">
  <td align="center"><input type="button" onClick="location.href='RASE_Options.asp?Action=PlaceUp&ItemID=<%=Rec("ID")%>&Place=<%=Rec("Place")%>&DType=<%=DType%>';" value="&darr;" <% If (Rec("Place")=Rec.RecordCount) Then %>disabled<% End If %>> <input type="button" onClick="location.href='RASE_Options.asp?Action=PlaceDown&ItemID=<%=Rec("ID")%>&Place=<%=Rec("Place")%>&DType=<%=DType%>';" value="&uarr;" <% If (Rec("Place")=1) Then %>disabled<% End If %>></td>
  <td align="right"> <%=Rec("Title")%></td>
  <td align="center"><%=Rec("ItemDate")%></td>
  <%If (False) Then%><td align="center"><input type="radio" onClick="location.href='RASE_Options.asp?Action=isHomePage&DType=<%=DType%>&ItemID=<%=Rec("ID")%>';" <% If (Rec("isHomePage")="True") Then %>checked<% End If %>></td><%End If%>
  <td align="center"><input type="checkbox" onClick="location.href='RASE_Options.asp?Action=Visibility&DType=<%=DType%>&ItemID=<%=Rec("ID")%>';" <% If (Rec("isVisible")="True") Then %>checked<% End If %>></td>
  <td align="center"><a href="RASE_Options.asp?Action=Edit_Form&ItemID=<%=Rec("ID")%>&DType=<%=DType%>">����</a></td>
  <td align="center"><a href="#" onClick="if (confirm('��� ��� ���� ������� ����� ���� ��?')) window.location.href='RASE_Options.asp?Action=Del&ItemID=<%=Rec("ID")%>&DType=<%=DType%>&Place=<%=Rec("Place")%>';">���</a></td>
</tr>
<%
  Rec.MoveNext
Loop
Rec.Close
%>
</table>
<%
Else
  Response.Write("<font class='normal_text'><center><b>��� ������ �����</b></center></font>")
End If
%>
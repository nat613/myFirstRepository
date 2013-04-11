<%@ LANGUAGE = "VBScript" codepage="65001"%>
<!--#include file="Includes/db.asp" -->
<%
Part = Request.QueryString("Part")
ItemID = Request.QueryString("ItemID")
If (Part="News") Then
	Response.Write GetNews()
Else
	Response.Write GetPart(Part,ItemID)
End If
DisposeConn()

Function GetPart(Part,ID)
	Rec.Open "SELECT Title,Body FROM RASES WHERE ([ID]="&ID&")",DB
		Content = "<h1>"&Rec("Title")&"</h1>"&Rec("Body")
	Rec.Close
	GetPart = Content
End Function

Function GetNews()
	News=""
	Rec.Open "SELECT * FROM RASES WHERE ([DType]='New') ORDER BY Place DESC",DB
	Do Until (Rec.EOF)
		News=News&"<div><h2>"&Rec("Title")&"</h2>"&Rec("Body")&"<br><br><br></div>"
		Rec.MoveNext
	Loop
	Rec.Close
	GetNews = News
End Function
%>
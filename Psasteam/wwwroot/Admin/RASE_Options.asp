<%@ LANGUAGE = "VBScript" codepage="1255"%>
<!--#include file="../Includes/db.asp" -->
<%
If Not(isAdmin) Then Response.Redirect("index.asp")

DType=Request.QueryString("DType")
Select Case DType
  Case "Page"
    Title="עמודי תוכן"
    AdditionLinks="<a href=""RASE_Options.asp?Action=New_Form&DType=Page"">צור עמוד חדש</a>"
  Case "Product"
    Title="מוצרים"
    AdditionLinks="<a href=""RASE_Options.asp?Action=New_Form&DType=Product"">צור מוצר חדש</a>"
  Case "New"
    Title="ידיעות"
    AdditionLinks="<a href=""RASE_Options.asp?Action=New_Form&DType=New"">צור ידיעה חדשה</a>"

  Case "User"
    Title="משתמשים"
    'AdditionLinks="<a href=""RASE_Options.asp?Action=New_Form&DType=User"">צור משתמש חדש</a>"
  Case "File"
    Title="קבצים"
    'AdditionLinks="<a href=""RASE_Options.asp?Action=New_Form&DType=File"">העלה קובץ חדש</a>"
End Select

UploadDir="D:\hshome\allnet4u-tele\plasteam.co.il\images\uploaded\"
Action=Request.QueryString("Action")
If (Action="New_Form") Then
  Page()
ElseIf (Action="Add") Then
  Set Upload = Server.CreateObject("Persits.Upload")
  Upload.IgnoreNoPost = True
  Upload.OverwriteFiles = False
  Upload.CodePage = 1255
  Image=""
  Visible = TRUE
  Upload.Save(UploadDir)

  Body = ReplaceSTR(Upload.Form("Body"))
  Press = ReplaceSTR(Upload.Form("Press"))
  Videos = ReplaceSTR(Upload.Form("Videos"))

  If (Upload.Form("NewImage")<>"") Then
    Image=Upload.Files("Image").FileName
  Else
    Image="NoPic.jpg"
  End If
  Visible = TRUE
  If (Upload.Form("Preview")="on") Then Visible = FALSE

  DB.Execute "INSERT INTO RASES([Title],[ShortBody],[Body],[Videos],[Press],[Image],[Place],[DType],[isVisible],[Keywords],[Description]) VALUES('"&ReplaceSTRwQ(Upload.Form("Title"))&"','"&ReplaceSTR(Upload.Form("ShortBody"))&"','"&Body&"','"&Videos&"','"&Press&"','"&Image&"',"&GetMaxPlace(DType)+1&",'"&DType&"',"&Visible&",'"&ReplaceSTR(Upload.Form("Keywords"))&"','"&ReplaceSTR(Upload.Form("Description"))&"')"
  Set Upload = Nothing
  DisposeConn()
  Response.Redirect ("RASE_Options.asp?Action=List&Preview="&Visible&"&DType="&DType)
ElseIf (Action="Edit_Form") Then
  Statement="SELECT [Title],[ShortBody],[Body],[Videos],[Press],[Image],[Keywords],[Description] FROM RASES WHERE ([ID]="&Request.QueryString("ItemID")&")"
  Page()
  DisposeConn()
ElseIf (Action="Edit") Then
  Set Upload = Server.CreateObject("Persits.Upload")
  Upload.IgnoreNoPost = True
  Upload.OverwriteFiles = False
  Upload.CodePage = 1255
  Upload.Save(UploadDir)
  If (Upload.Form("NewImage")<>"") Then
    Image="[Image]='"&Upload.Files("Image").FileName&"',"
    If (Upload.Form("OldImage")<>"" AND InSTR(Upload.Form("OldImage"),"NoPic.jpg")=0) Then
      Set FSO = CreateObject("Scripting.FileSystemObject")
      Set File = FSO.GetFile(UploadDir&Upload.Form("OldImage")) : File.Delete
      Set File=Nothing : Set FSO=Nothing
    End If
  End If

  Body = ReplaceSTR(Upload.Form("Body"))
  Press = ReplaceSTR(Upload.Form("Press"))
  Videos = ReplaceSTR(Upload.Form("Videos"))
  
  DB.Execute "UPDATE RASES SET [Title]='"&ReplaceSTRwQ(Upload.Form("Title"))&"',[Body]='"&Body&"',[Press]='"&Press&"',[Videos]='"&Videos&"',[ShortBody]='"&ReplaceSTR(Upload.Form("ShortBody"))&"',"&Image&"[Keywords]='"&ReplaceSTRwQ(Upload.Form("Keywords"))&"',[Description]='"&ReplaceSTRwQ(Upload.Form("Description"))&"' WHERE ([ID]="&Request.QueryString("ItemID")&")"
  Set Upload = Nothing
  DisposeConn()
  Response.Redirect ("RASE_Options.asp?Action=List&DType="&DType)
ElseIf (Action="Del") Then
  If (DType<>"Page") Then
    Rec.Open "SELECT [Image] FROM RASES WHERE ([ID]="&Request.QueryString("ItemID")&")",DB
    If (Rec("Image")<>"" AND InSTR(Rec("Image"),"NoPic.jpg")=0) Then
      Set FSO = CreateObject("Scripting.FileSystemObject")
      Set File = FSO.GetFile(UploadDir&Rec("Image")) : File.Delete
      Set File=Nothing : Set FSO=Nothing
    End If
    Rec.Close
  End If
  DB.Execute "UPDATE RASES SET [Place]=[Place]-1 WHERE ([Place]>"&Request.QueryString("Place")&" and [DType]='"&DType&"')"
  DB.Execute "DELETE FROM RASES WHERE ([ID]="&Request.QueryString("ItemID")&")"
  DisposeConn()
  Response.Redirect ("RASE_Options.asp?Action=List&DType="&DType)
ElseIf (Action="Visibility") Then
  DB.Execute "UPDATE RASES SET [isVisible]=Not([isVisible]) WHERE ([ID]="&Request.QueryString("ItemID")&")"
  DisposeConn()
  Response.Redirect ("RASE_Options.asp?Action=List&DType="&DType)
ElseIf (Action="isHomePage") Then
  If (DType<>"New") Then DB.Execute "UPDATE RASES SET [isHomePage]=0 WHERE ([DType]='"&DType&"')"
  DB.Execute "UPDATE RASES SET [isHomePage]=Not([isHomePage]) WHERE ([ID]="&Request.QueryString("ItemID")&")"
  DisposeConn()
  Response.Redirect ("RASE_Options.asp?Action=List&DType="&DType)
ElseIf (Action="PlaceUp") Then
  DB.Execute "UPDATE RASES SET [Place]=[Place]-1 WHERE ([ID]="&Request.QueryString("ItemID")&" and [DType]='"&DType&"')"
  DB.Execute "UPDATE RASES SET [Place]=[Place]+1 WHERE ([Place]="&Int(Request.QueryString("Place"))-1&" and [ID]<>"&Request.QueryString("ItemID")&" and [DType]='"&DType&"')"
  DisposeConn()
  Response.Redirect ("RASE_Options.asp?Action=List&DType="&DType)
ElseIf (Action="PlaceDown") Then
  DB.Execute "UPDATE RASES SET [Place]=[Place]+1 WHERE ([ID]="&Request.QueryString("ItemID")&" and [DType]='"&DType&"')"
  DB.Execute "UPDATE RASES SET [Place]=[Place]-1 WHERE ([Place]="&Int(Request.QueryString("Place"))+1&" and [ID]<>"&Request.QueryString("ItemID")&" and [DType]='"&DType&"')"
  DisposeConn()
  Response.Redirect ("RASE_Options.asp?Action=List&DType="&DType)
ElseIf (Action="Init") Then
  DB.Execute "DELETE FROM RASES WHERE ([DType]='Page')"
  DisposeConn()
  Response.Redirect ("RASE_Options.asp?Action=List&DType="&DType)
Else
  Action="List"
  MaxPlace=GetMaxPlace(DType)
  Statement="SELECT [ID],[ItemDate],[Title],[ShortBody],[Body],[Image],[isVisible],[isHomePage],[Place] FROM RASES WHERE ([DType]='"&DType&"') ORDER BY [Place] Desc"
  Page()
  DisposeConn()
End If

Function GetMaxPlace(DType)
  Rec2.Open "SELECT [Place] FROM RASES WHERE ([DType]='"&DType&"') ORDER BY [Place] DESC",DB
    MaxPlace=0 : If Not(Rec2.EOF) Then MaxPlace=Rec2("Place")
  Rec2.Close
  GetMaxPlace = MaxPlace
End Function

Function ResizeImage(ImgName,Width,Height,Ext)
  Set jpeg = Server.CreateObject("Persits.Jpeg")
  jpeg.Open UploadDir&ImgName
  jpeg.Canvas.Brush.Color=&HFFFFFF

  If (jpeg.Width>jpeg.Height) Then
    jpeg.Height = Height
    jpeg.Width = jpeg.OriginalWidth * Height/jpeg.OriginalHeight
    If (jpeg.Width>Width) Then jpeg.Crop ((jpeg.Width-Width)/2), 0, jpeg.Width-((jpeg.Width-Width)/2), jpeg.Height
    jpeg.Save UploadDir&Ext&ImgName
  Else
    jpeg.Width = Width
    jpeg.Height = jpeg.OriginalHeight * Width/jpeg.OriginalWidth
    If (jpeg.Height>Height) Then jpeg.Crop 0, ((jpeg.Height-Height)/2), jpeg.Width, jpeg.Height-((jpeg.Height-Height)/2)
    jpeg.Save UploadDir&Ext&ImgName
  End If
  Set jpeg = Nothing
  Set tempFile = Nothing
  ResizeImage = ""
End Function

Sub Page %>
<!--#include file="Includes/SiteTop.asp" -->
<% If (Action="List") Then %>
  <!--#include file="Includes/RASES_List.asp" -->
<% ElseIf (Action="New_Form") Then %>
  <!--#include file="Includes/RASES_New.asp" -->
<% ElseIf (Action="Edit_Form") Then %>
  <!--#include file="Includes/RASES_Edit.asp" -->
<% End If %>
<!--#include file="Includes/SiteBottom.asp" -->
<% End Sub %>
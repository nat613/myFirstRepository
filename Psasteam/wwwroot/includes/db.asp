<%
'codepage="1255"
DSN="DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=C:\HostingSpaces\ashtrom\plasteam.co.il\data\Plasteam2012.mdb"
Set DB=Server.CreateObject("AdoDB.Connection")
DB.Open DSN

Set Rec=Server.CreateObject("AdoDB.Recordset")
Set Rec2=Server.CreateObject("AdoDB.Recordset")


Function ReplaceSTR(STR)
  STR=Trim(""& STR &"")
'  STR=Replace(STR,"""","''")
  STR=Replace(STR,"'","&#039;")
'  STR=Replace(STR, "", "NoContent")
  STR=Replace(STR, "<", "<")
  STR=Replace(STR, ">", ">")
  STR=Replace(STR, "(", "(")
  STR=Replace(STR, ")", ")")
  STR=Replace(STR, "=", "=")
  STR=Replace(STR, "select ", "selec_t")
  STR=Replace(STR, "insert ", "inser_t")
  STR=Replace(STR, "fields ", "field_s")
  STR=Replace(STR, "request ", "reques_t")
  STR=Replace(STR, "redirect ", "redirec_t")
  STR=Replace(STR, "response ", "respons_e")
  STR=Trim(""& STR &"")
  ReplaceSTR=STR
End Function

Function ReplaceSTRwQ(STR)
  STR=Trim(""& STR &"")
  STR=Replace(STR,"""","&quot;")
  STR=Replace(STR,"'","&#039;")
'  STR=Replace(STR, "", "NoContent")
  STR=Replace(STR, "<", "<")
  STR=Replace(STR, ">", ">")
  STR=Replace(STR, "(", "(")
  STR=Replace(STR, ")", ")")
  STR=Replace(STR, "=", "=")
  STR=Replace(STR, "select ", "selec_t")
  STR=Replace(STR, "insert ", "inser_t")
  STR=Replace(STR, "fields ", "field_s")
  STR=Replace(STR, "request ", "reques_t")
  STR=Replace(STR, "redirect ", "redirec_t")
  STR=Replace(STR, "response ", "respons_e")
  STR=Trim(""& STR &"")
  ReplaceSTRwQ=STR
End Function

Sub DisposeConn
  Set Rec=Nothing
  DB.Close : Set DB=Nothing
End Sub

Dim NUsername,NPassword,isAdmin,AdditionLinks
NUsername="idan" : NPassword="richard2"
NUsername2="nati" : NPassword2="nati"
AdditionLinks=""

isAdmin=FALSE
If (((Request.Cookies("Plasteam")("Username")=NUsername) and (Request.Cookies("Plasteam")("Password")=NPassword)) OR ((Request.Cookies("Plasteam")("Username")=NUsername2) and (Request.Cookies("Plasteam")("Password")=NPassword2))) Then isAdmin=TRUE
%>
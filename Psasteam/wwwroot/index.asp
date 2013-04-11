<!--#include file="Includes/db.asp" -->
<%
Rec.Open "SELECT * FROM RASES WHERE ([ID]=1)",DB
Title = Rec("Title")
Keywords = Rec("Keywords")
Description=Rec("Description")
Rec.Close
DisposeConn()
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
<html dir="rtl">
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255" />
		<title><%=Title%></title> 
		<meta name="keywords" content="<%=Keywords%>" /> 
		<meta name="description" content="<%=Description%>" /> 
		<script language="Javascript" src="other/jquery-1.7.1.min.js"></script>
		<script language="Javascript" src="other/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
		<script language="Javascript" src="other/scripts.js"></script>
		<script language="javascript" src="other/jquery.swfobject.1-1-1.min.js"></script>
		<script language="javascript" src="other/jquery.jscrollpane.min.js"></script>
		<script language="javascript" src="other/jquery.mousewheel.js"></script>
		<link rel="stylesheet" href="other/style.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="other/fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="other/jquery.jscrollpane.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="other/lozenge/style/jquery.jscrollpane.lozenge.css" type="text/css" media="screen" />
	</head> 
	<body>
		<object
   codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"
   width="0" height="0">
    <param name="movie" value="http://www.macromedia.com/shockwave/download/triggerpages_mmcom/flash.swf">
</object>
		<div id="Wrapper">
			<div id="Content"></div>
			<div id="NewsContainer"><div id="News"><div class="Scroller"></div></div></div>
			<div id="Flash">הדפדפן שלך אינו תומך ב Flash 10.<br><a href="http://get.adobe.com/flashplayer/" target="_blank">לחץ כאן על מנת להוריד נגן Flash</a>.</div>
		</div>
		<script type="text/javascript">
		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-17172405-1']);
		  _gaq.push(['_trackPageview']);

		  (function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();
		</script>
	</body>
</html>
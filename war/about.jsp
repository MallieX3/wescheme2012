<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="org.wescheme.user.SessionManager" %>
<%@ page import="org.wescheme.user.Session" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head><title>WeScheme :: About</title>

<script src="/editor/jquery.js"></script>
<script src="/heartbeat.js"></script>
<link rel="stylesheet" type="text/css" href="css/splash.css" id="style" />

</head>
<body onload='setInterval("beat()",1800000);'>
<h1>WeScheme</h1><img src="css/images/BigLogo.png" width="20%">
<h2>makes use of...</h2>
<div id="text">
<ul>
	<li><a href="http://github.com/dyoo/moby-scheme">moby</a> : a Scheme compiler which allows Scheme programs to be run as "native" Android apps, or as javascript programs which run in a web browser.</li>
	<li><a href="http://appspot.com">AppEngine</a> : Google's "cloud" of computing infrastructure. WeScheme uses AppEngine to handle user accounts, serverside compilation, and file management </li>
	<li><a href="http://code.google.com/p/ie7-js/">ie7-js</a> : Dean Edwards' excellent javascript library, which allows us to ignore many of the cross-browser issues associated with supporting IE6 and 7. </li>
	<li><a href="http://excanvas.sourceforge.net/">ExCanvas</a> : Google's javascript library that provides a Canvas implementation on browsers which do not support it (IE). </li>
	<li><a href="http://code.google.com/closure/">Closure</a> : Google's javascript compiler, library and template system.</li>
</ul>
</div>

<div id="footer">
<a href="/about.jsp">About</a>
<a href="/contact.jsp">Contact</a>
<a href="/copyright.jsp">Copyright</a>
</div>

</body></html>
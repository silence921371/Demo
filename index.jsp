<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>spring mvc test</title>
</head>
<body>
	<a href="helloworld">hello world</a><br>
	
	<a href="testMethod">Test Method</a><br><br>
	
	<form action="testMethod" method="post">
		<input type="submit" value="submit">
	</form><br>
	
	<a href="testParamAndHeader?username=liyinhui&age=11">Test ParamsAndHeader</a><br>
	
	<a "WebContent/WEB-INF"href="testPathVariable/123">Test PathVariable</a><br><br>
	
	
	<!-- rest -->
	
	<a href="testRest/111">Test Rest GET</a><br><br>
	
	<form action="testRest" method="post">
		<input type="submit" value="TestRest POST">
	</form><br><br>
	
	<form action="testRest/222" method="post">
		<input type="hidden" name="_method" value="DELETE">
		<input type="submit" value="TestRest DELETE">
	</form><br><br>
	
	<form action="testRest/333" method="post">
		<input type="hidden" name="_method" value="PUT">
		<input type="submit" value="TestRest PUT">
	</form><br><br>
	
	<a href="testRequestParam?name=liyinhui&age=18">Test RequestParam</a><br><br>
	
	<a href="testRequestHeader">Test testRequestHeader</a><br><br>
	
	<a href="testCookieValue">Test testCookieValue</a><br><br>
	
	<a href="testMothodModelAndView">testMothodModelAndView</a><br><br>
	
</body>
</html>
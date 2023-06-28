<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	파라미터 받음 : <c:out value="${param.name }" />
	<hr>
	
	<c:set var="mName" value="임떠영" />
	이름 : <c:out value="임떠영" /> <br>
	이름 : <c:out value="${mName }" /> <br>
	
	<c:remove var="mName" />
	이름 : <c:out value="${mName }" /> <br>
	<hr>

</body>
</html>
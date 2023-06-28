<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <a href="insert.do">insert</a>
    <hr/>
    <a href="http://localhost:8080<%=request.getContextPath()%>/jstl/update.do">update</a>
    <hr/>
    <a href="http://localhost:8080/Web/jstl/select.do">select</a>
    <hr/>
    <a href="<%=request.getContextPath()%>/jstl/delete.do">delete</a>

	
</body>
</html>
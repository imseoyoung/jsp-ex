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
	<c:set var="varName" value="임떠영" />
	varName= : <c:out value="${varName}" />
	
	<c:remove var="varName" />
	varName 제거 : <c:out value="${varName}" />
	<hr>

	<c:catch var="error">
		<%= 2/0 %>
	</c:catch>
	<c:out value="${error}" />
	<hr>
	
	<c:if test="${1 + 2 == 3}">
		1 + 2 = 3 결과입니다.
	</c:if>
	<hr>
	
	<c:set var="varName" value="임서영" />
	<c:choose>
		<c:when test="${varName == '임떠영'}">when: 임서영</c:when>
		<c:otherwise>when: 다른 사람</c:otherwise>
	</c:choose>
	<hr>
	
	<c:forEach var="fEach" begin="0" end="30" step="5">
		${fEach}
	</c:forEach><p>
	<%
		List<String> fruits = new ArrayList<String>();
	
		fruits.add("🍉");
		fruits.add("🍑");
		fruits.add("🍒");
		fruits.add("🍎");
		fruits.add("🍅");
		
		pageContext.setAttribute("aFruits", fruits);
	%>
	<ul>
	<c:forEach var="result" items="${aFruits}">
		<li>${result}</li>
	</c:forEach><p>
	</ul>
	
	<%
		pageContext.setAttribute("aEach", "임떠영, 심민정, 최민영");
	%>
	<ul>
	<c:forEach var="result" items="${aEach}">
		<li>${result}</li>
	</c:forEach><p>
	</ul>
	<hr>
	
	<c:redirect url="redirecttest.jsp">
		<c:param name="name" value="임떠영" />
	</c:redirect>
	<hr>
</body>
</html>
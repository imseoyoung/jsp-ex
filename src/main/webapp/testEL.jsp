<%@ page import="sylim.elex.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="member" class="sylim.elex.MemberInfo" scope="page"></jsp:useBean>
    <jsp:setProperty name="member" property="name" value="임떠영" />
    <jsp:setProperty name="member" property="id" value="ddeo" />
    <jsp:setProperty name="member" property="password" value="123456" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	이름 : <jsp:getProperty name="member" property="name" />
	아이디 : <jsp:getProperty name="member" property="id" />
	비밀번호 : <jsp:getProperty name="member" property="password" />
	
	    <hr/>

   	이름 : ${ pageScope.member.name } <br>
	아이디 : ${ pageScope.member.id } <br>
	비밀번호 : ${ member.password }
	
</body>
</html>
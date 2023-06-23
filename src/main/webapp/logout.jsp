<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
</head>
<body>
    <h1>로그아웃</h1>
    <%
        // 세션 무효화
        session.invalidate();
    %>
    <p>로그아웃되었습니다.</p>
</body>
</html>
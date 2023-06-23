<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:dink15";
    String user = "C##scott";
    String password = "tiger";
    String query = "SELECT * FROM member";

    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();

        rs = stmt.executeQuery(query);

        out.println("가입된 회원 정보 조회");
        out.println("<br>");

        while (rs.next()) {
            String id = rs.getString("id");
            String pw = rs.getString("pw");
            String name = rs.getString("name");
            String phone = rs.getString("phone");

            out.println("아이디: " + id + ", 비밀번호: " + pw + ", 이름: " + name + ", 전화번호: " + phone + "<br>");
        }
    } catch (ClassNotFoundException e) {
        out.println("jdbc driver 로딩 실패");
        e.printStackTrace();
    } catch (SQLException e) {
        out.println("오라클 연결 실패");
        e.printStackTrace();
    }
%>
<a href ="login.html">로그인</a>
</body>
</html>
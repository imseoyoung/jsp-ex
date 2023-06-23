<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
    <h1>회원 정보 수정</h1>

    <%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");  // 수정된 부분
    String phone = request.getParameter("phone");  // 수정된 부분
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:dink15";
        String user = "C##scott";
        String dbPassword = "tiger";

        Class.forName(driver);
        conn = DriverManager.getConnection(url, user, dbPassword);
        String query = "SELECT * FROM member WHERE id = ? AND pw = ?";

        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            phone = rs.getString("phone");
        } else {
            // 쿼리 결과가 없을 경우 초기 값을 유지하기 위해 값을 할당합니다.
            name = "";
            phone = "";
        }
    } catch (ClassNotFoundException e) {
        out.println("jdbc 드라이버 로딩 실패");
        e.printStackTrace();
    } catch (SQLException e) {
        out.println("오라클 연결 실패");
        e.printStackTrace();
    } finally {
        // 리소스 정리
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>

    <%-- 사용자 정보 수정을 위한 폼 표시 --%>
    <form action="ModifyOk" method="post">
        <table>
            <tr>
                <td>아이디:</td>
                <td><input type="text" name="id" value="<%=id%>"></td>
            </tr>
            <tr>
                <td>비밀번호:</td>
                <td><input type="password" name="pw" value="<%=pw%>"></td>
            </tr>
            <tr>
                <td>이름:</td>
                <td><input type="text" name="name" value="<%=name%>"></td>
            </tr>
            <tr>
                <td>전화번호:</td>
                <td><input type="text" name="phone" value="<%=phone%>"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="수정"></td>
            </tr>
        </table>
    </form>
</body>
</html>

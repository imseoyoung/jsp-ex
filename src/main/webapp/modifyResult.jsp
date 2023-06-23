<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정 결과</title>
</head>
<body>
    <h1>회원 정보 수정 결과</h1>
    <%
        String id = request.getParameter("id");
        String name = "";
        String phone = "";

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

            String query = "SELECT name, phone FROM member WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                phone = rs.getString("phone");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
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
    <p>회원 정보가 성공적으로 수정되었습니다.</p>
    <p>아이디: <%= id %></p>
    <p>이름: <%= name %></p>
    <p>전화번호: <%= phone %></p>
    <a href="modify.jsp">다시 수정하기</a>
    <a href="logout.jsp">로그아웃</a>
</body>
</html>
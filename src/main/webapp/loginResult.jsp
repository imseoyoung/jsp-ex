<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Result</title>
</head>
<body>
    <h1>Login Result</h1>
    <% 
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
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
                String name = rs.getString("name");
                String phone = rs.getString("phone");

                // 회원 정보 수정 페이지로 데이터를 전달하기 위해 쿼리 문자열에 파라미터를 추가합니다.
                String modifyPageURL = "modify.jsp?id=" + id + "&pw=" + pw + "&name=" + name + "&phone=" + phone;
                %>
                <p>로그인에 성공했습니다!</p>
                <p>아이디: <%= id %></p>
                <p>이름: <%= name %></p>
                <p>전화번호: <%= phone %></p>
                <a href="<%= modifyPageURL %>">회원 정보 수정</a>
                <%
            } else {
                response.sendRedirect("login.html");
            }
        } catch (ClassNotFoundException e) {
            out.println("jdbc driver 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("오라클 연결 실패");
            e.printStackTrace();
        } finally {
            // Close resources
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
</body>
</html>
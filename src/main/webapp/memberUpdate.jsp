<%@ page import="sylim.daotoex.MemberDTO"%>
<%@ page import="sylim.daotoex.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Update</title>
</head>
<body>

<%
    // POST 요청으로 전달된 수정할 회원 정보 받기
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");

    // 받아온 회원 정보로 MemberDTO 객체 생성
    MemberDTO member = new MemberDTO(name, id, pw, phone);

    // MemberDAO 객체 생성
    MemberDAO memberDAO = new MemberDAO();

    // 회원 정보 수정 실행
    int result = memberDAO.memberUpdate(member);

    // 수정 결과에 따라 메시지 출력
    if (result > 0) {
        out.println("회원 정보가 성공적으로 수정되었습니다.");
    } else {
        out.println("회원 정보 수정에 실패했습니다.");
    }
%>

    <p>아이디: <%= id %></p>
    <p>이름: <%= name %></p>
    <p>전화번호: <%= phone %></p>

</body>
</html>
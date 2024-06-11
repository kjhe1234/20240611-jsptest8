<%@page import="com.kjhe1234.dto.MemberDto"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 확인</title>
</head>
<body>
		<%
		request.setCharacterEncoding("utf-8");
		String mnumber = request.getParameter("memberNum");
		
		
		String sql = "DELETE FROM member_tbl WHERE member_num = '"+mnumber+"'";

		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/member_db";
		String username = "root";
		String password = "12345";
	
		Connection conn = null;
		Statement stmt = null;


	
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			
			stmt = conn.createStatement();
						

			int success = stmt.executeUpdate(sql);
			
			if(success == 1) { //참이면 sql문 성공적으로 실행
				out.println(mnumber + "님 회원 탈퇴 되었습니다.");
			} else {
				out.println("회원 탈퇴 실패! 회원 번호를 다시 확인해주세요");
			}
			
		} catch(Exception e) {
			out.println("DB연동 에러 발생!!");
			e.printStackTrace();
			
		} finally {
			try{
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	
	
	%>


	<hr>
	<a href="list.jsp">회원리스트 보기</a>



</body>
</html>
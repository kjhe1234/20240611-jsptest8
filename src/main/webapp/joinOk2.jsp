<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 확인</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String mname = request.getParameter("memberName");
	String memail = request.getParameter("memberEmail");
	
	String sql = "INSERT INTO member_tbl(member_name, member_email) VALUES (?,?) ";
	
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/member_db";
	String username = "root";
	String password = "12345";
	
	Connection conn = null;
	//Statement stmt = null;
	PreparedStatement pstmt = null;
	
	try {
		Class.forName(driverName);
		conn = DriverManager.getConnection(url, username, password);
		
		//stmt = conn.createStatement();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mname); // sql내의 첫번째 ?에 mname을 셋팅
		pstmt.setString(2, memail); // sql내의 두번째 ?에 memail을 셋팅
		
		int success = pstmt.executeUpdate();
		
		if(success == 1) { //참이면 sql문 성공적으로 실행
			out.println(mname + "님 회원 가입을 축하드립니다!");
		} else {
			out.println("회원 가입 실패! 다시 확인해주세요");
		}
		
	} catch(Exception e) {
		out.println("DB연동 에러 발생!!");
		e.printStackTrace();
		
	} finally {
		try{
			if(pstmt != null) {
				pstmt.close();
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
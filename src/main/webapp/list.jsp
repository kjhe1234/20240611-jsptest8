<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.kjhe1234.dto.MemberDto"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 회원 조회</title>
</head>
<body>
	<h2>전체 회원 명단 보기</h2>
	<hr>
	<%
		request.setCharacterEncoding("utf-8");
		String sql = "SELECT * FROM member_tbl";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/member_db";
		String username = "root";
		String password = "12345";
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
	try {
		Class.forName(driverName);
		conn = DriverManager.getConnection(url, username, password);
		
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery(sql);
		
		List<MemberDto> members = new ArrayList<MemberDto>();
		
		while(rs.next()) {
			int mnum = rs.getInt("member_num");
			String mname = rs.getString("member_name");
			String memail = rs.getString("member_email");
			String mdate = rs.getString("member_signuptime");
			
			MemberDto memberDto = new MemberDto();
			memberDto.setMember_num(mnum);
			memberDto.setMember_name(mname);
			memberDto.setMember_email(memail);
			memberDto.setMember_signuptime(mdate);
			
			members.add(memberDto);
			
		}
		
		for(int i=0;i<members.size();i++) {
			out.println(members.get(i).getMember_num() + " / "); // 회원의 번호
			out.println(members.get(i).getMember_name() + " / "); //회원의 이름
			out.println(members.get(i).getMember_email() + " / "); // 회원의 이메일
			out.println(members.get(i).getMember_signuptime() + "<br>"); // 회원의 가입일
			
			
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




</body>
</html>
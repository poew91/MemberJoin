<%@ page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.JdbcUtil, java.sql.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from member_tbl_02 order by custno";

	con = JdbcUtil.getConnection();
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
</head>
<body>
<table border=0>
<tr><td class="header" align="center"><h3>쇼핑몰 회원관리 ver 1.0</h3></td></tr>
<tr><td class="menu">
<a href="memberJoin.jsp">회원등록</a>
<a href="memberList.jsp">회원목록조회/수정</a>
<a href="money.jsp">회원매출조회</a>
<a href="index.jsp">홈으로</a>
</td></tr>
<tr><td align="center">
<section>
<b>회원목록조회/수정</b>
<table border=1>
	<tr>
	<td>회원번호</td>
	<td>회원성명</td>
	<td>전화번호</td>
	<td>주소</td>
	<td>가입일자</td>
	<td>고객등급</td>
	<td>거주지역</td>
	</tr>
<%
	while(rs.next()) {
		String grade = "직원";
		if(rs.getString(6).equals("A")) {
			grade = "VIP";
		} else if(rs.getString(6).equals("B")) {
			grade = "일반";
		}
%>
	<tr>
	<td><a href="memberMod.jsp?custno=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(5).substring(0, 10) %></td>
	<td><%=grade %></td>
	<td><%=rs.getString(7) %></td>
	</tr>
<%
	}
%>
</table>
</section>
</td></tr>
<tr><td class="footer" align="center">저작권 관련 정보</td></tr>
</table>
</body>
</html>
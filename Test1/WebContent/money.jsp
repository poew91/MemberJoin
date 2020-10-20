<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.JdbcUtil, java.sql.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
</head>
<body>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select m1.custno, custname, grade, sum(price) from " +
				" member_tbl_02 m1 right join money_tbl_02 m2 " +
				" on m1.custno=m2.custno " +
				" group by m1.custno, custname, grade" +
				" order by sum(price) desc";

	con = JdbcUtil.getConnection();
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
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
<b>회원매출조회</b>
<table border=1>
	<tr>
	<td>회원번호</td>
	<td>회원성명</td>
	<td>고객등급</td>
	<td>매출</td>
	</tr>
<%
	while(rs.next()) {
		String grade = "직원";
		if(rs.getString(3).equals("A")) {
			grade = "VIP";
		} else if(rs.getString(3).equals("B")) {
			grade = "일반";
		}
%>
	<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
    <td><%=rs.getString(4) %></td>
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
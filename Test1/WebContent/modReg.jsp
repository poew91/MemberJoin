<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.JdbcUtil, java.sql.*, javax.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";

	con = JdbcUtil.getConnection();
	pstmt = con.prepareStatement(sql);
	pstmt.setString(7, custno);
	pstmt.setString(1, custname);
	pstmt.setString(2, phone);
	pstmt.setString(3, address);
	pstmt.setString(4, joindate);
	pstmt.setString(5, grade);
	pstmt.setString(6, city);
	int updateCount = pstmt.executeUpdate(); // 여기서부터 끝줄까지 시험 문제에 만들어라는 말이 없으면 안 만들어도된다!
	
	if(updateCount > 0) {
		response.sendRedirect("memberList.jsp");
	} else {
%>
	<script>
		alert("수정 실패");
		history.back();
	</script>
<%
	}
%>
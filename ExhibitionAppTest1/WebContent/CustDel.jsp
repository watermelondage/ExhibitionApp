<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp"%>

<%
	String dellit = request.getParameter("UIDChk");
	String sql = "delete from customers where custid=?";
	
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,dellit);
	
	int rss = pstmt.executeUpdate();
	if(rss > 0){
		out.println("<script>alert('"+dellit+"님을 탈퇴처리');location.replace('Customers.jsp');</script>");
	}
%>























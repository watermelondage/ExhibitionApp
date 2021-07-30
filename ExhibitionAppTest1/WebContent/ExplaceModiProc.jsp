<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp"%>

	<%
		String codes = request.getParameter("codes");
		String placename = request.getParameter("placename");
		String contactno = request.getParameter("contactno");
		
		String t1 = request.getParameter("t1");
		String t2 = request.getParameter("t2");
		String times = "s"+t1+"e"+t2;
		
		String holiday = request.getParameter("holiday");
		
		String sql = "update explace set placename=?, contactno=?, times=?, holiday=? where codes=?";
				
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,placename);
		pstmt.setString(2,contactno);
		pstmt.setString(3,times);
		pstmt.setString(4,holiday);
		pstmt.setString(5,codes);
		
		

		int rsss = pstmt.executeUpdate();
		
		if(rsss > 0){

				out.println("<script>alert('수정!'); location.replace('Explace.jsp');</script>");
		}
		

	%>











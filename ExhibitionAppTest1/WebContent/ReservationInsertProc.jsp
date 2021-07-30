<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp"%>

	<%
		String idNAMEs= custname+"(" + custid +")";
		String da =request.getParameter("sdate");
		String price = request.getParameter("exprice");
		String cnt = request.getParameter("tcnt");
		String pay = request.getParameter("payment");

		
		String sql="insert into tickets value(null,?,?,now(),?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,idNAMEs);
		pstmt.setString(2,da);
		pstmt.setString(3,price);
		pstmt.setString(4,cnt);
		pstmt.setString(5,pay);

		
		
		int results = pstmt.executeUpdate();
		if(results>0){
			response.sendRedirect("Ticket.jsp");
		}
		
		
		
		
		
	%>













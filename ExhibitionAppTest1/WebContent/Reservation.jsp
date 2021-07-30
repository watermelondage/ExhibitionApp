<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp"%>
<%@ include file="./include/incLogin.jsp"%>

<h3 class="text-center">전시회 리스트</h3>
<div class="table-responsive table-wrap customer">
<form action="ReservationInsertProc.jsp" method="post" >
	<table class="table table-hover table-bordered text-center table-striped">
		<thead class="text-center">
			<tr>
				<th class="text-center">전시회 아이디</th>
				<th class="text-center">전시회 제목</th>
				<th class="text-center">장르</th>
				<th class="text-center">작가</th>
				<th class="text-center">이용 가능 연령대</th>
				<th class="text-center">소개글</th>
				<th class="text-center">전시회 위치</th>
				<th class="text-center">전시회 가격</th>
				<th class="text-center">관람일자</th>
				<th class="text-center">안내강사</th>
				<th class="text-center">예약</th>
			</tr>
		</thead>
		
		<%
			String sql = "select * from exhibition order by exidx";
			
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				do{
					String exidx = rs.getString("exidx");
					String extitle = rs.getString("extitle");
					String genre = rs.getString("genre");
					String author = rs.getString("author");
					String rating = rs.getString("rating");
					String texts = rs.getString("texts");
					String placename = rs.getString("placename");
					int exprice = rs.getInt("exprice");
					String sdate = rs.getString("sdate");
					String docent = rs.getString("docent");
				%>

					<tr>
						<td><%=exidx %></td>
						<td><%=extitle %></td>
						<td><%=genre %></td>
						<td><%=author %></td>
						<td><%=rating %></td>
						<td><%=texts %></td>
						<td><%=placename %></td>
						<td>
							<%=exprice %>
							<input type="hidden" value="<%=exprice %>" name="exprice"/>
						</td>
						<td>
							<input type="date" value="<%=sdate %>" name="sdate"/>
						</td>

						<td><%=docent %></td>
						<td>
							<input type="submit" value="예약" name="book" class="btn btn-info"/> 
						</td>
					</tr>
				<%}while(rs.next());
			}else{out.println("조회실패");}
		%>

	</table></form>
</div> 














<%@ include file="./include/Footer.jsp"%>
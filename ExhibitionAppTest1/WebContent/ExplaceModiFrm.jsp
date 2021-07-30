<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<br/><br/>
<h3>전시관 정보 수정</h3>

<%
	String code = request.getParameter("CodeChk");
	String codes = request.getParameter("codes");
	String placename = request.getParameter("placename");
	String rslocation = request.getParameter("location");
	String contactno = request.getParameter("contactno");
	String times = request.getParameter("times");
	String holiday = request.getParameter("holiday");
	
	String sql = "select * from explace where codes = ? ";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,code);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		do{
			codes = rs.getString("codes");
			placename = rs.getString("placename");
			rslocation = rs.getString("location");
			contactno = rs.getString("contactno");
			times = rs.getString("times");
			holiday = rs.getString("holiday");
			
		%>
		<section class="row">
			<div class="col-md-12">
			<form action="ExplaceModiProc.jsp" method="post">
				<table class="table table-response table-striped">
					<tr>
						<th>전시관 코드</th>
						<td>
							<input type="hidden" class="form-control" value="<%=codes %>" name="codes" />
							<input type="text" class="form-control" value="<%=codes %>" disabled />
						</td>
					</tr>
					
					<tr>
						<th>전시관 이름</th>
						<td>
							<input type="text" class="form-control" value="<%=placename%>" name="placename"/>
						</td>
					</tr>
					
					<tr>
						<th>위치</th>
						<td>
							<input type="text" class="form-control" value="<%=rslocation%>" disabled/>
						</td>
					</tr>
					
					<tr>
						<th>연락처</th>
						<td>
							<input type="text" class="form-control" value="<%=contactno %>" name="contactno"/>
						</td>
					</tr>
					
					<tr>
						<th>운영시간</th>
						<td class="text-info">
							<p><% out.println(times.substring(1,3)+"시~"+times.substring(4,6)+"까지"); %></p>
							<div class="form-inline">
							OPEN:<input type="text" class="form-control" value="<%=times.substring(1,3) %>" name="t1" />
							CLOSE:<input type="text" class="form-control" value="<%=times.substring(4,6) %>" name="t2" />
							</div>
							<!--
							 나중에 문자열하고 합해서 times필드에 넣어줄것 
								n1:시작시간 , n2: 종료시간
								"s"+n1==s10
							-->
						</td>
					</tr>
					
					<tr>
						<th>휴관일</th>
						<td>
							<input type="text" class="form-control" value="<%=holiday%>" name="holiday"/>
						</td>
					</tr>
					
					<tr>
						<th colspan="2">
							<input type="submit" value="정 보 수 정" class="btn btn-success btn-block" />
						</th>
					</tr>
				</table>
			</form>
			</div>	
		</section>
		<%}while(rs.next());
	}else{
		out.println("조회실패");
	}%>


<%@ include file="./include/Footer.jsp" %>
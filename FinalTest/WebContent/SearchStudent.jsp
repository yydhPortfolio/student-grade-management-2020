<%@page import="test.StudentVO"%>
<%@page import="test.StudentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="Header.jsp"></jsp:include>
	<%
		StudentDAO instance = StudentDAO.getInstance();

		ArrayList<StudentVO> stuArrs = instance.list;
		
		int btnNum = Integer.parseInt(request.getParameter("searchBtnNum"));
		
		int students = 0;

		if(btnNum == 5){

		String stuSerchId = request.getParameter("stuSearchId");
		
		%>
		<h2>학생 리스트</h2>
		<div class="studentLists1">
			<table border="1">
				<thead>
					<tr>
						<th class="sec11">이름</th>
						<th class="sec22">아이디</th>
						<th class="sec33">점수</th>
					</tr>
				</thead>
					<tbody>
			<%

		for (int i = 0; i < stuArrs.size(); i++) {

			if (stuSerchId.equals(stuArrs.get(i).getId())) {
				%>
				<tr>
					<td class="sec11 studentNum<%= students %>"><%=stuArrs.get(i).getName()%></td>
					<td class="sec22 studentNum<%= students %>"><%=stuArrs.get(i).getId()%></td>
					<td class="sec33 studentNum<%= students %>"><%=stuArrs.get(i).getScore()%></td>
				</tr>
		<%
				students++;
			}
		}
			%>
			</tbody>
		</table>
	</div>
	<%
		} else if(btnNum == 6){

			String stuSearchName = request.getParameter("stuSearchName");
			
			%>
			<h2>학생 리스트</h2>
			<div class="studentLists1">
				<table border="1">
					<thead>
						<tr>
							<th class="sec11">이름</th>
							<th class="sec22">아이디</th>
							<th class="sec33">점수</th>
						</tr>
					</thead>
						<tbody>
				<%

			for (int i = 0; i < stuArrs.size(); i++) {

				if (stuSearchName.equals(stuArrs.get(i).getName())) {
					%>
					<tr>
						<td class="sec11 studentNum<%= students %>"><%=stuArrs.get(i).getName()%></td>
						<td class="sec22 studentNum<%= students %>"><%=stuArrs.get(i).getId()%></td>
						<td class="sec33 studentNum<%= students %>"><%=stuArrs.get(i).getScore()%></td>
					</tr>
			<%
					students++;
				}
			}
				%>
				</tbody>
			</table>
		</div>
		<%
			} else if(btnNum == 7){

				int stuSearchScore = Integer.parseInt(request.getParameter("stuSearchScore"));
				
				%>
				<h2>학생 리스트</h2>
				<div class="studentLists1">
					<table border="1">
						<thead>
							<tr>
								<th class="sec11">이름</th>
								<th class="sec22">아이디</th>
								<th class="sec33">점수</th>
							</tr>
						</thead>
							<tbody>
					<%

				for (int i = 0; i < stuArrs.size(); i++) {

					if (stuSearchScore == stuArrs.get(i).getScore()) {
						%>
						<tr>
							<td class="sec11 studentNum<%= students %>"><%=stuArrs.get(i).getName()%></td>
							<td class="sec22 studentNum<%= students %>"><%=stuArrs.get(i).getId()%></td>
							<td class="sec33 studentNum<%= students %>"><%=stuArrs.get(i).getScore()%></td>
						</tr>
				<%
						students++;
					}
				}
					%>
					</tbody>
				</table>
			</div>
			<%
				} 
			%> 
	<div class="homeBtn">
		<button class="goHome" onclick="location.href='Main.jsp'">홈으로</button>
	</div>
</body>
</html>
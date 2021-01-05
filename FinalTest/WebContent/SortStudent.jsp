<%@page import="test.StudentDAO"%>
<%@page import="test.StudentVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="Header.jsp"></jsp:include>
	<%
		StudentDAO instance = StudentDAO.getInstance();
		int btns = Integer.parseInt(request.getParameter("btn"));
		int stuCnt = instance.stuCnt;
		instance.sortData();
		ArrayList<StudentVO> stuArr = instance.sortList;
		
		if(stuCnt > 0){
			if(btns == 1){ // 오름차순
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
				for (int i = 0; i < instance.getSize(); i++) { 
			%>
					<tr>
						<td class="no<%= i %> sec11"><%=stuArr.get(i).getName()%></td>
						<td class="no<%= i %> sec22"><%=stuArr.get(i).getId()%></td>
						<td class="no<%= i %> sec33"><%=stuArr.get(i).getScore()%></td>
					</tr>
			<%
				
		}
			%>
				</tbody>
			</table>
		</div>
	<%
		} else if(btns == 2){ // 내림차순
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
					for (int i = instance.getSize() - 1; i >= 0; i--) {
				%>
						<tr>
							<td class="no<%= i %> sec11"><%=stuArr.get(i).getName()%></td>
							<td class="no<%= i %> sec22"><%=stuArr.get(i).getId()%></td>
							<td class="no<%= i %> sec33"><%=stuArr.get(i).getScore()%></td>
						</tr>
				<%
					
			}
				%>
					</tbody>
				</table>
			</div>
		<%
		}
		}
	%>
	<div class="homeBtn">
		<button class="goHome" onclick="location.href='Main.jsp'">홈으로</button>
	</div>
</body>
</html>
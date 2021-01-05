<%@page import="test.StudentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	StudentDAO instance = StudentDAO.getInstance();
	int stuCnt = instance.stuCnt;
	ArrayList<StudentVO> stuArr = instance.list;
%>
<div class="wrapper"> <!-- 학생 리스트 -->
	<h2>학생 리스트</h2>
	<div class="studentLists">
		<table border="1">
			<thead>
				<tr>
					<th class="sec1">이름</th>
					<th class="sec2">아이디</th>
					<th class="sec3">점수</th>
				</tr>
			</thead>
			<tbody>
					<%
			if (stuCnt > 0) {
		%>
			<%
				for (int i = 0; i < instance.getSize(); i++) {
			%>
				<tr>
					<td class="no<%= i %> sec1"><%=stuArr.get(i).getName()%></td>
					<td class="no<%= i %> sec2"><%=stuArr.get(i).getId()%></td>
					<td class="no<%= i %> sec3"><%=stuArr.get(i).getScore()%></td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>
</div>
</div>
		<%
			}
		%>
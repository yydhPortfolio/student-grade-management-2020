<%@page import="test.StudentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="Menus.jsp"></jsp:include>
<jsp:include page="StudentList.jsp"></jsp:include>

<div class="wrapper1">
<%
	StudentDAO instance = StudentDAO.getInstance();
	if(request.getParameter("btn") == null){
		instance.getAvg();
%>
<div class="studentScoreInfo">
	<div class="studentSumInfo">
		<h2>전체 학생 총점</h2>
		<h1><%= instance.sum %>점</h1>
	</div>
	<div class="studentAvg">
		<h2>학생 평균 점수</h2>
		<h1><%= Math.round((float)instance.average * 100) / 100.0 %>점</h1> <!-- round를 이용해 평균의 소수점 둘째자리까지만 출력 -->
	</div>
</div>
<%
	}
	if (request.getParameter("btn") != null) {
		int btn = Integer.parseInt(request.getParameter("btn"));

		if (btn == 1) { // 가입
%>
<h2>정보입력</h2>
<form action="RegisterStudent.jsp">
	<input type="hidden" name="stuNo" value="<%=instance.stuNums + 1%>">
	<input type="text" name="stuName" placeholder="이름" required="required">
	<input type="text" name="stuId" placeholder="아이디" required="required">
	<input type="password" name="stuPw" placeholder="비밀번호"
		required="required"> <input type="number" name="stuSco"
		placeholder="점수" required="required"> <input type="submit"
		value="확인">
</form>
<%
	} else if (btn == 2) { // 탈퇴
		%>
		<h2>탈퇴할 아이디 입력</h2>
		<form action="RemoveStudent.jsp" class="removeSec">
			<input type="text" name="stuDelId" placeholder="아이디" required="required">
			<input type="submit" value="확인">
		</form>
		<%

		} else if (btn == 3) { // 정렬
		%>
			<div class="sortBtns">
	 			<button onclick="location.href='SortStudent.jsp?btn=1'">성적 오름차순</button>
				<button onclick="location.href='SortStudent.jsp?btn=2'">성적 내림차순</button>
			</div>
		<%
		} else if(btn == 4) { // 학생 검색 설정
			%>
			<div class="searchBtns">
				 <button onclick="location.href='Main.jsp?btn=5'">아이디 검색</button>
				<button onclick="location.href='Main.jsp?btn=6'">이름 검색</button>
				<button onclick="location.href='Main.jsp?btn=7'">성적 검색</button>
			</div>
			<%
		} else if(btn == 5){ // 아이디로 학생검색
			%>
			<h2>검색할 아이디 입력</h2>
			<form action="SearchStudent.jsp" class="searchSec">
				<input type="hidden" value="5" name="searchBtnNum">
				<input type="text" name="stuSearchId" placeholder="아이디" required="required">
				<input type="submit" value="확인">
			</form>
			<%
		} else if(btn == 6){ // 이름으로 학생검색
			%>
			<h2>검색할 이름 입력</h2>
			<form action="SearchStudent.jsp" class="searchSec">
				<input type="hidden" value="6" name="searchBtnNum">
				<input type="text" name="stuSearchName" placeholder="이름" required="required">
				<input type="submit" value="확인">
			</form>
			<%
		} else if(btn == 7){ // 성적으로 학생 검색
			%>
			<h2>검색할 성적 입력</h2>
			<form action="SearchStudent.jsp" class="searchSec">
				<input type="hidden" value="7" name="searchBtnNum">
				<input type="text" name="stuSearchScore" placeholder="점수" required="required">
				<input type="submit" value="확인">
			</form>
			<%
		} else if(btn == 8){ // 아이디를 입력받아 일치하는값이 있으면 btn9를 넘겨줌
			%>
			<h2>정보를 수정할 학생의 아이디 입력</h2>
			<form action="ModStudent.jsp" class="searchSec">
				<input type="hidden" value="8" name="modBtnNum">
				<input type="text" name="stuModId" placeholder="아이디" required="required">
				<input type="submit" value="확인">
			</form>
			<%
		} else if (btn == 9) { // 학생 정보 수정
			int listResult = Integer.parseInt(request.getParameter("listResult"));
			int sortResult = Integer.parseInt(request.getParameter("sortResult"));
			%>
			<h2>정보수정</h2>
			<form action="ModStudent.jsp" class="searchSec">
				<input type="hidden" value="9" name="modBtnNum">
				<input type="hidden" value="<%= listResult %>" name="listResult">
				<input type="hidden" value="<%= sortResult %>" name="sortResult">
				<input type="text" name="stuModName" placeholder="이름" required="required" value="<%= instance.list.get(listResult).getName() %>">
				<input type="text" name="stuModId" placeholder="아이디" required="required" value="<%= instance.list.get(listResult).getId() %>">
				<input type="text" name="stuModScore" placeholder="점수" required="required" value="<%= instance.list.get(listResult).getScore() %>">
				<input type="submit" value="확인">
			</form>
			<%
		}

	}
%>
</div>
</div>
</div>
</body>
</html>
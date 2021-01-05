<%@page import="test.StudentVO"%>
<%@page import="test.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 가입</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<%
		StudentDAO instance = StudentDAO.getInstance();

		StudentVO vo = new StudentVO();

		int no = Integer.parseInt(request.getParameter("stuNo"));
		String name = request.getParameter("stuName");
		String id = request.getParameter("stuId");
		String pw = request.getParameter("stuPw");
		int score = Integer.parseInt(request.getParameter("stuSco"));

		vo.setId(id);
		int check = instance.checkId(vo);

		if (check == -1) {
			vo.setName(name);
			vo.setNo(no);
			vo.setId(id);
			vo.setPw(pw);
			vo.setScore(score);
			instance.addStudent(vo);
	%>
	<script type="text/javascript">
		alert("회원가입이 완료되었습니다.");
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("중복된 아이디 입니다.");
	</script>
	<%
		}
	%>
	<script type="text/javascript">
		location.href = "Main.jsp";
	</script>
</body>
</html>
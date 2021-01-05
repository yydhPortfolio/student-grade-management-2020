<%@page import="test.StudentVO"%>
<%@page import="test.StudentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 탈퇴</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<%
		StudentDAO instance = StudentDAO.getInstance();

		ArrayList<StudentVO> stuArrs = instance.list;
		
		int result = -1;
		
		String delId = request.getParameter("stuDelId");
		
		for(int i = 0; i < stuArrs.size(); i++){
			if(delId.equals(stuArrs.get(i).getId())){
				instance.removeStudent(i);
				result = i;
				break;
			}
		}
		
		if(result == -1) { // 일치하는 아이디 없음
			%>
			<script>
				alert("일치하는 아이디가 없습니다.");
			</script>
			<%
		} else { // 학생 정보 삭제
			%>
			<script>
				alert("탈퇴가 완료되었습니다.");
			</script>
			<%
		}
	%>
	
	<script>
		location.href="Main.jsp";
	</script>
</body>
</html>
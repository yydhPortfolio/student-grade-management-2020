<%@page import="test.StudentVO"%>
<%@page import="test.StudentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보수정</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<%
		StudentDAO instance = StudentDAO.getInstance();
		
		ArrayList<StudentVO> modStuArrs = instance.list;
		ArrayList<StudentVO> modStuArrss = instance.sortList;
		
		int btnNum = Integer.parseInt(request.getParameter("modBtnNum"));
		
		int listResult = -1;
		
		int sortResult = -1;
		
		if(btnNum == 8){ // 아이디 중복체크
			String stuModId = request.getParameter("stuModId");
			
			for(int i = 0; i < modStuArrs.size(); i++){ // 아이디 중복체크
				if(stuModId.equals(modStuArrs.get(i).getId())){
					listResult = i;
					break;
				}
			}
			
			for(int i = 0; i < modStuArrss.size(); i++){
				if(stuModId.equals(modStuArrss.get(i).getId())){
					sortResult = i;
					break;
				}
			}
			
			if(listResult == -1) { // 아이디가 중복일시
				%>
					<script type="text/javascript">
						alert("일치하는 아이디가 없습니다.");
						location.href = "Main.jsp";
					</script>		
				<%
			} else { // 아이디가 중복이 아닐시
				%>
					<script type="text/javascript">
						location.href = "Main.jsp?btn=9&listResult=<%= listResult %>&sortResult=<%= sortResult %>";
					</script>		
				<%
			}
			
		} else if(btnNum == 9){ // 학생 정보수정
			int result1 = -1;
			int listidx = Integer.parseInt(request.getParameter("listResult"));
			int sortidx = Integer.parseInt(request.getParameter("sortResult"));
			String stuModName = request.getParameter("stuModName");
			String stuModId = request.getParameter("stuModId");
			int stuModScore = Integer.parseInt(request.getParameter("stuModScore"));
			
			for(int i = 0; i < modStuArrs.size(); i++){
				if(i == listidx) {
					result1 = -1;
				} else if(stuModId.equals(modStuArrs.get(i).getId())){
					result1 = i;
					break;
				}
			}
			
			
			if(result1 == -1){
				instance.list.get(listidx).setId(stuModId);
				instance.list.get(listidx).setName(stuModName);
				instance.list.get(listidx).setScore(stuModScore);
				
				instance.sortList.get(sortidx).setId(stuModId);
				instance.sortList.get(sortidx).setName(stuModName);
				instance.sortList.get(sortidx).setScore(stuModScore);
				
				%>
					<script type="text/javascript">
						alert("수정완료.");
						location.href = "Main.jsp";
					</script>		
				<%
			
			} else {
				%>
					<script type="text/javascript">
						alert("중복된 아이디 입니다.");
						location.href = "Main.jsp";
					</script>		
				<%
			}
			
		}
		
	%>
</body>
</html>
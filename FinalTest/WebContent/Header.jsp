<%@page import="test.StudentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student</title>
<% request.setCharacterEncoding("utf-8"); %>
<%
	StudentDAO instance = StudentDAO.getInstance();
	int stuCnt = instance.stuCnt;
	ArrayList<StudentVO> stuArr = instance.list;
%>
<style>
	<%
		for(int i = 0; i < stuCnt; i++){
			if(i % 2 == 0){
				%>
					.no<%= i %> {
						background-color : rgba(170, 170, 170, 0.3);
					}
					
					.studentNum<%= i %> {
						background-color : rgba(170, 170, 170, 0.3) !important;
					}
				<%
			} else if(i % 3 == 0){
				%>
				.no<%= i %> {
					background-color : #fff;
				}
				
				.studentNum<%= i %> {
					background-color : #fff !important;
				}
			<%
			}
		}
	%>
</style>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<p># 학생 성적 관리 프로그램</p>
	
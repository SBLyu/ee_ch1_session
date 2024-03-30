<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.DateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	DateFormat dateFormate=new SimpleDateFormat("yyyy-MM-dd");
%>

<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	if(session.getAttribute("person")==null){
		response.sendRedirect("session.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>歡迎您，$(person.name)</title>
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
		<div>
			<fieldset>
				<table>
					<tr>
						<td>您的姓名:</td>
						<td>${person.name } </td>
					</tr>
					<tr>
						<td>登入時間:</td>
						<td>${loginTime }</td>
					</tr>
					<tr>
						<td>您的年齡:</td>
						<td>${person.age }</td>
					</tr>
					<tr>
						<td>您的生日:</td>
						<td>${person.birthday }</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="button" value="重新登入" onclick="location='session.jsp';" class="button">
						</td>
					</tr>
				</table>
			</fieldset>
		</div>
	</body>
</html>
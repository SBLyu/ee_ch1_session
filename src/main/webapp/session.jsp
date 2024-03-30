<%@page import="java.util.Date"%>
<%@page import="mad.nthu.ch1_session.bean.Person"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
%>

<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	response.setCharacterEncoding("UTF-8");
	
	Person persons[] ={
			new Person("a", "a", 11, dateFormat.parse("1984-07-31")),		
			new Person("b", "b", 12, dateFormat.parse("1984-11-11")),		
			new Person("c", "c", 13, dateFormat.parse("1984-11-11"))
	};
	
	String message="";
	
	if(request.getMethod().equals("POST")){
		for(Person person:persons){
			if(person.getName().equalsIgnoreCase(request.getParameter("username"))
					&& person.getPassword().equals(request.getParameter("password"))){
				
				session.setAttribute("person", person);
				session.setAttribute("loginTime", new Date());
				
				response.sendRedirect(request.getContextPath()+"/welcome.jsp");
				return;
			}
		}
		message="使用者帳號密碼不正確，登入失敗!";
	}
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>請先登入</title>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
		<div align="center" style="margin:10px;">
			<fieldset style="width:70%;">
				<legend>登入</legend>
				<form action="session.jsp" method="post">
					<table>
						<%if(!message.equals("")){ %>
						<tr>
							<td></td>
							<td>
								<span><img src="images/errorstate.gif"></span>
								<span style="color:red;"><%=message %></span>
							</td>
						</tr>	
						<%} %>				
						<tr>
							<td>帳號:</td>
							<td>
								<input type="text" name="username" style="width:200px;">
							</td>
						</tr>					
						<tr>
							<td>密碼:</td>
							<td>
								<input type="password" name="password" style="width:200px;">
							</td>
						</tr>					
						<tr>
							<td></td>
							<td>
								<input type="submit" value="登入" class="button">
							</td>
						</tr>					
					</table>
				</form>
			</fieldset>
		</div>
		a,a
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5" isErrorPage="true"%>
    
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	if("POST".equals(request.getMethod())){
		Cookie usernameCookie=new Cookie("username",request.getParameter("username"));
		Cookie visittimesCookie=new Cookie("visitTimes","0");
		
		response.addCookie(usernameCookie);
		response.addCookie(visittimesCookie);
		
		response.sendRedirect(request.getContextPath()+"/cookie.jsp");
		
		return;
	}
%>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="BIG5">
	<title>Insert title here</title>
	</head>
	<body>
		<div aligm="center" style="margin:10px;">
			<fieldset style="width:70%;">
				<legend>登入</legend>
				<form action="login.jsp" method="post">
					<table>
						<tr>
							<td></td>
							<td>
								<span><img src="images/errorstate.gif"></span>
								<span style="color:red;"><%=exception.getMessage() %></span>
							</td>
						</tr>
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
								<input type="submit" value="登錄" class="button">
							</td>
						</tr>
					</table>
				</form>
			</fieldset>
		</div>
	</body>
</html>
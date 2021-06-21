<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="user_id" />
<jsp:setProperty name="user" property="user_pwd" />
<jsp:setProperty name="user" property="user_pwd_check" />
<jsp:setProperty name="user" property="user_nick" />
<jsp:setProperty name="user" property="user_city" />
<html>
<head>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<%
		if( user.getUser_id() == null || user.getUser_pwd() == null || user.getUser_pwd_check() == null || user.getUser_nick() == null || user.getUser_city() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('빈칸 확인')");
			script.println("history.back()");
			script.println("</script>");
		} 
		else{
			UserDAO users = new UserDAO();
			int result = users.register(user);
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('서버오류')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if(result == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 아이디 존재')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입 성공')");
				script.println("location.href='login.jsp'");
				script.println("</script>");				
			}
		}
	%>
</body>
</html>


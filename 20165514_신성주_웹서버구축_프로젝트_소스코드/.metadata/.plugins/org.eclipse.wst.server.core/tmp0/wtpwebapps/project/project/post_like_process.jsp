<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="post.Post_check"%>
<%@ page import="post.Post" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user_id = null;
		String post_id = null;
		
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
		}
		
		if(session.getAttribute("post_id") != null){
			post_id = (String)session.getAttribute("post_id");
		}
		
		if(user_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");	
		}
		
		
		if(Integer.parseInt(post_id) == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='post.jsp'");
			script.println("</script>");
		}
		
		
		Post post = new Post_check().getPost(Integer.parseInt(post_id));
		

		Post_check post_check = new Post_check();
		int result = post_check.liked(Integer.parseInt(post_id));
			
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('추천 실패')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('추천 성공')");
			script.println("location.href='post.jsp'");
			script.println("</script>");	
		}
				
	%>
</body>
</html>
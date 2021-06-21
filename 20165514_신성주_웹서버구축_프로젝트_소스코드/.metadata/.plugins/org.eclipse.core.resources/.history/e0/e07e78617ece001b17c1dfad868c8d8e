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
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
		}
		
		if(user_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");	
		}
		
		int post_id = 0;
		
		if(request.getParameter("post_id") != null){
			post_id = Integer.parseInt(request.getParameter("post_id"));
		}
		
		if(post_id == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유요하지 않은 글입니다')");
			script.println("location.href='post.jsp'");
			script.println("</script>");
		}
		
		Post post = new Post_check().getPost(post_id);
		
		if(!user_id.equals(post.getUser_id())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='post.jsp'");
			script.println("</script>");
		}
		else{
			if(request.getParameter("post_title") == null || request.getParameter("post_content") == null || request.getParameter("post_title").equals("") || request.getParameter("post_content").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 다 되었는지 확인해주세요')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				Post_check post_check = new Post_check();
				int result = post_check.update(post_id, request.getParameter("post_title"), request.getParameter("post_content"));
				
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정 성공')");
					script.println("location.href='post.jsp'");
					script.println("</script>");	
				}
			}
		}
	%>
</body>
</html>
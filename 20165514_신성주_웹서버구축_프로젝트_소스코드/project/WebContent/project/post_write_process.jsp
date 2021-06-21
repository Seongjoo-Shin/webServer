<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="post.PostDAO"%>
<%@ page import="java.io.PrintWriter"%>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="post" class="post.Post" scope="page"/>
<jsp:setProperty name="post" property="post_title"/>
<jsp:setProperty name="post" property="post_content"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
		else{
			if(post.getPost_title() == null || post.getPost_content() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 항목을 입력하세요')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PostDAO post_check = new PostDAO();
				int result = post_check.write(post.getPost_title(), user_id, post.getPost_content());
				
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 실패')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 성공')");
					script.println("location.href='post.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>
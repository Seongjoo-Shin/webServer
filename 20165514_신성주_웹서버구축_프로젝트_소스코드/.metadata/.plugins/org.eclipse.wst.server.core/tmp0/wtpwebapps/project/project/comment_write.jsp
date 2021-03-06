<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="post.Post_check"%>
<%@ page import="post.Comment" %>
<%@ page import="java.io.PrintWriter"%>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="comment" class="post.Comment" scope="page"/>
<jsp:setProperty name="comment" property="comment_id"/>
<jsp:setProperty name="comment" property="comment_content"/>
<jsp:setProperty name="comment" property="comment_grub"/>
<jsp:setProperty name="comment" property="comment_lev"/>
<jsp:setProperty name="comment" property="comment_date"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<%
		String user_id = null;
		String post_id = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
		}
		
		post_id = (String)session.getAttribute("post_id");
		
		if(user_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");	
		}
		else{
			if(comment.getComment_content() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('댓글을 입력하세요')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				Comment comm = new Comment(user_id, comment.getComment_content(), comment.getComment_date(), Integer.parseInt(post_id));
				Post_check post_check = new Post_check();
				int result = post_check.commentinsert(comm);
				
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글 실패')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글 성공')");
					script.println("history.go(-1)");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>
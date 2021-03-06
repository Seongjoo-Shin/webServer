<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="post.Post" %>
<%@ page import="post.PostDAO" %>
<%@ page import="post.Comment" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		String user_id = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
		}
		
		int post_id = 0;
		if(request.getParameter("post_id") != null){
			post_id = Integer.parseInt(request.getParameter("post_id"));
			session.setAttribute("post_id", Integer.toString(post_id));
		}		
		
		Post post = new PostDAO().getPost(post_id);
		Comment comm = new PostDAO().getPost_id(post_id);
		
		int com_page = 1;
		
	%>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<div class="container-fluid">
    		<a class="navbar-brand" href="index.jsp">Home</a>
    		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        	<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
      			
        		<li class="nav-item">
          			<a class="nav-link" href="post.jsp">여행지 게시판</a>
        		</li>
        		<li class="nav-item">
          			<a class="nav-link" href="map.jsp">일정 제작</a>
        		</li>
        		
        		<li class="nav-item">
          			<a class="nav-link" href="mypage.jsp">MyPage</a>
        		</li>
     		</div>
     			<li class="nav-item">
     				<div class="col-12"><a class="btn btn-secondary" href="logout.jsp">로그아웃</a></div>
     			</li>
      		</ul>	
  		</div>
	</nav><br>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= post.getPost_title() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= post.getUser_id() %></td>
					</tr>
					<tr>
						<td>추천수</td>
						<td colspan="2"><%= post.getLiked() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= post.getPost_date().substring(0,11) + post.getPost_date().substring(11,13) + "시" + post.getPost_date().substring(14,16) + "분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height:200px; text-align:left;"><%= post.getPost_content() %></td>
					</tr>			
				</tbody>
			</table>
			<%
				if( user_id != null){
			%>
					<a href="post_like_process.jsp" class="btn btn-secondary">추천</a>&nbsp;&nbsp;
			<%		
				}
			%>
			<a href="post.jsp" class="btn btn-primary" style="float: right;">목록</a> &nbsp;&nbsp;
			<%
				if(user_id != null && user_id.equals(post.getUser_id())){
			%>
					<a href="post_update.jsp?post_id=<%= post_id %>" class="btn btn-primary">수정</a>&nbsp;&nbsp;
					<a href="post_delete_process.jsp?post_id=<%= post_id %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
		</div><br><br>
	
	<!-- 게시판 메인 페이지 영역 끝 -->
		<div>
			<div class="comment_view">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">댓글</th>
					</tr>
					<tr>
						<td style="width: 70%;">내용</td>
						<td style="width: 15%;">작성자</td>
						<td style="width: 15%;">작성일자</td>
					</tr>
					</thead>
					<% 
						PostDAO post_check = new PostDAO();
						ArrayList<Comment> com_list = post_check.getComment(post.getPost_id());
						for(int i=0; i<com_list.size(); i++){
					%>
					<tbody>
						<tr>
							
							<td><%= com_list.get(i).getComment_content() %>
							<td><%= com_list.get(i).getComment_id() %>
							<td><%= com_list.get(i).getComment_date() %>
						</tr>
					</tbody>	
					<%			
						}
						
					%>
					<tr>
						
							<form method="post" action="comment_write.jsp">
								<td colspan="2"><input type="text" class="form-control" name="comment_content"></td>
								<td colspan="1"><input type="submit" class="form-control" value="등록"></td>
							</form>
						
					</tr>
				</table>
			</div>
		</div>
	
	
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>



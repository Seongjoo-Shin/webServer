<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ page import="post.Post"%>
<%@ page import="post.PostDAO" %>
<%@ page import="post.Comment" %>
<%@ page import="user.User" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
	String user_id = null;
	if(session.getAttribute("user_id") != null){
		user_id = (String)session.getAttribute("user_id");
	}
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	int post_id = 0;
	if(request.getParameter("post_id") != null){
		post_id = Integer.parseInt(request.getParameter("post_id"));
	}
	
	Post post = new PostDAO().getPost(post_id);
	%>
<html>
<head>
<meta charset="utf-8">
<title><%= user_id %>님의 페이지</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-5" style="margin:0 auto;">
				<h3 style="text-align:center;" class="text-info">작성 게시글</h3>
				<div class="border" stlye="width: 600px; height:800px;">
						<table class="table table-striped">
							<thead>
								<tr>	
									<th>제목</th>
									<th>내용</th>
									<th>작성자</th>
								</tr>
							</thead>
						<%
							Connection conn = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							
							try {
								String url = "jdbc:mysql://localhost:3306/project";
								String user = "root";
								String pwd = "1234";
								Class.forName("com.mysql.jdbc.Driver");
								conn = DriverManager.getConnection(url, user, pwd);
							
								String query = "select * from post where user_id = '"+user_id+"' and post_available = 1";
								pstmt = conn.prepareStatement(query);
								rs = pstmt.executeQuery();
								
								while(rs.next()){
						%>
							<tbody>
								<tr>
									<td><%= rs.getString("post_title") %></td>
									<td><%= rs.getString("post_content") %></td>
									<td><%= rs.getString("user_id") %></td>
								</tr>
							</tbody>
						<%			
									
								}
								
							} catch(Exception e) {
								e.printStackTrace();
							}finally{
								if(rs != null)
									rs.close();
								if(pstmt != null)
									pstmt.close();
								if(conn != null)
									conn.close();
							}
						%>
				
						</table>
				</div>
			</div>
			<div class="col-sm-3" style="margin:0 auto;">
				<h3 style="text-align:center;" class="text-info">작성 댓글</h3>
				<div class="border" stlye="width: 600px; height:800px;">
					<table class="table table-striped">
							<thead>
								<tr>	
									<th>댓글</th>
									<th>작성자</th>
									<th>작성일자</th>
								</tr>
							</thead>
						<%
							Connection conn1 = null;
							PreparedStatement pstmt1 = null;
							ResultSet rs1 = null;
							
							try {
								String url = "jdbc:mysql://localhost:3306/project";
								String user = "root";
								String pwd = "1234";
								Class.forName("com.mysql.jdbc.Driver");
								conn = DriverManager.getConnection(url, user, pwd);
							
								String query = "select * from comment where comment_id = '"+user_id+"'";
								pstmt = conn.prepareStatement(query);
								rs = pstmt.executeQuery();
								
								while(rs.next()){
						%>
							<tbody>
								<tr>
									<td><%= rs.getString("comment_content") %></td>
									<td><%= rs.getString("comment_id") %></td>
									<td><%= rs.getString("comment_date") %></td>
								</tr>
							</tbody>
						<%			
									
								}
								
							} catch(Exception e) {
								e.printStackTrace();
							}finally{
								if(rs1 != null)
									rs1.close();
								if(pstmt1 != null)
									pstmt1.close();
								if(conn1 != null)
									conn1.close();
							}
						%>
				
						</table>
				</div>
			</div>
			<div class="col-sm-4" style="margin:0 auto;">
				<h3 style="text-align:center;" class="text-info">일정</h3>
				<div class="border" stlye="width: 600px; height:800px;">
						<table class="table table-striped">
							<thead>
								<tr>	
									<th class="text-center" colspan=5>제작 일정</th>
								</tr>
							</thead>
						<%
							Connection conn2 = null;
							PreparedStatement pstmt2 = null;
							ResultSet rs2 = null;
							
							try {
								String url = "jdbc:mysql://localhost:3306/project";
								String user = "root";
								String pwd = "1234";
								Class.forName("com.mysql.jdbc.Driver");
								conn = DriverManager.getConnection(url, user, pwd);
							
								String query = "select * from ranking where user_id = '"+user_id+"'";
								pstmt = conn.prepareStatement(query);
								rs = pstmt.executeQuery();
								
								while(rs.next()){
						%>
							<tbody>
								<tr>
									<td><%= rs.getString("num1") %></td>
									<td><%= rs.getString("num2") %></td>
									<td><%= rs.getString("num3") %></td>
									<td><%= rs.getString("num4") %></td>
									<td><%= rs.getString("num5") %></td>	
								</tr>
							</tbody>
						<%			
									
								}
								
							} catch(Exception e) {
								e.printStackTrace();
							}finally{
								if(rs2 != null)
									rs2.close();
								if(pstmt2 != null)
									pstmt2.close();
								if(conn2 != null)
									conn2.close();
							}
						%>
				
						</table>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>




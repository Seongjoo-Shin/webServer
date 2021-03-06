<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="post.Post" %>
<%@ page import="post.PostDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글 수정</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='post.jsp'");
			script.println("</script>");	
		}
		Post post = new PostDAO().getPost(post_id);
		if(!user_id.equals(post.getUser_id())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		
		}
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<div class="container-fluid">
    		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
    		</button>
    		<a class="navbar-brand" href="index.jsp">Home</a>
    		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        	<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
      			
        		<li class="nav-item">
          			<a class="nav-link" href="post/post.jsp">여행지 게시판</a>
        		</li>
        		<li class="nav-item">
          			<a class="nav-link" href="#">일정 제작</a>
        		</li>
        		
        		<li class="nav-item">
          			<a class="nav-link" href="#">MyPage</a>
        		</li>
     		</div>
     			<li class="nav-item">
     				<div class="col-12"><a class="btn btn-secondary" href="logout.jsp">로그아웃</a></div>
     			</li>
      		</ul>	
  		</div>
	</nav><br>
	<!-- 네비게이션 영역 끝 -->
	
	<!-- 게시판 글쓰기 양식 영역 시작 -->
	<div class="container">
		<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
			<form method="post" action="post_update_process.jsp?post_id=<%= post_id%>">
			
							<td><input type="text" class="form-control" placeholder="글 제목" id="post_title" name="post_title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="post_content" maxlength="1024" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<!-- 글쓰기 버튼 생성 -->
				<input type="submit" class="btn btn-primary pull-right" value="수정하기">
			</form>
		</div><br><br>
		
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">등록된 여행지</th>
					</tr>
				</thead>
				<tbody>

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
							
								String query = "select * from ranking where user_id = '"+user_id+"'";
								pstmt = conn.prepareStatement(query);
								rs = pstmt.executeQuery();
								
								while(rs.next()){
						%>
						<tr>
							<label>
							<td><input type="radio" name="tour_list" onClick="document.getElementById('post_title').value=this.value" class="form-control" value="<%= rs.getString("num1")%>-<%= rs.getString("num2")%>-<%= rs.getString("num3")%>-<%= rs.getString("num4")%>-<%= rs.getString("num5")%>"></td>
							<td><%= rs.getString("num1")%>-<%= rs.getString("num2")%>-<%= rs.getString("num3")%>-<%= rs.getString("num4")%>-<%= rs.getString("num5")%></td>
						</tr>
						<%
								}
							}catch(Exception e){
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

				</tbody>	
			</table>
	</div>
</body>
</html>



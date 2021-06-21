<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="post.Post" %>
<%@ page import="post.PostDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>여행지 게시물</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<%
		String user_id = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
		}
		int pageNumber = 1; //기본은 1 페이지를 할당
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
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
						<th style="background-color: #eeeeee; text-align: center; width:10%;">번호</th>
						<th style="background-color: #eeeeee; text-align: center; width:60%;">제목</th>
						<th style="background-color: #eeeeee; text-align: center; width:10%;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center; width:20%;">작성일</th>
					</tr>
				</thead>
				<tbody>
						<%
						PostDAO post_check = new PostDAO(); // 인스턴스 생성
						ArrayList<Post> list = post_check.getList(pageNumber);
						
						
						for(int i = 0; i < list.size(); i++){
							
							Connection conn = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							String city = null;
							try {
								
								String url = "jdbc:mysql://localhost:3306/project";
								String user = "root";
								String pwd = "1234";
								Class.forName("com.mysql.jdbc.Driver");
								conn = DriverManager.getConnection(url, user, pwd);
							
								String query = "select city from member where id = '"+list.get(i).getUser_id()+"'";
								pstmt = conn.prepareStatement(query);
								rs = pstmt.executeQuery();
								
								while(rs.next()){
									city = rs.getString("city");
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
					<tr>
						<td><%= list.get(i).getPost_id() %></td>
						<td><a href="post_view.jsp?post_id=<%= list.get(i).getPost_id() %>"><%= list.get(i).getPost_title() %></a></td>
						<%
							if(city.equals("ChunCheon")){
						%>
							<td class="text-success"><strong><%= list.get(i).getUser_id() %></strong></td>			
						<% 
							}else{%>
							<td><%=list.get(i).getUser_id() %></td>						
						<%		
							} 
						%>
						<td><%= list.get(i).getPost_date().substring(0, 11) + list.get(i).getPost_date().substring(11, 13) + "시" + list.get(i).getPost_date().substring(14, 16) + "분" %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<a href="post_write.jsp" class="btn btn-primary pull-right" style="float:right;">글쓰기</a>
		</div>
	</div>
</body>
</html>



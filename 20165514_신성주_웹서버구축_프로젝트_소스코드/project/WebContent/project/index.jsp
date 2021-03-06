<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="rank.Rank" %>
<%@ page import="tour.Tour" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>춘천 여행</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<%
		String user_id = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
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

	<div class="container-fluid">
	<div class="row">
		<div class="col-sm-6 text-center" style="margin:0 auto;">
			<h3 style="text-align:center;" class="text-info">인기 게시물</h3>
				<div class="border" stlye="width: 600px; height:800px;">
						<table class="table table-striped">
							<thead>
								<tr>	
									<th>제목</th>
									<th>작성자</th>
									<th>추천수</th>
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
								conn1 = DriverManager.getConnection(url, user, pwd);
							
								String query = "select * from post where post_available = 1 and liked >= 1 order by liked desc";
								pstmt1 = conn1.prepareStatement(query);
								rs1 = pstmt1.executeQuery();
								
								while(rs1.next()){
						%>
							<tbody>
								<tr>
									<td><%= rs1.getString("post_title") %></td>
									<td><%= rs1.getString("user_id") %></td>
									<td><%= rs1.getInt("liked") %></td>
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
		<div class="col-sm-6 text-center" style="margin:0 auto;">
			<h3 style="text-align:center;" class="text-info">인기 여행지</h3>
					<div class="border" stlye="width: 600px; height:800px;">
							<table class="table table-striped" >
								<thead>
									<tr>	
										<th>여행지</th>
										<th>선택 횟수</th>
									</tr>
								</thead>
								<tbody>
							<%
								Connection conn2 = null;
								PreparedStatement pstmt2 = null;
								ResultSet rs2 = null;
								
								try {
									String url = "jdbc:mysql://localhost:3306/project";
									String user = "root";
									String pwd = "1234";
									Class.forName("com.mysql.jdbc.Driver");
									conn2 = DriverManager.getConnection(url, user, pwd);
								
									String query1 = "select * from tourism where cnt>=1 order by cnt desc";
									pstmt2 = conn2.prepareStatement(query1);
									rs2 = pstmt2.executeQuery();
									
									while(rs2.next()){
							%>
									<tr>
										<td><%= rs2.getString("name") %></td>
										<td><%= rs2.getInt("cnt") %></td>
									</tr>
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
							</tbody>
							</table>
					</div>
				<h3 style="text-align:center;" class="text-info">인기 음식점</h3>
					<div class="border" stlye="width: 600px; height:800px;">
							<table class="table table-striped">
								<thead>
									<tr>	
										<th>음식점</th>
										<th>선택 횟수</th>
									</tr>
								</thead>
								<tbody>
							<%
								Connection conn3 = null;
								PreparedStatement pstmt3 = null;
								ResultSet rs3 = null;
								
								try {
									String url = "jdbc:mysql://localhost:3306/project";
									String user = "root";
									String pwd = "1234";
									Class.forName("com.mysql.jdbc.Driver");
									conn3 = DriverManager.getConnection(url, user, pwd);
								
									String query2 = "select * from restaurant where cnt>=1 order by cnt desc";
									pstmt3 = conn3.prepareStatement(query2);
									rs3 = pstmt3.executeQuery();
									
									while(rs3.next()){
							%>
									<tr>
										<td><%= rs3.getString("name") %></td>
										<td><%= rs3.getInt("cnt") %></td>
									</tr>
							<%					
									}
									
								} catch(Exception e) {
									e.printStackTrace();
								}finally{
									if(rs3 != null)
										rs3.close();
									if(pstmt3 != null)
										pstmt3.close();
									if(conn3 != null)
										conn3.close();
								}
							%>
							</tbody>
							</table>
					</div>
		</div>
	</div>	
	</div>
</body>
</html>




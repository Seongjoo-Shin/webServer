<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="rank.Rank" %>
<%@ page import="rank.RankDAO %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시판 글쓰기</title>

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
	
	<div class="container">
		<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
			<form class="form-control" method="post" action="post_write_process.jsp">
			
							<td><input type="text" class="form-control" placeholder="글 제목" name="post_title" id="post_title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="post_content" maxlength="1024" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" style="float:right" value="등록">
			</form>
		</div><br><br>
		
		<div>
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
	</div>
</body>
</html>


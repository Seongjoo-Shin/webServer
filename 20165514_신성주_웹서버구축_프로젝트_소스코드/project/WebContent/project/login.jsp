<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<div class="container">
	<h1 class="text-primary text-center" style="margin:5% auto;"><strong>춘천 여행</strong></h1>
		<div class="col-sm-6" style="margin:15% auto;">
		<h3 class="text-center text-primary">로그인</h3>
		<form method="post" action="login_process.jsp">
			<p class="text-primary">아이디<input type="text" name="user_id" class="form-control" placeholder="아이디"></p>
			<p class="text-primary">비밀번호<input type="password" name="user_pwd" class="form-control" placeholder="비밀번호"></p>
			<p><input type="submit" class="btn btn-primary" value="로그인"></p>
			<p><a href="register.jsp" class="btn btn-primary">회원가입</a>
		</form>
		</div>
	</div>
</body>
</html>
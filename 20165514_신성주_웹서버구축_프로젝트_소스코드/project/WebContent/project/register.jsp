<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<div class="container" style="margin:5% auto;">
	<h3 class="text-center">회원가입</h5>
		<form method="post" action="register_process.jsp">
			<p>아이디<input type="text" name="user_id" class="form-control"></p>
			<p>비밀번호<input type="password" name="user_pwd" class="form-control"></p>
			<p>비밀번호 확인<input type="password" name="user_pwd_check" class="form-control"></p>
			<p>닉네임<input type="text" name="user_nick" class="form-control"></p>				
			<p>도시
				<select name="user_city" class="form-control">
					<option value="ChunCheon" selected>춘천</option>
					<option value="Seoul">서울</option>
					<option value="Others">기타</option>
				</select>			
			</p>
			<p><input type="submit" name="signin" value="회원가입" class="btn btn-primary"></p>
		</form>
	</div>

</body>
</html>
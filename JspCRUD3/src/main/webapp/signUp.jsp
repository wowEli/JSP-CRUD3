<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

<style type="text/css">
input {
	width: 500px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: #2ac1bc;
	color: white;
}
select {
	width: 250px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: #2ac1bc;
	color: white;
}
a{
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding: 5px;
  padding-left: 15px;
  padding-right: 15px;
  background-color: #2ac1bc;
  color: white;
  text-decoration:none
}
</style>
</head>
<body>


	<div style="border: 4px solid #2ac1bc; text-align: center">
		<h1>회원 가입</h1>
		<form action="controller.jsp?action=signUp" method="post">

			<p>아이디</p>
			<input type="text" name="mid" required>
			<p>비밀번호</p>
			<input type="text" name="mpw" required>
			<p>이름</p>
			<input type="text" name="mname" required>
			<p>계정권한</p>
			<select name="role">
					<option selected>MEMBER</option>
					<option>ADMIN</option>
				</select><br><br>
				
			 <input type="submit" value="회원가입하기" style="cursor: pointer; width: 130px"><br>
			<br>
			<a href="controller.jsp?action=main">메인으로 돌아가기</a><br><br>

		</form>

	</div>
</body>
</html>
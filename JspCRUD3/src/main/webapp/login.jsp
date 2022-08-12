<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style type="text/css">
input{
  width: 400px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: #2ac1bc;
  color: white;
}
</style>
</head>
<body>

<div style="border: 4px solid #2ac1bc; text-align: center">

<h1>로그인</h1>
<form action="controller.jsp" method="post">
<input type="hidden" name="action" value="login">

아이디&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="mid" placeholder="아이디 입력" required /><br><br>
비밀번호&nbsp;<input type="password" name="mpw" placeholder="비밀번호 입력" required /><br><br>
<input type="submit" value="로그인" style="cursor: pointer;width: 130px">
<a href="signUp.jsp" style="color:#2ac1bc; text-decoration:none">회원가입</a><br><br>
</form>

</div>


</body>
</html>
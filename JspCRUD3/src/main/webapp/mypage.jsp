<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <jsp:useBean id="mdata" class="model.vo.MemberVO" scope="request" />
<jsp:useBean id="member" class="model.vo.MemberVO" scope="session" /> 
EL식을 이용해 내장객체에 바로접근 가능해서 불필요 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style type="text/css">
	input {
	width: 500px;
	height: 32px;
	font-size: 20px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: #2ac1bc;
	color: white;
}
a{
  width: 500px;
  height: 32px;
  font-size: 18px;
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
<script type="text/javascript">
	function check(){
		ans=prompt('회원탈퇴를 원하시면 비밀번호를 입력하세요.');
		if(ans=='${member.getMpw()}'){
			location.href="controller.jsp?action=mdelete&mid=${member.getMid()}&mpw=${member.getMpw()}";
		}
	}
</script>

<div style="border:4px solid #2ac1bc; text-align: center">
<form action="controller.jsp?action=mupdate" method="post">
			<h1>마이 페이지</h1>
			<p>아이디</p>
			<input type="text" name="mid" value="${mdata.getMid()}" readonly>
			<p>비밀번호</p>
			<input type="password" name="mpw" value="${mdata.getMpw()}" required>
			<p>이름</p>
			<input type="text" name="mname" value="${mdata.getMname()}" required>
			<p>계정권한</p>
			<input type="text" value="${mdata.getRole()}" readonly><br><br>
			<input type="submit" value="회원정보 변경하기" style="cursor: pointer; width: 180px"><br><br>
</form>

<a href="controller.jsp?action=main">메인으로 돌아가기</a><br><br>
<a href="controller.jsp?action=logout">로그아웃</a><br><br>
<a href="javascript:check()">회원탈퇴</a><br><br>

</div>
</body>
</html>
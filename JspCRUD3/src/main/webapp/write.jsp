<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="member" class="model.vo.MemberVO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성페이지</title>
<style type="text/css">
.mint{
  border: 0;
  border-radius: 15px;
  outline: none;
  padding: 5px;
  background-color: #2ac1bc;
  color: white;
  text-decoration:none
}
a{
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
input {
	width: 500px;
	height: 32px;
	font-size: 20px;
	border: 0;
	outline: none;
	padding-left: 10px;
	background-color: #2ac1bc;
	color: white;
}
table {
    margin-left:auto; 
    margin-right:auto;
    width: 100%;
    border-collapse: collapse;
}
th, td {
	border:1px solid #2ac1bc;
	font-size: 20px;
	text-align: center;
  }
</style>
</head>
<body>
<div style="border:4px solid #2ac1bc; text-align: center">
<br>

<form action="controller.jsp" method="post"><!-- controller.jsp?action=insert 요청이 url로 나와 잘 쓰지않음-->

	<input type="hidden" name="action" value="binsert"> <!-- 히든을 사용해서 아무도 모르게 값 넘겨주기 -->
	<!-- 이 hidden을 통해 이제 마음껏 무슨 메서드 사용할건지 전달 가능 -->
			<p>제 목</p>
			<input type="text" name="title" required>
			<p>내 용</p>
			<input type="text" name="content" required>
			<p>작성자</p>
			<input type="text" name="writer" value="${member.getMid()}" readonly required><br><br>
			<input type="submit" value="글 작성하기" style="width:150px">
	</form>

<br><br>
<a href="controller.jsp?action=main">메인으로 돌아가기</a><br><br>
</div>
</body>
</html>
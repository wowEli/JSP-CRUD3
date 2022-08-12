<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <jsp:useBean id="data" class="model.vo.BoardVO" scope="request" /> EL식을 이용해 내장객체에 바로접근 가능해서 불필요-->
<jsp:useBean id="member" class="model.vo.MemberVO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<style type="text/css">
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
</style>

</head>
<body>

<script type="text/javascript">
	function del(){
		ans=confirm('정말 삭제할까요?');
		if(ans==true){
			document.bForm.action.value="bdelete";
			document.bForm.submit();
		}
		else{
			return;
		}
	}
</script>
<div style="border:4px solid #2ac1bc; text-align: center">

<form name="bForm" action="controller.jsp" method="post">
	<input type="hidden" name="action" value="bupdate">
	<input type="hidden" name="bid" value="${data.bid}">
	<p>제 목</p>
	<input type="text" name="title" value="${data.title}" required>
	<p>내 용</p>
	<input type="text" name="content" value="${data.content}" required>
	<p>작성자</p>
	<input type="text" name="writer" value="${data.writer}" required readonly>
	<p>작성 일</p>
	<input type="text" name="writeDay" value="${data.writeday}" required readonly><br><br>
	
	
	<%
		if(member.getMid() != null &&(member.getRole().equals("ADMIN") || member.getMid().equals(data.getWriter()))){
	%>
		<input type="submit" value="변경하기" style="width:110px;cursor:pointer">&nbsp;<input type="button" value="삭제하기" onClick="del()" style="width:110px;cursor:pointer">
	<%
		}
	%> 
		
</form>
<br><br>
<a href="controller.jsp?action=main">메인으로 돌아가기</a><br><br>
</div>
</body>
</html>
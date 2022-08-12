<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.vo.BoardVO , java.util.ArrayList" %>
     <%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request"/> <!-- 컨트롤러가 request의 저장했으니 스코프 request로 설정 -->
<jsp:useBean id="member" class="model.vo.MemberVO" scope="session"/>
<!-- EL식을 이용해 useBean을 사용 안해도 되지만 자바로직에서 사용하기 위해 useBean을 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style type="text/css">
.mint{
  width: 500px;
  height: 32px;
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
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: #2ac1bc;
	color: white;
}
select {
	width: 100px;
	height: 32px;
	font-size: 20px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: #2ac1bc;
	color: white;
	text-align:center;
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
  }
  
</style>
</head>
<body>

<script type="text/javascript">
	function check(){
		ans=prompt('비밀번호를 입력하세요.');
		if(ans=='${member.mpw}'){ // session 단위에 저장된 member를 EL식을 통해 바로 접근
			location.href="controller.jsp?action=mypage";
		}
	}
</script>

<div style="border:4px solid #2ac1bc; text-align: center">
<%
	if(member.getMid()==null){ // 자바 로직을 사용하는 공간이기 때문에 EL식을 사용할 수 없다
%>
<h1><a href="login.jsp" class="mint">로그인</a>&nbsp;&nbsp;&nbsp;<a href="signUp.jsp" class="mint">회원가입</a></h1>

<%
	}else{
%>
<h1><a href="javascript:check()" class="mint">${member.mname}님! 반갑습니다! :D</a></h1> <!-- EL식을 사용해 접근 -->
<%
	}
%>
<hr><br>
<!-- 검색하기 -->
<form action="controller.jsp" method="post">
	<input type="hidden" name="action" value="main">
	<select name="searchCondition">
		<option value="title">제 목</option>
		<option value="writer">작성자</option>
	</select>
	<input type="text" name="searchContent" placeholder="검색어를 입력해주세요">
	<input type="submit" value="검색하기" style="width: 90px; cursor:pointer">
<%
	if(member.getMid()!=null){ // 로그인 시에만 등장
%>
	<a href="write.jsp" class="mint" style="font-size:20px">글쓰기</a>
<%
	}
%>
</form>
<br>

<!-- 게시글 목록 -->
<table>
	<tr style="border-bottom:4px solid #2ac1bc">
		<th>번 호</th><th>제 목</th><th>작성자</th>
	</tr>
<%
	for(BoardVO v:(ArrayList<BoardVO>)datas){ 
		// bDAO.selectAll(bVO) 를 뷰단에서는 사용하지 않음
%>
	<tr><!-- v는 자바단에서 만든 Board 타입의 객체이므로 EL식으로 접근이 불가능하다 -->
		<th><a href="controller.jsp?action=board&bid=<%=v.getBid()%>" style="text-decoration:none; color: black"><%=v.getBid()%></a></th>
		<th><%=v.getTitle()%></th>
		<th><%=v.getWriter()%></th>
	</tr>
<%
	}
%>
</table>

<br><br>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error/error.jsp" import="java.util.ArrayList , model.vo.BoardVO , model.vo.MemberVO"%>
    <!-- 에러 페이지도 등록 -->
    <%request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="bDAO" class="model.dao.BoardDAO"></jsp:useBean>
    <jsp:useBean id="bVO" class="model.vo.BoardVO"></jsp:useBean>
    <jsp:useBean id="mDAO" class="model.dao.MemberDAO"></jsp:useBean>
    <jsp:useBean id="mVO" class="model.vo.MemberVO"></jsp:useBean>
    <jsp:setProperty property="*" name="bVO"/>
    <jsp:setProperty property="*" name="mVO"/>

<%
	String action = request.getParameter("action"); // 어떤 요청을 받았는지 파악
	System.out.println("로그: "+action);
	
	if(action.equals("login")){ // 로그인
		if(mDAO.selectOne(mVO)==null){ // 아이디 비밀번호중 하나라도 틀리면 null값이 리턴됨
			out.println("<script> alert('로그인에 실패했습니다.');location.href='login.jsp'</script>");
		}
		else{
			session.setAttribute("member", mDAO.selectOne(mVO)); // session에 member라는 이름으로 저장
			out.println("<script> alert('로그인에 성공했습니다.');location.href='index.jsp'</script>");
		}
	}
	
	else if(action.equals("logout")){ // 로그아웃
		session.invalidate(); // 세션에 정보 삭제
		response.sendRedirect("login.jsp"); // 로그인 페이지로 이동
	}
	
	
	else if(action.equals("signUp")){ // 회원가입
	
		if(mDAO.selectOne(mVO) == null){ // 데이터베이스에 같은 아이디가 없으면 회원가입 진행
			if(mDAO.insert(mVO)){
				response.sendRedirect("login.jsp");
			}
			else{
				throw new Exception("signUp 오류");
			}
		}
		else { // null이 아니라는 소리는 데이터 베이스에 값이 있다는 것이므로 회원가입 실패
			out.println("<script> alert('아이디가 중복되어 회원가입이 실패했습니다.');location.href='signUp.jsp'</script>");
		}
		
	}
	
	else if(action.equals("mypage")){ // session 단위에서 request단위로 저장 후 마이페이지로 이동
		// 이유는 모든 정보를 갖고다니면 보안에 취약 , 데이터 무거워짐 속도 저하 , 마이페이지 만드는 사람은 session인지 모름
		MemberVO member = (MemberVO)session.getAttribute("member");
		request.setAttribute("mdata", member); // reauest단위로 저장
		pageContext.forward("mypage.jsp");
	}
	
	else if(action.equals("main")){ // 메인으로
		request.setAttribute("datas", bDAO.selectAll(bVO)); // 페이지 단위 request에 속성추가하면서 정보 추가
		pageContext.forward("main.jsp"); // 정보를 전달해야 되기 때문에 forword 사용
		// pageContext == jsp 명령어를 쓰는 자바의 내장객체
	}
	
	else if(action.equals("binsert")){ // 글쓰기
		if(bDAO.insert(bVO)){
			response.sendRedirect("controller.jsp?action=main");
		}
		else{
			throw new Exception("binsert 오류");
		}
	}

	else if(action.equals("board")){ // 상세페이지
		BoardVO data=bDAO.selectOne(bVO); // bid값으로 selecOne 하기
		if(data==null){ // 만약 리턴이 null이면 -> 악의적인 접근 차단
			response.sendRedirect("controller.jsp?action=main"); // 메인으로 돌아가기
		}
		else{
			request.setAttribute("data", data);
			pageContext.forward("board.jsp");
		}

	}
	
	else if(action.equals("mdelete")){
		System.out.println("로그 회원삭제"+mVO.getMid()+mVO.getMpw());
		if(mDAO.delete(mVO)){ // 회원 탈퇴를 한 후
		session.invalidate(); // 세션에 남아있는 정보를 삭제
		response.sendRedirect("index.jsp"); // 다시 인덱스 페이지로 이동
		
		}
		else{
			throw new Exception("mdelete 오류");
		}
	}
	
	else if(action.equals("bdelete")){
		if(bDAO.delete(bVO)){ // 글 삭제 후 
			
		response.sendRedirect("index.jsp"); // 다시 인덱스 페이지로 이동
		
		}
		else{
			throw new Exception("bdelete 오류");
		}
	}
	
	else if(action.equals("mupdate")){ // 회원정보수정
		if(mDAO.update(mVO)){
			session.setAttribute("member", mDAO.selectOne(mVO)); // 회원정보 수정 후 새 정보를 session에 저장
			pageContext.forward("controller.jsp?action=main");
		}
		else{
			throw new Exception("mupdate 오류");
		}
	}
	
	else if(action.equals("bupdate")){ // 게시글 수정
		if(bDAO.update(bVO)){
			pageContext.forward("controller.jsp?action=board&bid="+bVO.getBid());
		}
		else{
			throw new Exception("bupdate 오류");
		}
	}
	
	else{
		out.println("<script> alert('action 파라미터 값이 올바르지 않습니다');location.href='controller.jsp?action=main'</script>");
	}
%>
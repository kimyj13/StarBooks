<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mem_header.jsp" %>

<section id="loginWrap">

	<form id="loginForm">
		<p><input type="text" name="userid" placeholder="아이디(ID)"></p>
		<p><input type="password" name="userpw" placeholder="비밀번호" style="margin-top : 0; border-bottom : none; border-top : none;"></p>
		<p style="width : 400px;height : 45px; line-height : 45px; border : 1px solid #d6deeb; background-color : #f7fbff;  color :#303538;  padding-left:10px;">
			<input type="checkbox" id="idCookie" value="로그인상태유지" style="width : 17px;height : 17px;">
			<label for="idCheck" style="font-size : 14px;">로그인상태유지</label>
			
			<a href="${cpath }/member/findid"  style="margin-left : 80px; font-size : 13px;">아이디 찾기</a> | 
			<a href="${cpath }/member/newpw"  style="font-size : 13px;">비밀번호 재설정</a>
		</p>
		<p><input type="submit" value="로그인"></p>
		<p><button>회원가입</button></p>
	</form>
</section>
</body>
</html>
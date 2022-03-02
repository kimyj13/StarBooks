<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<section id="mystarWRap" class="clearfix">
<%@ include file="../order/leftwrap.jsp" %>
   <div class="rightWrap" id="modify">
   <h2>정보변경</h2>
   <table>
   <tbody>
   	<tr>
   		<th>이름</th>
   		<td>${dto.user_name } 
   			<button onclick="location.href='${cpath }/member/delete'">회원탈퇴</button>
   		</td>
   	</tr>
   	<tr>
   		<th>아이디</th>
   		<td>${dto.user_id }</td>
   	</tr>
   	<tr>
   		<th>이메일</th>
   		<td>${dto.user_email }</td>
   	</tr>
   	<tr>
   		<th>비밀번호변경</th>
   		<td>
   			<form method="post" id="changePW">
   				<p><input type="hidden" name="user_id" value="${login.user_id }"></p>
   				<p><input type="password" name="old_pw" onkeyup="oldPwCheck(this.value)"><output class="old_pw"></output></p>
   				<p><input type="password" name="user_pw" onkeyup="pwCheck(this.value)"><output class="user_pw"></output></p>
   				<p><input type="password" name="user_pw2" onkeyup="pwCheck2(this.value)"><output class="user_pw2"></output></p>
   				<p><input type="submit" value="비밀번호변경"></p>
   			</form>
   		</td>
   	</tr>
   	<tr>
   		<th>성별</th>
   		<td>${dto.user_gender }</td>
   	</tr>
   	<tr>
   		<th>마케팅 정보 수신 관리</th><td></td></tr>
   	</tbody>
   </table>
   </div>
 </section>
 
 <script type="text/javascript">
 	let opFlag = false;
 	let upFlag = false;
	const old_pw=  document.querySelector('input[name="old_pw"]');
	const id = '${login.user_id}';
	const msg = document.querySelector('.old_pw');
	
	function oldPwCheck(oldpw){
		console.log(oldpw);
		const url='${cpath}/member/modify/pwCheck';
		console.log(url);
		const opt = {
			method : 'POST',
			body : JSON.stringify({oldpw : oldpw, id : id}),
			headers : {
				'Content-Type' : 'application/json'
			}
		}
		fetch(url, opt)
		.then(resp=>resp.text())
		.then(text=>{
			msg.value = text;
			const flag = text == 'OK';
			flag ? msg.style.color = 'green': msg.style.color='red';
			flag ? old_pw.style.borderColor = 'green': old_pw.style.borderColor = 'red';
			if(flag == true){	
				msg.style.color = 'green';
				opFlag = true;
			}else{
				opFlag = false;
			}
	});
	}
	
	let test1 = /[0-9]/;
	let test2 = /[A-Za-z]/;
	let test3 = /[\{\}\[\]\/?.,;:|\(\)~!@#$%^&*\\\=\'\"]/;	
	const inputPw = document.querySelector('input[name="user_pw"]');
	function pwCheck(pw){	
		const msg = document.querySelector('.user_pw');
		if(!test1.test(pw) || !test2.test(pw) || !test3.test(pw) || !(pw.length >= 8 && pw.length <= 15)){
			msg.value = "8~15자. 영문,숫자,특수문자를 조합해주세요.";
			msg.style.color = 'red';
		}else{
			msg.value = "";
			inputPw.style.borderColor = 'green';
		}
	}
	
	const inputPw2 = document.querySelector('input[name="user_pw2"]');
	function pwCheck2(pw2) {
		const pw = inputPw.value;
		const msg = document.querySelector('.user_pw2');
		if(pw != pw2){
			msg.value = "비밀번호가 일치하지 않습니다.";
			inputPw2.style.borderColor = 'red';
			msg.style.color = 'red';
			upFlag = false;
		}else{
			msg.value = "";
			inputPw2.style.borderColor = 'green';
			upFlag = true;
		}
	}
	

	const chngePwForm = document.getElementById('changePW');
	chngePwForm.onsubmit = function(e){
		e.preventDefault();
		if(opFlag && (inputPw.value==inputPw2.value)){
			//const user_pw = document.querySelector('input[name="user_pw"]');
			chngePwForm.submit();
		}
	}
	
</script>  
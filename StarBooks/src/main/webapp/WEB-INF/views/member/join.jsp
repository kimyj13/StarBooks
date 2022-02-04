<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mem_header.jsp" %>

<section id="joinWrap">
	<form id="joinForm">
		<p>
			<span class="offfocus"></span>
			<input type="text" name="userid" placeholder="아이디(ID)">
			<output class="idCheck"></output>
		</p>
		<p>
			<span class="offfocus"></span>
			<input type="password" name="userpw" placeholder="비밀번호" onkeyup="pwCheck(this.value)">
			<output class="pwCheck"></output>
		</p>
		<p>
		    <span class="offfocus" style="top : 0;">비밀번호 재입력</span>
			<input type="password" name="userpw2" placeholder="비밀번호 재입력"  style="margin-top:-1px;" onkeyup="pwCheck2(this.value)">
			<output class="pwCheck2"></output>
		</p>
		<p>
		    <span class="offfocus">이름 입력</span>
			<input type="text" name="username" placeholder="이름">
		</p>
		<p>
		    <span class="offfocus"></span>
			<input type="text" name="useremail" placeholder="이메일 주소" onkeyup="emailCheck(this.value)">
			<output class="emailCheck"></output>
		</p>
		<div class="clearfix" style="height : 70px;">
		<p style="float : left">
			<span class="offfocus"></span>
			<input type="text" name="userbirth" placeholder="생년월일" style="width : 240px;" onkeyup="birthCheck(this.value)">
			<output class="birthCheck"></output>
		</p>
		<div class="button-wrap clearfix">
			<input class="hidden radio-label" id="female-button" type="radio" name="usergender" checked="checked">
    		<label class="button-label" for="female-button">
      			<h4>여자</h4>
    		</label>
    		<input class="hidden radio-label" id="malebutton" type="radio" name="usergender">
    		<label class="button-label" for="malebutton">
      			<h4>남자</h4>
    		</label>
    		</div>
		</div>
		<div style ="width : 400px; margin : 10px 0; height : 200px; background-color:white; border : 1px solid rgb(214, 222, 235);">
			<h2>이용약관</h2>
		</div>
		<p><input type="submit" value="회원가입"></p>
	</form>
</section>
<script>
let check1 = false;
let check2 = false;
let check3 = false;
let emailTest = /[A-Za-z0-9_\.\-]+@[A-z-a-z\-]+\.[A-Za-z\-]/;
let pwTest1 = /[0-9]/;
let pwTest2 = /[A-Za-z]/;
let pwTest3 = /[\{\}\[\]\/?.,;:|\(\)~!@#$%^&*\\\=\'\"]/;
let birthTest = /[0-9]/;

	function pwCheck(pw){
		//console.log(pw)
		const inputPw = document.querySelector('input[name="userpw"]');
		if(!pwTest1.test(pw) || !pwTest2.test(pw) || !pwTest3.test(pw) || !(pw.length >= 8 && pw.length <= 15)){
			document.querySelector('.pwCheck2').value = "8~15자리, 영문/숫자/특수문자를 조합해주세요.";
			inputPw.setAttribute('class', 'nocheck');
		}else{
			document.querySelector('.pwCheck2').value = "";
			inputPw.setAttribute('class','check');	
			check1 = true;
		}
	}
	
	function pwCheck2(pw2) {
		const pw = document.querySelector('input[name="userpw"]').value;
		const inputPw2 = document.querySelector('input[name="userpw2"]')
		// console.log(pw);
		if(check1){
			if(pw != pw2){
				document.querySelector('.pwCheck2').value = "비밀번호가 일치하지 않습니다.";
				inputPw2.setAttribute('class', 'nocheck')
			}else{
				document.querySelector('.pwCheck2').value = "";		
				inputPw2.setAttribute('class','check');		
			}
		}
	}
	
	function emailCheck(email){
		const inputEmail = document.querySelector('input[name="useremail"]');
		if(!emailTest.test(email)){
			document.querySelector('.emailCheck').value = "올바른 이메일 형식이 아닙니다.";
			inputEmail.setAttribute('class', 'nocheck');
		}else{
			document.querySelector('.emailCheck').value = "";
			inputEmail.setAttribute('class','check');		
		}
	}
	
	function birthCheck(birth){
		const inputBirth = document.querySelector('input[name="userbirth"]');
		console.log(birth.length)
		if(!birthTest.test(birth) || (birth.length != 8)){
			document.querySelector('.birthCheck').value = "생년월일을 8자리 숫자로만 입력하세요(19900101)";
			inputBirth.classList.add('nocheck');
		}else{
			document.querySelector('.birthCheck').value = "";
			inputBirth.classList.remove('nocheck');
			inputBirth.classList.add('check');		
		}
	}
</script>
<script type="text/javascript">
	const input = document.querySelectorAll('input');
	input.forEach(input=>input.onfocus=function(e){
		const target = e.target;
        target.placeholder='';
        console.log(target.name)
        const span = target.previousElementSibling;
        span.classList.remove('offfocus');
        span.classList.add('onfocus');
        switch(target.name){
            case 'userid' : span.innerText='아이디 : 5~20자 영문,숫자조합';break;
            case 'userpw' : span.innerText = '비밀번호 : 8~20자 영문,숫자,특수문자 조합';break;
            case 'userbirth' : span.innerText = '생년월일(예: 19900101)';break;
            case 'useremail':span.innerText = 'E-Mail (예:starbooks@naver.com)';break;
        }
            
	});
    
    input.forEach(input=>input.onblur=function(e){
        const target = e.target;
        const span = target.previousElementSibling;
        
        if(target.value.length == 0){
            span.classList.remove('onfocus');
            span.classList.add('offfocus');

            switch(target.name){
                case 'userid' : target.placeholder='아이디(ID)'; break;
                case 'userpw' : target.placeholder='비밀번호'; break;
                case 'userpw2' :target.placeholder='비밀번호 재입력'; break;
                case 'username' : target.placeholder = '이름'; break;
                case 'useremail' : target.placeholder = '이메일 주소'; break;
                case 'userbirth' : target.placeholder='비밀번호 재입력'; break;
                case 'useremail' :target.placeholder='생년월일'; break;
            }   
        }
    });
</script> 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타북스</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="${cpath }/resources/css/index.css">
<link rel="stylesheet" href="${cpath }/resources/css/order.css">
<link rel="stylesheet" href="${cpath }/resources/css/books.css">
<link rel="stylesheet" href="${cpath }/resources/css/category.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<!-- <!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
 
<!-- Slick 불러오기 -->
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
    <header id="header">
       <div class="header-top clearfix">
            <div style="width : 200px; padding-left: 30px;"><h1 id="logo">STARBOOKS</h1></div>
            <div id="searchWrap">
                <form id="search">
                   <p>
                    <input type="text" name="search" placeholder="제목, 저자, 출판사 검색">
                    <input type="submit" value="검색">
                    </p>
                </form>
            </div>
            <div class="mem-btn clearfix">
            	<c:if test="${empty login }">
                	<button onclick="location.href='${cpath}/member/join'">회원가입</button>
                	<button onclick="location.href='${cpath}/member/login'">로그인</button>
                </c:if> 
                <c:if test="${not empty login }">
                	 <button onclick="location.href='${cpath}/order/cash'">캐시충전</button>
                	<button onclick="location.href='${cpath}/member/mybooks'">내서재</button>
                </c:if>
        </div>
        </div>
        <div class="header-bottom">
            <nav id="menu">
                <ul class="clearfix">
                    <li class="homeli">
                    	<a href="${cpath }/"  class="home"> 홈<span></span></a>
                    </li>
                    <li><a href="" class="alarm"> 알림<span></span></a></li>
                    <li>
                    	<a href="${cpath }/order/cart" class="cart"> 카트<span></span></a>
                    </li>
                    <li>
                    	<a href="${cpath}/member/mystar" class="mystar"> 마이스타<span></span></a>
                    </li>
                </ul>
            </nav>
        </div>
       <ul style="width : 100%; height : 41px; background : white; border-bottom : 1px solid lightgray;">
	        <li>
	        	<ul class="sub-menu clearfix">
	           		<li><a href="${cpath }/books/list"><i class="xi-bars xi-x"></i></a></li>
	                <li><a href="">일반</a></li>
	                <li><a href="">소설</a></li>
	                <li><a href="">만화</a></li>
	                <li><a href="">웹툰</a></li>
	          	</ul>
	          </li>
          </ul>
    </header>
    <script>
    	const clickPath = document.location.href;
    	const clickArr = clickPath.split('/');
    	let aClick;
    	if(clickArr[clickArr.length-1] == ""){
    		aClick = document.querySelector('.home')
    	}else{
    		aClick = document.querySelector('.'+ clickArr[clickArr.length-1]);	
    	}
    	if(aClick != null){ 		
    		aClick.classList.add('click'); 
    	}
    </script>
    <script type="text/javascript">
    const clickA = document.querySelectorAll('#menu > ul > li > a');
    clickA.forEach(clickA=>clickA.onclick=function(e){
    	e.preventDefault();
    	
    	const prevA = document.querySelector('.click');
    	console.log(e.target.href);
    	if(prevA != null){    		
    		prevA.classList.remove('click');
    	}
		e.target.classList.add('click');
		
    	location.href = e.target.href;

    });
    
    </script>
    
    <script type="text/javascript">
    const h1 = document.querySelector('h1');
    h1.onclick=function(){
    	location.href='${cpath}/';
    }
    </script>
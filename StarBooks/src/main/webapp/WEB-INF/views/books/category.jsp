<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section id="categoryWrap" class="clearfix">
<%@ include file="leftCategory.jsp" %>
	<article class="right-content">
		<div class="contentWrap">
			<h2>${category } 전체</h2>
			<div class="tab-category">
				<ul class="clearfix">
					<li class="tm on" title="1">홈</li>
					<li class="tm" title="2">전체</li>
					<li class="tm" title="3">신간</li>
					<li class="tm" title="4">베스트셀러</li>
					<li class="tm" title="5">무료책</li>
				</ul>
			</div>
			<div class="tab-content">
				<div class="cont1 view">
					<div style="margin-bottom : 50px;">
						<div class="sub-category clearfix">
							<h2>${category } 인기 신간</h2>
							<div class="btn-wrap">
								<button style="display: inline-block; border-radius: 5px">전체보기 &nbsp; <span style="font-size: 10px;letter-spacing: -2px;">>></span></button>
							</div>
						</div>
						<div class="book-grid" style="display : grid; grid : repeat(2, 50%)/auto-flow 20%;grid-row-gap: 10px;">
							<c:forEach var="book" begin="1" end="10" items="${list }" >
								<div style=" width : 150px; height : 200px; margin : 0 auto; border : 1px dashed coral">
									<img src="${book.image}" style="height: 200px;width: 150px;">
								</div>
							</c:forEach>
						</div>
					</div>
					
					<div style="margin-bottom : 50px;">
						<div class="sub-category clearfix" >
							<h2 style="display: inline-block;">${category } 베스트셀러</h2>
							<div class="btn-wrap">
								<button style="display: inline-block; border-radius: 5px">전체보기 &nbsp; <span style="font-size: 10px;letter-spacing: -2px;">>></span></button>
							</div>						
						</div>
						<div class="book-grid" style="display : grid; grid : repeat(1, 100%)/auto-flow 20%;">
							<c:forEach var="book" begin="1" end="5" >
								<div style=" width : 150px; height : 200px; margin : 0 auto; border : 1px dashed coral">
									<img style="">
								</div>
							</c:forEach>
						</div>
					</div>
					
					<div>
						<div  class="sub-category clearfix">
							<h2 style="display: inline-block;">${category } 인기 무료책</h2>
							<div class="btn-wrap">
								<button style="display: inline-block; border-radius: 5px">전체보기 &nbsp; <span style="font-size: 10px;letter-spacing: -2px;">>></span></button>
							</div>
							</div>
						<div class="book-grid" style="display : grid; grid : repeat(1, 100%)/auto-flow 20%;">
							<c:forEach var="book" begin="1" end="5" >
								<div style=" width : 150px; height : 200px; margin : 0 auto; border : 1px dashed coral">
									<img style="">
								</div>
							</c:forEach>
						</div>
					</div>	
				</div>
				<div class="cont2">
					<h2>content2</h2>
					<div class="book-grid" style="display : grid; grid : repeat(4, 25%)/auto-flow 20%;grid-row-gap: 10px;">
							<c:forEach var="book" begin="1" end="20" >
								<div style=" width : 150px; height : 250px; margin : 0 auto; border : 1px dashed coral">
									<img style="">
								</div>
							</c:forEach>
						</div>
				</div>
				<div class="cont3">
					<h2>content3</h2>
					<div class="book-grid" style="display : grid; grid : repeat(4, 25%)/auto-flow 20%;grid-row-gap: 10px;">
							<c:forEach var="book" begin="1" end="20" >
								<div style=" width : 150px; height : 250px; margin : 0 auto; border : 1px dashed coral">
									<img style="">
								</div>
							</c:forEach>
						</div>
				</div>
				<div class="cont4">
					<h2>content4</h2>
					<div class="book-grid" style="display : grid; grid : repeat(4, 25%)/auto-flow 20%;grid-row-gap: 10px;">
							<c:forEach var="book" begin="1" end="20" >
								<div style=" width : 150px; height : 250px; margin : 0 auto; border : 1px dashed coral">
									<img style="">
								</div>
							</c:forEach>
						</div>
				</div>
				<div class="cont5">
					<h2>content5</h2>
					<div class="book-grid" style="display : grid; grid : repeat(4, 25%)/auto-flow 20%;grid-row-gap: 10px;">
							<c:forEach var="book" begin="1" end="20" >
								<div style=" width : 150px; height : 250px; margin : 0 auto; border : 1px dashed coral">
									<img style="">
								</div>
							</c:forEach>
						</div>
				</div>
			</div>
		</div>
	</article>
</section>

<script>
	const tabMenu = document.querySelectorAll('.tm');
	
	tabMenu.forEach(tabMenu=>tabMenu.onclick=function(e){
		const tm = document.querySelector('.tab-category > ul > li.on');
		tm.classList.remove('on');
		e.target.classList.add('on');
		const view = document.querySelector('.tab-content > .view');
		const title = e.target.title;
		const tabCont = document.querySelector('.cont'+title);
		view.classList.remove('view');
		tabCont.classList.add('view');
	});
</script>
<%@ include file="../footer.jsp" %>
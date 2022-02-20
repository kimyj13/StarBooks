<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section id="searchWrap">
	<article class="search">
		<h2>'${search }' 도서 검색 결과</h2>
		<div class="search-tab">
			<div class="search-tab-menu">
				<ul class="clearfix">
				<!-- li 불러오기 방식 : 전체는 언제나 1, 그외 분류에서 검색어가 많은 경우 순으로 배치하기
					sql할때 그룹으로 해서 조회하면 될듯.....
				 -->
					<li class="stm on" title="0">전체</li>
					<!-- 여기부터는 forEach로 처리하면 될듯 -->
					<c:forEach var="i" begin="1" end="8" step="1">					
						<li class="stm" title="${i }">제목 ${i }</li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="search-tab-content">
				<c:forEach var="i" begin="0" end="8">
					<div class="stCont${i } ${i == 0 ? 'view' : '' }">
						<h2>목록 ${i }</h2>
						<ul>
						<c:forEach var="j" begin="0" end="15" items="${bookjson }">
							<li>
								<div class="clearfix">
									<img src="${j.image }">
									<div>
									<h4>${j.title }</h4>
									<p>작가 : ${j.author} || 출판사 : OOO || 출판일자 : ${j.pubdate }</p>
									<p> 
										${j.description } 
									</p>
									</div>
								</div>
							</li>
						</c:forEach>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="paging">
			<h2> << 페이징을 처리해보자 >> </h2>
		</div>
	</article>
</section>

<script type="text/javascript">
/* const bks= "${bookjson}"
const books = JSON.parse(bks);
console.log (books) */
const stabMenu = document.querySelectorAll('.stm');

stabMenu.forEach(stabMenu=>stabMenu.onclick=function(e){
	const stm = document.querySelector('.search-tab-menu > ul > li.on');
	stm.classList.remove('on');
	e.target.classList.add('on');
	const sview = document.querySelector('.search-tab-content > .view');
	const title = e.target.title;
	console.log(title);
	const sCont = document.querySelector('.stCont'+title);
	sview.classList.remove('view');
	sCont.classList.add('view');
});

</script>
<%@ include file="footer.jsp" %>
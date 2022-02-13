<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<article class="left-category">
	<nav>
		<ul class="category-menu">
				<li class="main-category"><a href="">소설</a>
					<ul class="sub-category">
						<li><a href="">소설 전체</a></li>
						<li><a href="">한국소설</a></li>
						<li><a href="">영미소설</a></li>
						<li><a href="">일본소설</a></li>
						<li><a href="">중국소설</a></li>
						<li><a href="">북유럽소설</a></li>
						<li><a href="">독일소설</a></li>
						<li><a href="">프랑스소설</a></li>
						<li><a href="" >기타국가소설</a></li>
					</ul>
				</li>
				<li class="main-category"><a href="">경영/경제</a>
					<ul class="sub-category" >
						<li><a href="">경영/경제 전체</a></li>
						<li><a href="">경영일반</a></li>
						<li><a href="">경제일반</a></li>
						<li><a href="">마케팅/세일즈</a></li>
						<li><a href="">재테크/금융/부동산</a></li>
						<li><a href="">CEO/리더십</a></li>
					</ul>
				</li>
				<li class="main-category"><a href="">인문/사회/역사</a>
					<ul class="sub-category" >
						<li><a href="">인문/사회/역사 전체</a></li>
						<li><a href="">인문</a></li>
						<li><a href="">정치/사회</a></li>
						<li><a href="">예술/문화</a></li>
						<li><a href="">역사</a></li>
					</ul>
				</li>
				<li class="main-category"><a href="">자기계발</a>
					<ul class="sub-category" >
						<li><a href="">자기계발 전체</a></li>
						<li><a href="">성공/삶의자세</a></li>
						<li><a href="">기획/창의/리더십</a></li>
						<li><a href="">설득/화술/협상</a></li>
						<li><a href="">취업/창업</a></li>
						<li><a href="">인간관계</a></li>
					</ul>
				</li>
				
				<li class="main-category"><a href="">외국어</a>
					<ul class="sub-category" >
						<li><a href="">외국어 전체</a></li>
						<li><a href="">비즈니스영어</a></li>
						<li><a href="">일반영어</a></li>
						<li><a href="">제2외국어</a></li>
						<li><a href="">어학시험</a></li>
					</ul>
				</li>
				<li class="main-category"><a href="">과학</a>
					<ul class="sub-category" >
						<li><a href="">과학 전체</a></li>
						<li><a href="">과학일반</a></li>
						<li><a href="">수학</a></li>
						<li><a href="">자연과학</a></li>
						<li><a href="">응용과학</a></li>
					</ul>
				</li>			
				<li class="main-category"><a href="">컴퓨터/IT</a>
					<ul class="sub-category" >
						<li><a href="">컴퓨터/IT 전체</a></li>
						<li><a href="">IT 비지니스</a></li>
						<li><a href="">개발/프로그래밍</a></li>
						<li><a href="">컴퓨터/앱 활용</a></li>
						<li><a href="">IT자격증</a></li>
						<li><a href="">IT해외원서</a></li>
					</ul>
				</li>
				<li class="main-category"><a href="">에세이/시</a>
					<ul class="sub-category" >
						<li><a href="">에세이/시 전체</a></li>
						<li><a href="">에세이</a></li>
						<li><a href="">시</a></li>
					</ul>
				</li>
				<li class="main-category"><a href="">여행</a>
					<ul class="sub-category" >
						<li><a href="">여행 전체</a></li>
						<li><a href="">국내여행</a></li>
						<li><a href="">해외여행</a></li>
					</ul>
				</li>
				<li class="main-category"><a href="">종교</a>
					<ul class="sub-category" >
						<li><a href="">종교 전체</a></li>
						<li><a href="">종교일반</a></li>
						<li><a href="">가톨릭</a></li>
						<li><a href="">기독교(개신교)</a></li>
						<li><a href="">불교</a></li>
						<li><a href="">기타</a></li>
					</ul>
				</li>
				
			</ul>
	</nav>
	
<script type="text/javascript">
const li = document.querySelectorAll('.main-category');
li.forEach(li=>li.onclick=function(e){
	e.preventDefault();
	const on = document.querySelector('.cateOn');
	if(on != null){		
	on.classList.remove('cateOn');
	}
	e.currentTarget.classList.add('cateOn');
});
</script>
</article>



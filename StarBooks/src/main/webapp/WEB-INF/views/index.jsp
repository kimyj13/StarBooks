<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    


<%@ include file="slider.jsp" %>
    <section id="NewBookSlide">
        <h1 style="width : 70%; margin : 0 auto;">신간도서</h1>
        <article class="new-book-slide">
        		<c:forEach var="i" begin="1" end="20">
        			<div style="width : 180px">Book ${i }</div>
        		</c:forEach>
        </article>
    </section>
    
    <script type="text/javascript">
    $(document).ready(function(){
      $('.new-book-slide').slick({
    		  dots: true,
    		  infinite: true,
    		  speed: 300,
    		  slidesToShow: 5,
    		  slidesToScroll: 5,
    		  responsive: [
    		    {
    		      breakpoint: 1350,
    		      settings: {
    		        slidesToShow: 4,
    		        slidesToScroll: 4,
    		        infinite: true,
    		        dots: true
    		      }
    		    },
    		    {
    		      breakpoint: 1050,
    		      settings: {
    		        slidesToShow: 3,
    		        slidesToScroll: 3
    		      }
    		    },
    		    {
    		      breakpoint: 700,
    		      settings: {
    		        slidesToShow: 2,
    		        slidesToScroll: 2
    		      }
    		    }
    		    // You can unslick at a given breakpoint now by adding:
    		    // settings: "unslick"
    		    // instead of a settings object
    		  ]
      });
    });
  </script>
    
    <section id="week-bestWrap" style="margin-bottom : 40px;">
        <h1>주간 인기 도서</h1>
        <div class="week">
    		<ul  class="grid">
    		<c:forEach begin="1" end="9">
    			<li class="clearfix">
    				<div class="bookImg"><a href=""><img src=""></a></div>
    				<div class="clearfix">
    					<h3>1</h3>
    					<div class="subTitle">
    						<a href="">
    							<h4>책제목</h4>
    							<p>작가</p>
    						</a>
    					</div>
    				</div>
    			</li>
    		</c:forEach>
    		</ul>
    	</div>
    </section>
    
    <section id="bestWrap"  style="margin-bottom : 40px;">
    <h1>베스트셀러</h1>
    	<div class="week">
    		<ul  class="grid">
    			<li class="clearfix">
    				<div class="bookImg"><a href=""><img src=""></a></div>
    				<div class="clearfix">
    					<h3>1</h3>
    					<div class="subTitle">
    						<a href="">
    							<h4>책제목</h4>
    							<p>작가</p>
    						</a>
    					</div>
    				</div>
    			</li>
    			<li class="clearfix">
    				<div class="bookImg"><a href=""><img src=""></a></div>
    				<div class="clearfix">
    					<h3>2</h3>
    					<div class="subTitle">
    						<a href="">
    							<h4>책제목</h4>
    							<p>작가</p>
    						</a>
    					</div>
    				</div>
    			</li>
    			<li class="clearfix">
    				<div class="bookImg"><a href=""><img src=""></a></div>
    				<div class="clearfix">
    					<h3>3</h3>
    					<div class="subTitle">
    						<a href="">
    							<h4>책제목</h4>
    							<p>작가</p>
    						</a>
    					</div>
    				</div>
    			</li>
    			<li class="clearfix">
    				<div class="bookImg"><a href=""><img src=""></a></div>
    				<div class="clearfix">
    					<h3>4</h3>
    					<div class="subTitle">
    						<a href="">
    							<h4>책제목</h4>
    							<p>작가</p>
    						</a>
    					</div>
    				</div>
    			</li>
    			<li class="clearfix">
    				<div class="bookImg"><a href=""><img src=""></a></div>
    				<div class="clearfix">
    					<h3>5</h3>
    					<div class="subTitle">
    						<a href="">
    							<h4>책제목</h4>
    							<p>작가</p>
    						</a>
    					</div>
    				</div>
    			</li>
    			<li class="clearfix">
    				<div class="bookImg"><a href=""><img src=""></a></div>
    				<div class="clearfix">
    					<h3>6</h3>
    					<div class="subTitle">
    						<a href="">
    							<h4>책제목</h4>
    							<p>작가</p>
    						</a>
    					</div>
    				</div>
    			</li>
    			<li class="clearfix">
    				<div class="bookImg"><a href=""><img src=""></a></div>
    				<div class="clearfix">
    					<h3>7</h3>
    					<div class="subTitle">
    						<a href="">
    							<h4>책제목</h4>
    							<p>작가</p>
    						</a>
    					</div>
    				</div>
    			</li>
    			<li class="clearfix">
    				<div class="bookImg"><a href=""><img src=""></a></div>
    				<div class="clearfix">
    					<h3>8</h3>
    					<div class="subTitle">
    						<a href="">
    							<h4>책제목</h4>
    							<p>작가</p>
    						</a>
    					</div>
    				</div>
    			</li>
    			<li class="clearfix">
    				<div class="bookImg"><a href=""><img src=""></a></div>
    				<div class="clearfix">
    					<h3>9</h3>
    					<div class="subTitle">
    						<a href="">
    							<h4>책제목</h4>
    							<p>작가</p>
    						</a>
    					</div>
    				</div>
    			</li>
    		</ul>
    	</div>
    </section>
    
    <section id="TabWrap">
        <div>
            <div id="tabBtn">
                <ul class="clearfix">
                    <li class="on">tab1</li>
                    <li>tab2</li>
                    <li>tab3</li>
                </ul>
            </div>
            <div>
                <div id="tabCont1" class="on">사람들이 지금 많이 읽고 있는 책</div>
                <div id="tabCont2">베스트셀러</div>
                <div id="tabCont3">cont3</div>
            </div>
        </div>
    </section>

<%@ include file="footer.jsp" %>
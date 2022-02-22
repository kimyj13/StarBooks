<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section id="bestSeller" style="height : 2400px; padding-top : 30px;">

					<h1>베스트셀러</h1>
					<div class="book-grid" style="width : 90%; display : grid; grid : repeat(6, 16%)/auto-flow 20%; grid-row-gap: 20px; margin : 20px auto;">
							<c:forEach var="best" begin="0" end="29" items="${bestSeller }">
								<div style=" width : 210px; height : 330px; margin : 0 auto; font-size : 13px;">
									<img src="${best.coverLargeUrl}"  style="display: block; width: 90%; height : 260px; margin: 0 auto;" alt="${best.title }" title="${best.title }">
									<div>
										<h3 style="display:block; width : 95%;height : 33px; margin : 5px auto; overflow : hidden;">${best.title }</h3>
										<h4 style="display:block; width : 95%;  margin : 5px auto; font-size : 12px; color : #aaa">${best.author }</h4>
									</div>
								</div>
							</c:forEach>
						</div>

</section>




<%@ include file="../footer.jsp" %>
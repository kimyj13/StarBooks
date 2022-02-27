<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section id="bestSeller" style="height : 2400px; padding-top : 30px;">

					<h1>주간 Pick! 역사기행</h1>
					<div class="book-grid" style="width : 90%; display : grid; grid : repeat(6, 16%)/repeat(5, 20%);  /* grid : repeat(6, 16%)/auto-flow 20%; */ grid-row-gap: 20px; margin : 20px auto;">
							<c:forEach var="week" begin="0" end="29" items="${weekPick }">
								<div style=" width : 210px; height : 330px; margin : 0 auto; font-size : 13px;">
									<img src="${week.coverLargeUrl}"  style="display: block; width: 90%; height : 260px; margin: 0 auto;" alt="${week.title }" title="${week.title }">
									<div>
										<h3 style="display:block; width : 95%;height : 34px; margin : 5px auto; overflow : hidden;">${week.title }</h3>
										<h4 style="display:block; width : 95%;  margin : 5px auto; font-size : 12px; color : #aaa">${week.author }</h4>
									</div>
								</div>
							</c:forEach>
						</div>

</section>


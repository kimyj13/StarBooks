<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<section id="newBook" style="height : 2400px; padding-top : 20px;">

					<h1>신간도서</h1>
					<div class="book-grid" style="width : 90%; display : grid; grid : repeat(6, 16%)/auto-flow 20%; grid-row-gap: 20px; margin : 20px auto;">
							<c:forEach var="newBook" begin="0" end="29" items="${newBook }">
								<div style=" width : 210px; height : 330px; margin : 0 auto; font-size : 13px;">
									<img src="${newBook.coverLargeUrl}"  style="display: block; width: 90%; height : 260px; margin: 0 auto;" alt="${newBook.title }" title="${newBook.title }">
									<div>
										<h3 style="display:block; width : 95%;height : 33px; margin : 5px auto; overflow : hidden;">${newBook.title }</h3>
										<h4  style="display:block; width : 95%;  margin : 5px auto; font-size : 13px; color : #aaa">${newBook.author }</h4>
									</div>
								</div>
							</c:forEach>
						</div>

</section>















<%@ include file="../footer.jsp" %>
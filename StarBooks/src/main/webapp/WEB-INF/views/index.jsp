<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    


<%@ include file="slider.jsp" %>
    
    <section id="NewBookSlide">
        <h1>New Books Slide</h1>
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
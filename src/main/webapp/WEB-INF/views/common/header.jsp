<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/tags.jsp" %>

<div class="header">
    <div class="container">
        <div class="nav">
            <div class="headerLeft">
                <h1><a href="/">home</a></h1>
            </div>
            
			<sec:authorize access="isAuthenticated()">
	            <div class="headerCenter">
	                <ul>
	                    <li><a href="/book/list">도서목록</a></li>
	                    <li><a href="/cart/list">장바구니</a></li>
	                    <li><a href="/order/list">주문내역</a></li>
	                </ul>
	            </div>
            </sec:authorize>
            
            <div class="headerRight">
                <ul>
					<sec:authorize access="isAuthenticated()">
	                    <li><span><sec:authentication property="principal.name"/>님</span></li>
	                    <li><a href="">마이페이지</a></li>
	                    <li><a href="/logout">로그아웃</a></li>
	                </sec:authorize>
					<sec:authorize access="!isAuthenticated()">
		                    <li><a href="/registerForm">회원가입</a></li>
		                    <li><a href="/login">로그인</a></li>
                    </sec:authorize>
                </ul>
            </div>
        </div>
    </div>
</div>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/tags.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/contents.css">
    <title>bookstore</title>
</head>
<body>
    <!-- header 영역 -->
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <!-- contents 영역 -->
    <section>
        <div class="main">
            <div class="loginFormBox">
                <form method="post" action="/login">
	                <div class="loginForm">
	                	<c:if test="${param.error eq 'fail' }">
	                    	<p>로그인 실패</p>
	                    </c:if>
	                    <input type="text" name="id" class="inputBox mt20 mb10">
	                    <input type="password" name="password" class="inputBox">
	                    <div class="mt20 mb40">
	                        <input type="radio" id="loginUser" name="loginType" value="user" checked>
	                        <label for="loginUser">사용자</label>
	                        <input type="radio" id="loginAdmin" name="loginType" value="admin">
	                        <label for="loginAdmin">관리자</label>
	                    </div>  
	                    <div class="btnGroup">
	                        <a href="" class="secondBtn">회원가입</a>
	                        <button type="submit" class="primaryBtn ml20">로그인</a>
	                    </div>
	                </div>
	        	</form>
            </div>
            <div class="mainBackgound"></div>
        </div>
    </section>

    <!-- footer 영역 -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

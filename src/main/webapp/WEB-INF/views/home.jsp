<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
                <div class="loginForm">
                    <p>로그인해라</p>
                    <input type="text" name="id" class="inputBox mt20 mb10">
                    <input type="password" name="password" class="inputBox">
                    <div class="mt20 mb40">
                        <input type="radio" id="loginUser" name="loginType" value="user">
                        <label for="loginUser">사용자</label>
                        <input type="radio" id="loginAdmin" name="loginType" value="admin">
                        <label for="loginAdmin">관리자</label>
                    </div>  
                    <div class="btnGroup">
                        <a href="" class="secondBtn">회원가입</a>
                        <a href="" class="primaryBtn ml20">로그인</a>
                    </div>
                </div>
            </div>
            <div class="mainBackgound"></div>
        </div>
    </section>

    <!-- footer 영역 -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

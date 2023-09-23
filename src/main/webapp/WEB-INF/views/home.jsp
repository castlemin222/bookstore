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
			<sec:authorize access="isAuthenticated()">
			
			</sec:authorize>
            <div class="mainBackgound"></div>
        </div>
    </section>

    <!-- footer 영역 -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

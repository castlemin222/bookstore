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
    <section class="section">
        <div class="registerForm">
            <form action="/user/register" method="post">
                <div class="rowForm">
                    <label>아이디</label>
                    <input type="text" name="id">
                </div>
                <div class="rowForm">
                    <label>비밀번호</label>
                    <input type="password" name="password">
                </div>
                <div class="rowForm">
                    <label>비밀번호 확인</label>
                    <input type="password" name="confirmPassword">
                </div>
                <div class="rowForm">
                    <label>이름</label>
                    <input type="text" name="name">
                </div>
                <div class="rowForm">
                    <label>이메일</label>
                    <input type="email" name="email">
                </div>
                <div class="rowForm">
                    <label>전화번호</label>
                    <input type="text" name="tel">
                </div>
            </form>
        </div>
        <div class="btnGroup">
            <a href="" class="mr10">취소</a>
            <button id="submitForm">가입하기</button>
        </div>
    </section>

    <!-- footer 영역 -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#submitForm").on('click', function() {
            	// validation check
            	if ($("input[name=id]").val() == "") {
            		alert("아이디를 입력해주세요");
            		$("input[name=id]").focus();
            		return false;
            	}
            	if ($("input[name=password]").val() == "") {
            		alert("비밀번호를 입력해주세요");
            		$("input[name=password]").focus();
            		return false;
            	}
            	if ($("input[name=confirmPassword]").val() == "") {
            		alert("비밀번호를 입력해주세요");
            		$("input[name=confirmPassword]").focus();
            		return false;
            	}
            	if ($("input[name=password]").val() != $("input[name=confirmPassword]").val()) {
            		alert("비밀번호가 일치하지 않습니다.");
            		$("input[name=confirmPassword]").focus();
            		return false;
            	}
            	if ($("input[name=name]").val() == "") {
            		alert("이름을 입력해주세요");
            		$("input[name=name]").focus();
            		return false;
            	}
            	if ($("input[name=email]").val() == "") {
            		alert("이메일을 입력해주세요");
            		$("input[name=email]").focus();
            		return false;
            	}
            	if ($("input[name=tel]").val() == "") {
            		alert("전화번호를 입력해주세요");
            		$("input[name=te;]").focus();
            		return false;
            	}
            	
            	// 회원가입 정보 전송
                $("form").trigger("submit");
            })
        })
    </script>
</body>
</html>

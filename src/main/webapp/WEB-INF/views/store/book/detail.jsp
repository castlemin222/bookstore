<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/tags.jsp" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/resources/css/common.css">
  <link rel="stylesheet" href="/resources/css/reset.css">
  <link rel="stylesheet" href="/resources/css/contents.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <title>bookstore</title>
  <script type="text/javascript">
  	$(function() { 
  		$(".minus").click(function() {
  			var amount = $(".amount span").text();
  			amount = parseInt(amount) - 1;
  			if (amount <= 1) {
  				alert("최소 1개 이상 구매해야 합니다.");
  				return false;
  			}
  			$(".amount span").text(amount);
  		});
  		

  		$(".plus").click(function() {
  			var amount = $(".amount span").text();
  			amount = parseInt(amount) + 1;
  			if (amount > ${detail.BOOK_STOCK }) {
  				alert("현재 남아있는 수량이 " + ${detail.BOOK_STOCK } + "개 입니다.");
  				return false;
  			}
  			$(".amount span").text(amount);
  		});
  	})
  </script>
</head>
<body>
  <%@ include file="/WEB-INF/views/common/header.jsp" %>

  <section class="section">
        <div class="subTitle">
            <p>도서상세</p>
        </div>

        <div class="container">
            <div class="detailWrap">
                <div class="detailImg mr30">
                    <img src="/resources/img/${detail.BOOK_IMAGE }" alt="책 이미지">
                </div>
                <div class="detailInfo">
                    <h3 class="detailTitle">${detail.BOOK_TITLE }</h3>
                    <p class="deatilDescription">${detail.BOOK_DESCRIPTION }</p>
                    <p class="detailAuthor">${detail.BOOK_AUTHOR }</p>
                    <p class="detailPublisher">${detail.BOOK_PUBLISHER }</p>
                    <div class="detailPrice">
                        <p class="discountPrice mr10">${detail.BOOK_DISCOUNT_PRICE }</p>
                        <p class="originalPrice">${detail.BOOK_PRICE }</p>
                    </div>
                </div>
                <div class="detailChoice">
                    <div class="amount">
                        <button class="minus">-</button>
                        <span>1</span>
                        <button class="plus">+</button>
                    </div>
                    <div class="detailBtn">
                        <a href="/cart/item?bookId=${detail.BOOK_ID }" class="mr20">장바구니</a>
                        <a href="/order/item?bookId=${detail.BOOK_ID }">바로구매</a>
                    </div>
                </div>
            </div>
            
           	<c:if test="${not empty reviewList }">
	            <div class="reviewWrap">
	                <p class="subTitle">review</p>
	                <c:forEach var="review" items="${reviewList }">
		                <div class="reviewBox">
		                    <div class="reviewHeader">
								<c:if test="${user eq review.USER_ID }">
			                        <div class="w100 textRight">
			                            <a href="/book/review/delete?id=${review.REVIEW_ID }" class="btnDeleteReview" >
			                                <img src="/resources/img/delete.png" alt="리뷰삭제">
			                            </a>
			                        </div>	
								</c:if>
		                        <p class="reviewPoint">
		                        	<c:forEach var="score" begin="1" end="${review.REVIEW_SCORE }">
			                        	<img src="/resources/img/full_star.png" alt="별점이미지">
		                        	</c:forEach>
		                        </p>
		                        <p class="reviewUser">${review.USER_NAME }</p>
		                    </div>
		                    <div class="reviewContent">
		                        ${review.REVIEW_CONTENT }
		                    </div>
		                </div>
	                </c:forEach>
	            </div>
           	</c:if>
        </div>
    </section>

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

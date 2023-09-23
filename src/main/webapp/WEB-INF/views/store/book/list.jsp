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
  <%@ include file="/WEB-INF/views/common/header.jsp" %>

  <section class="section">
    <div class="subTitle">
      <p>도서목록</p>
    </div>

    <div class="seachForm">
      <div class="lef">
        <p>총 <span>${fn:length(bookList) }</span>건</p>
      </div>
      <div class="right">
        <form action="/post/list" method="GET">
          <div class="mr20">
            <select name="sort">
              <option value="recent">신상품순</option>
              <option value="title">제목순</option>
              <option value="high">최고가순</option>
              <option value="low">최저가순</option>
            </select>
          </div>

          <div class="mr20">
            <select name="opt">
              <option value="all">전체</option>
              <option value="title">제목</option>
              <option value="author">저자</option>
              <option value="publisher">출판사</option>
            </select>
          </div>

          <div>
            <input type="text" name="keyword" placeholder="검색어를 입력하세요">
            <button type="submit">검색</button>
          </div>
        </form>
      </div>
    </div>

    <c:choose>
    	<c:when test="${empty bookList }">
			<div class="textCenter">
				<p>등록된 도서정보가 없습니다.</p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="book" items="${bookList }">
			    <div class="bookList">
			      <div class="bookBorder">
			        <a href="/book/detail?bookId=${book.BOOK_ID }" class="bookContent">
			          <div class="bookHeader">
			            <div class="bookImg">
			              <img src="/resources/img/${book.BOOK_IMAGE }" alt="책이미지">
			            </div>
			          </div>
			          <div class="bookBody mt10">
			            <p class="bookTitle">${book.BOOK_TITLE }</p>
			            <p class="bookInfo">
			              <span class="bookAuthor">${book.BOOK_AUTHOR }</span>
			              <span class="bookPublisher">${book.BOOK_PUBLISHER }</span>
			            </p>
			            <p class="bookPrice">100000원</p>
			          </div>
			        </a>
			      </div>
			    </div>
		    </c:forEach>
		</c:otherwise>
	</c:choose>
	
	
     <div class="pagingWrap">
         <ul>
             <li>
             	<a href="list?page=${paging.prevPage }" data-page-no="${paging.prevPage }" class="${paging.first? 'disabled' : ''  }" disabled>이전</a>
             </li>
             
             <c:forEach var="number" begin="${paging.beginPage }" end="${paging.endPage }">
             	<li><a href="list?page=${number }" data-page-no="${number }">${number }</a></li>
             </c:forEach>
             
             <li>
             	<a href="list?page=${paging.nextPage }" data-page-no="${paging.nextPage }" class="${paging.last? 'disabled' : ''  }">다음</a>
             </li>
         </ul>
     </div>
    
  </section>

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

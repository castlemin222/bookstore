package com.bookstore.book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.book.mapper.BookMapper;
import com.bookstore.utils.Pagination;

@Service
@Transactional
public class BookService {

    private final Logger log = LoggerFactory.getLogger(this.getClass());
    
	@Autowired
	private BookMapper bookMapper;
	
	// 도서 목록 출력
	public Map<String, Object> getBookList(Map<String, Object> param) {
		log.info("============================ bookList service param : " + param);
		// 검색조건에 따른 도서목록 개수 조회
		Map<String, String> row = new HashMap<>();
		row.put("sort", (String) param.get("sort"));
		row.put("opt", (String) param.get("opt"));
		row.put("keyword", (String) param.get("keyword"));
		int totalRows = bookMapper.getTotalRows(row);
		
		// 페이징 관련 설정
		Pagination paging = new Pagination((int) param.get("page"), totalRows);
		param.put("begin", paging.getBegin());
		param.put("end", paging.getEnd());
		
		// 페이징, 도서리스트 조회해서 result 객체에 담는다.
		Map<String, Object> result = new HashMap<>();
		result.put("paging", paging);
		result.put("bookList", bookMapper.getBookList(param));
		log.info("============================ bookList service : " + bookMapper.getBookList(param));
		
		return result;
	};
	
	// 도서 상세정보 조회
	public Map<String, Object> getBookDetailByBookId(String bookId) {
		return bookMapper.getBookDetailByBookId(bookId);
	}
	
	// 도서 리뷰 조회
	public List<Map<String, Object>> getReviewList(String bookId) {
		return bookMapper.getReviewList(bookId);
	}
	
	// 리뷰 등록
	public void addReview(Map<String, Object> param) {
		try {
			bookMapper.addReview(param);			
		} catch (Exception e) {
			log.info("리뷰 등록중 오류 발생" + e.getMessage());
		}
	}

	// 리뷰 삭제
	public void deleteReview(String reviewId) {
		try {
			bookMapper.deleteReview(reviewId);			
		} catch (Exception e) {
			log.info("리뷰 삭제도중 오류가 발생" + e.getMessage());
		}
		
	}

}

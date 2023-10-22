package com.bookstore.book.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookMapper {

	// 도서 목록 조회
	public List<Map<String, Object>> getBookList(Map<String, Object> param);
	// 도서 개수 조회
	public int getTotalRows(Map<String, String> param);
	// 도서 상세정보 조회
	public Map<String, Object> getBookDetailByBookId(String bookId);
	// 도서 리뷰 조회
	public List<Map<String, Object>> getReviewList(String bookId);
	// 리뷰 등록
	public void addReview(Map<String, Object> param);
	// 리뷰 삭제
	public void deleteReview(String reviewId);
}

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
}

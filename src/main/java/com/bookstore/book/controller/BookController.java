package com.bookstore.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.book.service.BookService;
import com.bookstore.security.AuthenticatedUser;
import com.bookstore.security.vo.LoginUser;

@Controller
@RequestMapping("/book")
@Transactional
public class BookController {

    private final Logger log = LoggerFactory.getLogger(this.getClass());
    
	@Autowired
	private BookService bookService;
	
	// 도서목록
	@GetMapping("/list")
	public String list(
			@RequestParam(name = "page", required = false, defaultValue = "1") int page,
			@RequestParam(name = "sort", required = false, defaultValue = "recent") String sort,
			@RequestParam(name = "opt", required = false, defaultValue = "all") String opt,
			@RequestParam(name = "keyword", required = false) String keyword,
			Model model) {
		Map<String, Object> param = new HashMap<>();
		param.put("page", page);
		param.put("sort", sort);
		param.put("opt", opt);
		param.put("keyword", keyword);
		
		// 도서 목록 조회
		Map<String, Object> bookList = bookService.getBookList(param);
		log.info("list controller : " + param);
		model.addAttribute("paging", bookList.get("paging"));
		model.addAttribute("bookList", bookList.get("bookList"));
		log.info("============================ bookList  : " + bookList.get("bookList"));
		
		return "/store/book/list";
	}
	
	// 도서 상세정보 페이지요청
	@GetMapping("/detail")
	public String detail(@AuthenticatedUser LoginUser loginUser, @RequestParam String bookId, Model model) {
		// 도서 상세정보
		Map<String , Object> detail = bookService.getBookDetailByBookId(bookId);
		// 리뷰 목록
		List<Map<String, Object>> reviewList = bookService.getReviewList(bookId);
		
		model.addAttribute("user", loginUser.getId());
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("detail", detail);
		
		return "/store/book/detail";
	}
	
	// 리뷰 등록
	@PostMapping("/review/add")
	public String reviewAdd(@RequestParam Map<String, Object> param, @AuthenticatedUser LoginUser loginUser) {
		log.info("리뷰 등록 param"+param);
		param.put("userId", loginUser.getId());
		bookService.addReview(param);
		return "redirect:/book/detail?bookId="+param.get("bookId");
	}
	
	// 리뷰 삭제
	@GetMapping("/review/delete")
	public String reviewDelete(String reviewId, String bookId) {
		bookService.deleteReview(reviewId);
		return "redirect:/book/detail?bookId="+bookId;
	}
	
}

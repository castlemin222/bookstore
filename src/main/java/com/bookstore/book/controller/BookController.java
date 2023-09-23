package com.bookstore.book.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.book.service.BookService;

@Controller
@RequestMapping("/book")
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
		
		Map<String, Object> bookList = bookService.getBookList(param);
		log.info("list controller : " + param);
		model.addAttribute("paging", bookList.get("paging"));
		model.addAttribute("bookList", bookList.get("bookList"));
		log.info("============================ bookList  : " + bookList.get("bookList"));
		
		return "/store/book/list";
	}
}

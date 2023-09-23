package com.bookstore.home.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.user.service.UserService;


@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    private final Logger log = LoggerFactory.getLogger(this.getClass());
    

    @GetMapping("/")
    public String home() {
        return "home";
    }
    
    // 로그인 화면
    @GetMapping("/login")
    public String login() {
    	return "/login";
    }

    // 회원가입 화면
    @GetMapping("/registerForm")
    public String registerForm() {
        return "registerForm";
    }
    
    // 회원가입 요청
    @PostMapping("/register")
    public String register(@RequestParam Map<String, String> param) throws Exception {
        log.info("========= 회원가입 컨트롤러 : " + param);
    	userService.insertUser(param);
        return "redirect:/";
    }
}

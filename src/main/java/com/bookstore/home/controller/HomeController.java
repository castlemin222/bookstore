package com.bookstore.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {


    @GetMapping("/")
    public String home() {
        return "index";
    }

    // 회원가입 화면
    @GetMapping("/registerForm")
    public String registerForm() {
        return "registerForm";
    }
}

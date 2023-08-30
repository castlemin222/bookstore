package com.bookstore.user.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.home.service.HomeService;
import com.bookstore.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    private final Logger log = LoggerFactory.getLogger(this.getClass());
    
    // 회원가입
    @PostMapping("/register")
    public String register(@RequestParam Map<String, String> param) throws Exception {
        userService.insertUser(param);

        return "redirect:/";
    }
}

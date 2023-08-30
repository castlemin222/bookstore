package com.bookstore.user.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bookstore.user.mapper.UserMapper;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    private final Logger log = LoggerFactory.getLogger(this.getClass());
	
    // 유저 아이디로 유저 정보 조회
    public Map<String, Object> getUserId(String id) {
        return userMapper.getUserId(id);
    }

    // 회원가입
    public void insertUser(Map<String, String> param) throws Exception {
        log.info("================= register param : {}", param);
    	Map<String, Object> userInfo = userMapper.getUserId(param.get("id"));
    	if (userInfo != null) {
    		throw new Exception();
    	}
    	
    	param.put("password", passwordEncoder.encode(param.get("password"))); 
    	
    	userMapper.insertUser(param);
    }
}

package com.bookstore.security.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bookstore.security.vo.CustomUserDetails;
import com.bookstore.user.mapper.UserMapper;

@Service
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		// 사용자아이디로 사용자 정보를 조회한다.
		Map<String, Object> user = userMapper.getUserId(id);
		// 사용자 정보가 존재하지 않으면 예외를 던진다.
		if(user == null) {
			throw new UsernameNotFoundException("사용자 정보가 존재하지 않습니다.");
		}
		if("Y".equals(user.get("enabled"))) {
			throw new UsernameNotFoundException("탈퇴한 사용자입니다.");
		}

		// 사용자의 권한정보를 조회한다.
		Map<String, String> userRole = userMapper.getUserRoleByUserId(id);
		// 조회된 권한정보로 GrantedAuthority객체를 생성한다.
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(userRole.get("USER_ROLE")));
		
		return new CustomUserDetails(
					(String)user.get("USER_ID"), 
					(String)user.get("USER_PASSWORD"), 
					(String)user.get("USER_NAME"),
					authorities);
	}
	
}

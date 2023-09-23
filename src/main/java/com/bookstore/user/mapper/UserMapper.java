package com.bookstore.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapper {

	// 유저 아이디로 유정 정보 조회
	public Map<String, Object> getUserId(String id);
	// 회원가입
	public void insertUser(Map<String, String> param);
	// 유저 아이디로 유저 권한 조회
	public Map<String, String> getUserRoleByUserId(String id);
	// 유저 권한 부여
	public void insertUserRole(String id);
}

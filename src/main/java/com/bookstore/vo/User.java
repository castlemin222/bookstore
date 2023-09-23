package com.bookstore.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
	private String id;
	private String password;
	private String email;
	private String name;
	private String enabled;
}

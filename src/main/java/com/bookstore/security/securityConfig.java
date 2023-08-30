package com.bookstore.security;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class securityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf().disable()	
			.authorizeRequests()	
			.antMatchers("/", "/**" , "/registerForm", "/login", "/success").permitAll()	
			//.antMatchers("/admin/**").hasRole("ADMIN")	
			.anyRequest().authenticated()				
		.and()	
			.formLogin()						
			.loginPage("/login")				
			.loginProcessingUrl("/login")		
			.usernameParameter("id")		
			.passwordParameter("password")
			.defaultSuccessUrl("/")	
			.failureUrl("/login?error=fail")
			.permitAll()
		.and()
			.logout()							
			.logoutUrl("/logout")				
			.logoutSuccessUrl("/")					
	    	.permitAll()		
		.and()
			.exceptionHandling()				
			.accessDeniedPage("/access-denied");
	}
	
	// 이미지, 스타일시트, 자바스크립트소스와 같은 정적 컨텐츠는 인증/인가 작업을 수행하지 않도록 설정한다.
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}

}

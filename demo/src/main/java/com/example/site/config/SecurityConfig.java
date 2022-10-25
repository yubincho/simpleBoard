package com.example.site.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import lombok.extern.log4j.Log4j2;


// 환경 변수 
@Configuration 
@EnableWebSecurity
@Log4j2
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
//	@Autowired
//	private PasswordEncoder passwordEncoder;  // Bean으로 등록하여도 자동으로 선언되지 않을 경우 Autowired로 주입한다.
	

	@Override
	protected void configure(HttpSecurity http) throws Exception { 
//		CharacterEncodingFilter filter = new CharacterEncodingFilter(); 
//		filter.setEncoding("UTF-8");
//		filter.setForceEncoding(true);
//		http.addFilterBefore(filter,CsrfFilter.class);   
		
		log.info("security config..");
		
		http.formLogin();
		http.csrf().disable();
		http.logout();
	}
	
	
//	@Bean
//	public InMemoryUserDetailsManager userDetailsService() {
//		UserDetails user = User.builder()
//				.username("user1")
//				.password(passwordEncoder().encode("1111"))
//				.roles("USER")
//				.build();
//		return new InMemoryUserDetailsManager(user);
//	}
//	
//	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
}

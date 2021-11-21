package com.manhcode.security;

import java.util.Arrays;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;

import com.manhcode.security.filter.AuthoritiesLoggingAfterFilter;
import com.manhcode.security.filter.AuthoritiesLoggingAtFilter;
import com.manhcode.security.filter.JWTTokenGeneratorFilter;
import com.manhcode.security.filter.JWTTokenValidatorFilter;
import com.manhcode.security.filter.RequestValidationBeforeFilter;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true, jsr250Enabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		// disable JSESSION
		http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
		
		//cors configuration
		.cors().configurationSource(new CorsConfigurationSource() {

			@Override
			public CorsConfiguration getCorsConfiguration(HttpServletRequest request) {
				CorsConfiguration config = new CorsConfiguration();
				config.setAllowedOrigins(Collections.singletonList("http://localhost:4200")); // domain of angular
				config.setAllowedMethods(Collections.singletonList("*"));
				config.setAllowCredentials(true);
				config.setAllowedHeaders(Collections.singletonList("*"));
				
				//JWT header
				config.setExposedHeaders(Arrays.asList("Authorization"));
				
				config.setMaxAge(3600L);
				return config;
			}
			
		})
		.and()
		// csrf token except for /contact because it is public and not require authentication
			//.csrf().ignoringAntMatchers("/contact").csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse()).and()
		
		// disable csrf because use JWT íntead
		.csrf().disable()

		//call filter
		.addFilterBefore(new RequestValidationBeforeFilter(), BasicAuthenticationFilter.class)
		.addFilterAfter(new AuthoritiesLoggingAfterFilter(), BasicAuthenticationFilter.class)
		
		
		// JWT filter
		.addFilterBefore(new JWTTokenValidatorFilter(), BasicAuthenticationFilter.class)
		.addFilterAfter(new JWTTokenGeneratorFilter(), BasicAuthenticationFilter.class)
		
		.addFilterAt(new AuthoritiesLoggingAtFilter(), BasicAuthenticationFilter.class)
		
		.authorizeRequests()
			.antMatchers("/myAccount", "/myBalance", "/myCards", "/myLoans").hasAnyAuthority("WRITE", "READ")
			.antMatchers("/user").authenticated()
			.antMatchers("/notices", "/contact").permitAll()
			.and()
			.formLogin().and()
			.httpBasic();
		
		/*
		 * Config to deny all request
		 */
//		http.authorizeRequests().anyRequest().denyAll()
//		.and()
//		.formLogin().and()
//		.httpBasic();
		
		/*
		 * Config to allow all request
		 */
//		http.authorizeRequests().anyRequest().permitAll()
//		.and()
//		.formLogin().and()
//		.httpBasic();
	}
	
	

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		super.configure(auth);
	}

	/*Jdbc with table is users from database
	@Bean
	public UserDetailsService userDetailsService(DataSource dataSource) {
		return new JdbcUserDetailsManager(dataSource);
	}*/
	
	// Custom login with table Customer
	@Bean
	public UserDetailsService userDetailsService() {
		return new CustomerDetailsService();
	}
	
	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();

		authProvider.setUserDetailsService(userDetailsService());
		authProvider.setPasswordEncoder(passwordEncoder());

		return authProvider;
	}
	
	// END of customer login

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}

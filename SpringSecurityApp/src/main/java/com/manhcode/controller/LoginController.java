package com.manhcode.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.manhcode.entity.Customer;
import com.manhcode.repository.CustomerRepository;

@RestController
public class LoginController {
	@Autowired
	private CustomerRepository customerRepository;
	
	@RequestMapping("/user")
	public Customer getUserDetailsAfterLogin(Principal user) {
		Customer customer = customerRepository.findByEmail(user.getName());
		return customer;
	}
}

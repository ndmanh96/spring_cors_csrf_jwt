package com.manhcode.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.manhcode.entity.Customer;
import com.manhcode.repository.CustomerRepository;

public class CustomerDetailsService implements UserDetailsService {

	@Autowired
	private CustomerRepository repository;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Customer customer = repository.findByEmail(username);
		if (customer==null) {
			throw new UsernameNotFoundException("Can't find customer with email: "+username);
		}
		return new CustomerDetails(customer);
	}

}

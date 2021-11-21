package com.manhcode.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.manhcode.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer>{
	public Customer findByEmail(String email);
}

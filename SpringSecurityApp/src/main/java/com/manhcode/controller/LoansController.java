package com.manhcode.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.manhcode.entity.Customer;
import com.manhcode.entity.Loan;
import com.manhcode.repository.LoanRepository;

@RestController
public class LoansController {

	@Autowired
	private LoanRepository loanRepository;
	
	@PostMapping("/myLoans")
	//@PostAuthorize("hasRole('ROOT')")
	public List<Loan> getLoanDetails(@RequestBody Customer customer) {
		List<Loan> loans = loanRepository.findByCustomerIdOrderByStartDtDesc(customer.getId());
		if (loans != null ) {
			return loans;
		}else {
			return null;
		}
	}
}

package com.manhcode.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

import com.manhcode.entity.Loan;



@Repository
public interface LoanRepository extends CrudRepository<Loan, Long> {
	//@PreAuthorize("hasRole('ROOT')")
	public List<Loan> findByCustomerIdOrderByStartDtDesc(int customerId);

}

package com.manhcode.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.manhcode.entity.Account;



@Repository
public interface AccountsRepository extends CrudRepository<Account, Long> {
	
	public Account findByCustomerId(int customerId);

}

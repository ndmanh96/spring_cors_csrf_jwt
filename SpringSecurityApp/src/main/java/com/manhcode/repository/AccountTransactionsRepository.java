package com.manhcode.repository;


import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.manhcode.entity.AccountTransaction;



@Repository
public interface AccountTransactionsRepository extends CrudRepository<AccountTransaction, Long> {
	
	public List<AccountTransaction> findByCustomerIdOrderByTransactionDtDesc(int customerId);

}

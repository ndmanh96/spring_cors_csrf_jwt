package com.manhcode.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.manhcode.entity.Card;



@Repository
public interface CardsRepository extends CrudRepository<Card, Long> {
	
	public List<Card> findByCustomerId(int customerId);

}

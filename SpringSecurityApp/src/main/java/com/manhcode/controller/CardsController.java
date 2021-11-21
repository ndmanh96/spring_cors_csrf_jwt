package com.manhcode.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.manhcode.entity.Card;
import com.manhcode.entity.Customer;
import com.manhcode.repository.CardsRepository;

@RestController
public class CardsController {

	@Autowired
	private CardsRepository cardsRepository;
	
	@PostMapping("/myCards")
	public List<Card> getCardDetails(@RequestBody Customer customer) {
		List<Card> cards = cardsRepository.findByCustomerId(customer.getId());
		if (cards != null ) {
			return cards;
		}else {
			return null;
		}
	}
}

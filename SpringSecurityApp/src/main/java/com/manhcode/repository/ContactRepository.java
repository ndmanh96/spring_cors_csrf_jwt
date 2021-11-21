package com.manhcode.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.manhcode.entity.Contact;



@Repository
public interface ContactRepository extends CrudRepository<Contact, Long> {
	
	
}

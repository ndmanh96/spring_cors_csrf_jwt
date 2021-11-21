package com.manhcode.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.manhcode.entity.Notice;



@Repository
public interface NoticeRepository extends CrudRepository<Notice, Long> {
	
//	@Query(value = "select n from Notice n where CURDATE() BETWEEN noticBegDt AND noticEndDt")
	@Query(value = "select n from Notice n")
	public List<Notice> findAllActiveNotices();

}

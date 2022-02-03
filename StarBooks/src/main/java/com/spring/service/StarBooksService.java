package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.model.StarBooksDAO;

@Service
public class StarBooksService {

	@Autowired private StarBooksDAO dao;
	
	public String testDB() {
		return dao.test();
	}

}

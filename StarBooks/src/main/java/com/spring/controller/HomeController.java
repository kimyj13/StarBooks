package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.StarBooksService;

@Controller
public class HomeController {
	@Autowired private StarBooksService sbs;
	
	@GetMapping({"", "/"})
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		String time = sbs.testDB();
		mav.addObject("time", time);
		mav.setViewName("index");
		return mav;
	}
}
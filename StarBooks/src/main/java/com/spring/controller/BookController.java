package com.spring.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.StarBookDTO;
import com.spring.service.StarBooksService;

@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired private StarBooksService sbs;
	
	@GetMapping("/list")
	public void list() {}
	
	@GetMapping("/category/{num}")
	public ModelAndView category(@PathVariable int num) {
		ModelAndView mav = new ModelAndView();
		String str="";
		switch(num) {
			case 100: str = "소설";break;
			case 110: str = "에세이/시";break;
			case 200: str = "경영/경제";break;
			case 300: str = "자기계발";break;
			case 400: str = "인문/사회/역사";break;
			case 700: str = "종교";break;
			case 800: str = "여행";break;
			case 1000: str = "외국어";break;
			case 1100: str = "과학";break;
			case 2200: str = "컴퓨터/IT";break;
			default:str="";
		}
		mav.setViewName("books/category");
		mav.addObject("category", str);
		
		return mav;
	}
	
	@GetMapping("/bestSeller")
	public ModelAndView bestSeller() {
		ModelAndView mav = new ModelAndView();
		List<StarBookDTO> dto = sbs.bestSeller();
		mav.setViewName("books/bestSeller");
		mav.addObject("bestSeller", dto);
		return mav;
	}
	
	@GetMapping("/newBook")
	public ModelAndView newBook() {
		ModelAndView mav = new ModelAndView();
		List<StarBookDTO> dto = sbs.newBook();
		mav.setViewName("books/newBook");
		mav.addObject("newBook", dto);
		return mav;
	}
}

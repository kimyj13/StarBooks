package com.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.BookDTO;
import com.spring.model.StarBookDTO;
import com.spring.service.BookService;
import com.spring.service.StarBooksService;

@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired private StarBooksService sbs;
	@Autowired private BookService bs;
	
	@GetMapping("/list")
	public void list() {}
	
	@GetMapping("/category/{num}")
	public ModelAndView category(@PathVariable int num,@RequestParam String str) {
		ModelAndView mav = new ModelAndView();
	
		ArrayList<BookDTO>dto = bs.bookList(str, num);
		ArrayList<BookDTO>cdto = bs.bookListC(str, num);
		
		mav.setViewName("books/category");
		mav.addObject("category", str);
		mav.addObject("list",dto);
		mav.addObject("clist", cdto);
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

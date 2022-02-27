package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.BookDTO;
import com.spring.model.StarBookDTO;
import com.spring.service.BookService;
import com.spring.service.StarBooksService;

@Controller
public class HomeController {
	@Autowired private StarBooksService sbs;
	@Autowired private BookService book;
	
	@GetMapping({"", "/"})
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
//		String time = sbs.testDB();
//		mav.addObject("time", time);
		
		List<StarBookDTO> best  = sbs.bestSeller();
		if(best!=null) {
			mav.addObject("best", best);
		}
		List<StarBookDTO> newBook  =sbs.newBook();
		if(newBook != null) {
			mav.addObject("newBook", newBook);
		}
		List<StarBookDTO> recommend  =sbs.recommend();
		if(recommend != null) {
			mav.addObject("recommend", recommend);
		}
		List<StarBookDTO> history  =sbs.weekPick(105);
		if(history != null) {
			mav.addObject("history", history);
		}
		mav.setViewName("index");
		return mav;
	}
	
	@GetMapping("/search/{search}")
	public ModelAndView search(@PathVariable String search) {
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("search");		
		mav.addObject("search", search);						// 검색 단어		
		List<BookDTO> list = book.search(search);
		System.out.println("home list : " + list + (list == null ? " / null" : " / not null"));
		if(list != null) {
			mav.addObject("bookjson", list);		// 검색 결과
			mav.addObject("count", list.get(0).getCount());		// 검색 결과 수
//			System.out.println("homeController count : " + list.get(0).getCount());
		}
		return mav;
	}
}

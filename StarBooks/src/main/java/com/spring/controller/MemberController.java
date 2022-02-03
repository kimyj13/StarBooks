package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.member.MemberDTO;
import com.spring.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired private MemberService ms;
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(@PathVariable MemberDTO dto) {
		return "redirect:/";
	}
	
	@GetMapping("/login")
	public void login(){}
	
	@GetMapping("/findid")
	public void findid() {}
	
	@GetMapping("/newpw")
	public void newpw() {}
	
	@GetMapping("/mystar")
	public void mystar() {}
}

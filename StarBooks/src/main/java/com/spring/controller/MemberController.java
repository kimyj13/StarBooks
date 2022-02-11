package com.spring.controller;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.member.MemberDTO;
import com.spring.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired private MemberService ms;
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public ModelAndView join(MemberDTO dto) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		int row = ms.insertMember(dto);
		if(row == 1) {
		mav.setViewName("access");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("msg","회원 가입 성공! 로그인 해주세요.");
		map.put("href", "/member/login");
		mav.addObject("map", map);
		return mav;	
		}
		mav.setViewName("alert");
		mav.addObject("msg", "회원가입 실패했습니다. 잠시 후 다시 이용해주세요.");
		return mav;
	}
	
	@PostMapping(value="/join/idCheck", consumes = "application/json; charset=utf-8", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String emailCheck(@RequestBody HashMap<String, String> map) {
		System.out.println("map : " + map);
		
		boolean flag = ms.idCheck(map.get("id"));
		System.out.println(flag);
		return flag ? "사용가능한 id 입니다." : "이미 사용중인 id 입니다.";
	}
	
	@GetMapping("/login")
	public ModelAndView login(@CookieValue(value="cookieId", required = false) String userid){
		ModelAndView mav = new ModelAndView("member/login");
		if(userid != null) {			// 저장된 쿠키값이 있으면 불러오기
			System.out.println(userid);
			mav.addObject("cookieId", userid);
		}
		return mav;
	}
	
//	@PostMapping("/login")
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(MemberDTO dto,HttpSession session, HttpServletResponse response, HttpServletRequest request) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		ModelAndView mav = new ModelAndView();
		MemberDTO login = ms.loginMember(dto);
		if(login != null) {
			session.setAttribute("login", login);
			session.setMaxInactiveInterval(60*60*3);

			if(dto.getIsCookie() == 'y' ) {			// id저장 체크 - 쿠키생성
				Cookie cookie = new Cookie("cookieId", dto.getUserid());
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 3); 		// 3일
				response.addCookie(cookie);
			}else {												// id저장 체크 해제 - 쿠키 삭제
				Cookie cookie = new Cookie("cookieId", null);
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			mav.setViewName("access");
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("msg", login.getUserid() + "님 로그인 되었습니다.");
			map.put("href", "");
			mav.addObject("map", map);
			return mav;
		}
		mav.setViewName("alert");
		mav.addObject("msg", "id나 비밀번호가 틀렸습니다.");
		return mav;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	

	
	@GetMapping("/findid")
	public void findid() {}
	
	@PostMapping("/findid")
	public ModelAndView findid(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("member/findid");
		StringBuffer format = new StringBuffer();
		String id = ms.findId(dto);
		if(id == null) {
			mav.addObject("msg", null);
			return mav;
		}
		format.append(id);
		String star="";
		for(int i=2; i < format.length()-2; i++)star+="*";
		format = format.replace(2, format.length()-2, star);
		String msg =String.format("당신의 ID는 [%s] 입니다",  format.toString());
		System.out.println(msg);
		mav.addObject("msg", msg);
		return mav;
	}
	
	@GetMapping("/newpw")
	public void newpw() {}
	
	@PostMapping("/newpw")
	public ModelAndView newpw(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("member/newpw");
		String newPw = ms.reNewPw(dto);
		mav.addObject("newPw", newPw);
		return mav;
	}
	
	@GetMapping("/mystar")
	public void mystar() {}
	
//	@ExceptionHandler(EmptyResultDataAccessException.class)
//	public ModelAndView notfound() {
//		ModelAndView mav = new ModelAndView("alert");
//		mav.addObject("msg", "id나 비밀번호가 일치하지 않습니다.");
//		return mav;
//	}
}



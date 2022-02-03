package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.MemberDAO;
@Service
public class MemberService {
	@Autowired private MemberDAO dao;
}

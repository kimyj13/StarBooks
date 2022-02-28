package com.spring.service;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.MemberDAO;
import com.spring.member.MemberDTO;
@Service
public class MemberService {
	@Autowired private MemberDAO dao;

	public String getHash(String input) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		md.reset();
		md.update(input.getBytes("UTF-8"));
		String hashpw = String.format("%0128x", new BigInteger(1, md.digest()));
		return hashpw;
	}		// 패스워드 Hash 처리
	
	public int insertMember(MemberDTO dto) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		//dto.setUserpw(getHash(dto.getUserpw()));		// 패스워드 Hash 처리
		return dao.insertMember(dto);
	}

	public MemberDTO loginMember(MemberDTO dto) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		//dto.setUserpw(getHash(dto.getUserpw()));		// 패스워드 Hash 처리
		return dao.loginMember(dto);
	}

	public String findId(MemberDTO dto) {
		return dao.findId(dto);
	}

	public String reNewPw(MemberDTO dto) {
		String newPw = UUID.randomUUID().toString().split("-")[0];
//		String hashPw = getHash(newPw);		// 패스워드 Hash 처리
		dto.setUserpw(newPw);
		int row = dao.reNewPw(dto);
		return row == 1? newPw : null;
	}

	public boolean idCheck(String id) {
		int count = dao.idCheck(id);
		return count == 0;
	}

	public boolean emailCheck(String email) {
		int count = dao.emailCheck(email);
		return count == 0;
	}
}

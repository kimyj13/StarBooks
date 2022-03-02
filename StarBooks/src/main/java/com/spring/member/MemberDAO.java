package com.spring.member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberDAO {

	@Insert("insert into member (user_id, user_pw, user_name, user_email, user_birth, user_gender)"
			+ " values(#{user_id}, #{user_pw}, #{user_name}, #{user_email}, #{user_birth}, #{user_gender})")
	int insertMember(MemberDTO dto);

	@Select("select * from member where user_id=#{user_id} and user_pw=#{user_pw}")
	MemberDTO loginMember(MemberDTO dto);

	@Select("select user_id from member where user_email = #{user_email}")
	String findId(MemberDTO dto);

	@Update("update member set user_pw = #{user_pw} where user_id=#{user_id} and user_email=#{user_email}")
	int reNewPw(MemberDTO dto);

	@Select("select count(*) from member where user_id=#{id}")
	int idCheck(String id);

	@Select("select count(*) from member where user_email=#{email}")
	int emailCheck(String email);

	@Select("select count(*) from member where user_id=#{user_id} and user_pw=#{user_pw}")
	int pwCheck(MemberDTO dto);

	@Update("update member set user_pw=#{user_pw} where user_id=#{user_id}")
	int changePw(MemberDTO dto);

}

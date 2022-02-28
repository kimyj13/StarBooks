package com.spring.member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberDAO {

	@Insert("insert into member (idx, userid, userpw, username, useremail, userbirth, usergender)"
			+ " values(0, #{userid}, #{userpw}, #{username}, #{useremail}, #{userbirth}, #{usergender})")
	int insertMember(MemberDTO dto);

	@Select("select * from member where userid=#{userid} and userpw=#{userpw}")
	MemberDTO loginMember(MemberDTO dto);

	@Select("select userid from member where useremail = #{useremail}")
	String findId(MemberDTO dto);

	@Update("update member set userpw = #{userpw} where userid=#{userid} and useremail=#{useremail}")
	int reNewPw(MemberDTO dto);

	@Select("select count(*) from member where userid=#{id}")
	int idCheck(String id);

	@Select("select count(*) from member where useremail=#{email}")
	int emailCheck(String email);

}

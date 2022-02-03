package com.spring.model;

import org.apache.ibatis.annotations.Select;

public interface StarBooksDAO {

	@Select("select now()")
	String test();

}

package com.spring.crud;

import java.util.List;

public interface BoardService {
	BoardVO selectById(BoardVO vo);
	
	BoardVO detailView(Integer bno);
	
	void insert(BoardVO vo);
	
	void update(BoardVO vo, String title, String writer, String content);
	
	void delete(BoardVO vo);

	List<BoardVO> selectList(BoardVO vo);

}
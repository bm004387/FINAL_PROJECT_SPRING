package com.spring.crud.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.crud.BoardVO;


@Repository
public class BoardDAO {
	
	// 마이바티스 템플릿 활용
	private SqlSessionTemplate mybatis;
	
	// 의존주입
	@Autowired
	public BoardDAO(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public void insert(BoardVO vo) {
		mybatis.insert("BoardDAO.insert", vo);
	}
	
	public BoardVO selectById(BoardVO vo) {
		return (BoardVO)mybatis.selectOne("BoardDAO.selectById", vo);
	}	
	
	public List<BoardVO> selectList(BoardVO vo){
		return mybatis.selectList("BoardDAO.selectList", vo);
	}
	
	public void update(BoardVO vo) {
		mybatis.update("BoardDAO.update", vo);
	}
	
	public void delete(BoardVO vo) {
		mybatis.delete("BoardDAO.delete", vo);
	}

	public BoardVO detailView(Integer bno) {
		return mybatis.selectOne("BoardDAO.detailView", bno);
	}	
}
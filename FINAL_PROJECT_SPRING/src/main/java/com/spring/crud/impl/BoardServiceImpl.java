package com.spring.crud.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.crud.BoardService;
import com.spring.crud.BoardVO;


@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public BoardVO selectById(BoardVO vo) {
		return boardDAO.selectById(vo);
	}

	@Override
	public List<BoardVO> selectList(BoardVO vo) {
		List<BoardVO> boardlist = boardDAO.selectList(vo);
		return boardlist;
	}

	@Override
	public void insert(BoardVO vo) {
		vo.setRegdate(LocalDate.now());
		vo.setUpdatedate(LocalDate.now());
		boardDAO.insert(vo);
	}

	@Override
	public void update(BoardVO vo, String title, String writer, String content) {
		BoardVO selected = boardDAO.selectById(vo);
		selected.setTitle(title);
		selected.setContent(content);
		selected.setWriter(writer);
		selected.setUpdatedate(LocalDate.now());
	}

	@Override
	public void delete(BoardVO vo) {
		boardDAO.delete(vo);		
	}

	@Override
	public BoardVO detailView(Integer bno) {
		return boardDAO.detailView(bno);
	}

}
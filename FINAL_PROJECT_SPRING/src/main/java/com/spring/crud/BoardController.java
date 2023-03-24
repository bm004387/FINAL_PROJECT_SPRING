package com.spring.crud;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class BoardController {

	// 의존주입
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/main.do")
	public RedirectView main() {
		RedirectView redirectView = new RedirectView();
       redirectView.setUrl("http://localhost:9008/main.do");
       return redirectView;
	}
	
	@GetMapping("/about.do")
	public RedirectView about() {
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("http://localhost:9008/about.do");
       return redirectView;
	}
	@GetMapping("/board.do")
	public RedirectView board() {
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("http://localhost:9008/board.do");
       return redirectView;
	}
	
	@GetMapping("/faq.do")
	public RedirectView faq() {
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("http://localhost:9008/faq.do");
       return redirectView;
	}
	
	@GetMapping("/location.do")
	public RedirectView location() {
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("http://localhost:9008/location.do");
       return redirectView;
	}
	@GetMapping("/react.do")
	public RedirectView react() {
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("http://localhost:3000");
       return redirectView;
	}
	@GetMapping("/login.do")
	public RedirectView login() {
		RedirectView redirectView = new RedirectView();
       redirectView.setUrl("http://localhost:9008/login.do");
       return redirectView;
	}
	@GetMapping("/logout.do")
	public RedirectView logout() {
		RedirectView redirectView = new RedirectView();
       redirectView.setUrl("http://localhost:9008/logout.do");
       return redirectView;
	}
	
	
	// 게시글 목록 조회
	@RequestMapping("/board/list.do")
	public String selectList(@ModelAttribute("boardVO")BoardVO vo, HttpServletRequest request, HttpSession session, Model model){
		try {
			List<BoardVO> boardList = boardService.selectList(vo);
			
			model.addAttribute("boardList", boardList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/WEB-INF/views/boardList.jsp";
	}
	
	// 게시글 상세조회 페이지
	@RequestMapping(value = "/detail.do",method = RequestMethod.GET)
	public String detailView(@ModelAttribute("boardVO")BoardVO vo, @RequestParam("bno") Integer bno, Model model, HttpServletRequest request, HttpSession session) {
		BoardVO detail = boardService.detailView(bno);
		model.addAttribute("detail", detail);
		return "/WEB-INF/views/detailView.jsp";
	}
	
	// 게시글 등록 폼
	@RequestMapping("/write.do")
	public String insert(HttpServletRequest request, HttpServletResponse response, BoardVO vo) {
		return "/WEB-INF/views/insertForm.jsp";
	}
	
	// 게시글 등록 완료
	@PostMapping("/write.do")
	public String insert(BoardVO vo) {
		boardService.insert(vo);
		return "/WEB-INF/views/insertSuccess.jsp";
	}

	// 게시글 수정 폼
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String update(@ModelAttribute("boardVO")BoardVO vo, @RequestParam("bno") Integer bno, Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response){
		BoardVO detail = boardService.detailView(bno);
		model.addAttribute("detail", detail);
		return "/WEB-INF/views/updateForm.jsp";
	}
	
	// 게시글 수정 완료
	@PostMapping("/modifySuccess.do")
	public String update(BoardVO bno, String title, String content, String writer) {
		boardService.update(bno, title, content, writer);
		return "/WEB-INF/views/updateSuccess.jsp";
	}
	
	// 게시글 삭제
	@PostMapping("/delete.do")
	public String delete(BoardVO vo) {
		boardService.delete(vo);
		return "/WEB-INF/views/deleteSuccess.jsp";
	}
}


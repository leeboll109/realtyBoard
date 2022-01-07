package com.gyu.realty.view.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gyu.realty.api.vo.MemberVo;
import com.gyu.realty.view.service.MainBoardService;
import com.gyu.realty.view.vo.BoardContent;
import com.gyu.realty.view.vo.BoardPaging;

@Controller
public class MainBoardController {

	@Autowired
	private MainBoardService service;
	
	@GetMapping("/")
	public String MainBoardView(HttpServletRequest req, Model model, @RequestParam(required=false, defaultValue="1") int page) throws Exception{
		int totCnt = service.getTotalBoardListForPaging();
		BoardPaging paging = new BoardPaging(totCnt, page, 10);
		List<BoardContent> list = service.getBoardListForPaging(paging);
		
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo)session.getAttribute("member");
		model.addAttribute("member", member);
		model.addAttribute("page", paging);
		model.addAttribute("list", list);
		return "mainBoard";
	}
	
	@GetMapping("/new")
	public String NewBoardView(Model model, @RequestParam String writer) throws Exception {
		MemberVo member = service.getMember(writer);
		model.addAttribute("member", member);
		return "newBoard";
	}
	
	@GetMapping("/update")
	public String UpdateBoardView(Model model, @RequestParam int no) throws Exception {
		String writer = service.getWriter(no);
		model.addAttribute("writer", writer);
		model.addAttribute("no", no);
		return "updateBoard";
	}
	
	@GetMapping("/detail")
	public String DetailBoardView(HttpServletRequest req, Model model, @RequestParam int no) throws Exception {
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo)session.getAttribute("member");
		model.addAttribute("member", member);
		
		String writer = service.getWriter(no);
		model.addAttribute("writer", writer);
		model.addAttribute("no", no);
		return "detailBoard";
	}

	@PostMapping("/login")
	public String loginProcess(MemberVo memberVo, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVo member = service.loginCheck(memberVo); 
		if(member == null) {
			session.setAttribute("member", null);
		} else {
			session.setAttribute("member", member);
		}
		int totCnt = service.getTotalBoardListForPaging();
		BoardPaging paging = new BoardPaging(totCnt, 1, 10);
		List<BoardContent> list = service.getBoardListForPaging(paging);
		
		model.addAttribute("member", member);
		model.addAttribute("page", paging);
		model.addAttribute("list", list);
		return "mainBoard";
	}

	@GetMapping("/logout")
	public String logoutProcess(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo)session.getAttribute("member");
		if(member != null) {
			session.removeAttribute("member");
		}
		int totCnt = service.getTotalBoardListForPaging();
		BoardPaging paging = new BoardPaging(totCnt, 1, 10);
		List<BoardContent> list = service.getBoardListForPaging(paging);
		
		model.addAttribute("page", paging);
		model.addAttribute("list", list);
		return "mainBoard";
	}
}

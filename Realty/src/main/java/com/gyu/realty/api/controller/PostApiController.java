package com.gyu.realty.api.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gyu.realty.api.service.MainInsertService;
import com.gyu.realty.api.vo.BoardContent;
import com.gyu.realty.api.vo.MemberVo;

@RestController
public class PostApiController {

	@Autowired
	private MainInsertService service;
	
	@PostMapping("/write")
	public ModelAndView writeBoard(ModelAndView mav, BoardContent content) {
		service.setInsertBoard(content);
		mav.setViewName("redirect:/detail?no=" + content.getNo());
		return mav;
	}
	
	@PostMapping("/detailContent")
	public BoardContent getBoardContent(BoardContent content) {
		
		return service.getBoardContent(content);
	}

	@PostMapping("/updateContent")
	public ModelAndView updateBoard(ModelAndView mav, BoardContent content) {
		service.setUpdateBoard(content);
		mav.setViewName("redirect:/detail?no=" + content.getNo());
		return mav;
	}
	
	@PostMapping("/delete")
	public int deleteBoardContent(BoardContent content) {
		
		return service.deleteBoardContent(content);
	}
	
}

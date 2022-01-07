package com.gyu.realty.view.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyu.realty.api.vo.MemberVo;
import com.gyu.realty.view.mapper.MainPagingMapper;
import com.gyu.realty.view.vo.BoardContent;
import com.gyu.realty.view.vo.BoardPaging;

@Service
public class MainBoardService {

	@Autowired
	private MainPagingMapper dao;
	
	public List<BoardContent> getBoardListForPaging(BoardPaging paging) {
		return dao.getBoardListForPaging(paging);
	}

	public int getTotalBoardListForPaging() {
		return dao.getTotalBoardListForPaging();
	}

	public String getWriter(int no) {
		return dao.getWriter(no);
	}

	public MemberVo getMember(String member) {
		return dao.getMember(member);
	}

	public MemberVo loginCheck(MemberVo vo) {
		MemberVo member = dao.selectMember(vo);
		return member;
	}


}

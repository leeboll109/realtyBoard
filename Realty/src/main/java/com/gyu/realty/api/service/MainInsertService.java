package com.gyu.realty.api.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyu.realty.api.mapper.MainInsertMapper;
import com.gyu.realty.api.vo.BoardContent;
import com.gyu.realty.api.vo.MemberVo;

@Service
public class MainInsertService {

	@Autowired
	private MainInsertMapper dao;
	
	public int setInsertBoard(BoardContent content) {
		dao.setInsertBoard(content);
		content.setNo(dao.getNo());
		return content.getNo();
	}

	public BoardContent getBoardContent(BoardContent content) {
		dao.setIncreseViewCount(content);
		BoardContent _content = dao.getBoardContent(content);
		
		String writer = content.getWriter();
		String type = dao.getMember(writer).getAccountType();
		if("lessor".equals(type))
			writer += "(임대인)"; 
		else if("realtor".equals(type))
			writer += "(공인 중개사)"; 
		else if("lessee".equals(type))
			writer += "(임차인)";
		
		_content.setWriter(writer);
		return _content;
	}

	public int setUpdateBoard(BoardContent content) {
		dao.updateBoard(content);
		return content.getNo();
	}

	public int deleteBoardContent(BoardContent content) {
		int result = dao.deleteBoard(content);
		result = dao.deleteLike(content);
		return result;
	}

}

package com.gyu.realty.api.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gyu.realty.api.vo.BoardContent;
import com.gyu.realty.api.vo.MemberVo;

@Mapper
public interface MainInsertMapper {
	public int setInsertBoard(BoardContent content);
	public int getNo();
	public MemberVo getMember(String writer);
	public BoardContent getBoardContent(BoardContent content);
	public void setIncreseViewCount(BoardContent content);
	public int updateBoard(BoardContent content);
	public int deleteBoard(BoardContent content);
	public int deleteLike(BoardContent content);
}

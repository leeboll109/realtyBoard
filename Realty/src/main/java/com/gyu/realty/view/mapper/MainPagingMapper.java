package com.gyu.realty.view.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gyu.realty.api.vo.MemberVo;
import com.gyu.realty.view.vo.BoardContent;
import com.gyu.realty.view.vo.BoardPaging;

@Mapper
public interface MainPagingMapper {
	public List<BoardContent> getBoardListForPaging(BoardPaging paging);
	public int getTotalBoardListForPaging();
	public String getWriter(int no);
	public MemberVo selectMember(MemberVo vo);
	public MemberVo getMember(String member);
}

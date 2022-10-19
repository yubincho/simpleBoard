package com.example.site.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.site.domain.BoardDto;
import com.example.site.domain.SearchCondition;


@Mapper
public interface BoardMapper {
	
	public List<BoardDto> selectAll();
	public BoardDto findOne(Integer bno);
	
	public int count() throws Exception;
	public int deleteAll();
	public int delete(Integer bno) throws Exception;
	public int insert(BoardDto dto) throws Exception; 
	public List<BoardDto> selectPage(Map map) throws Exception;
	public int update(BoardDto dto) throws Exception;
	public int increaseViewCnt(Integer bno) throws Exception;
	
	public List<BoardDto> searchSelectPage(SearchCondition sc) throws Exception;
	public int searchResultCnt(SearchCondition sc) throws Exception;
	
	public int updateCommentCnt(Integer bno, int cnt);

}

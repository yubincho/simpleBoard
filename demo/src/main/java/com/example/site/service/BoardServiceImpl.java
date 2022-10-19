package com.example.site.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.site.domain.BoardDto;
import com.example.site.domain.SearchCondition;
import com.example.site.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@Transactional
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
	
	private final BoardMapper mapper;

	@Override
	public List<BoardDto> getList() throws Exception {	
		return mapper.selectAll();
	}

	@Override
	public BoardDto findOne(Integer bno) throws Exception {
		mapper.increaseViewCnt(bno);
		return mapper.findOne(bno);
	}

	@Override
	public int getCount() throws Exception {
		return mapper.count();
	}

	@Override
	public int remove(Integer bno) throws Exception {
		return mapper.delete(bno);
	}

	@Override
	public int write(BoardDto boardDto) throws Exception {
		 
		return mapper.insert(boardDto);
	}

	@Override
	public List<BoardDto> getPage(Map map) throws Exception {
		return mapper.selectPage(map);
	}

	@Override
	public int modify(BoardDto boardDto) throws Exception {
		return mapper.update(boardDto);
	}

	@Override
	public int getSearchResultCnt(SearchCondition sc) throws Exception {
		// TODO Auto-generated method stub
		return mapper.searchResultCnt(sc);
	}

	@Override
	public List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception {
		// TODO Auto-generated method stub
		 return mapper.searchSelectPage(sc);
	}
	
	

}

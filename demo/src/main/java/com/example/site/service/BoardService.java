package com.example.site.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.site.domain.BoardDto;
import com.example.site.domain.SearchCondition;
import com.example.site.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;



public interface BoardService {
	
	List<BoardDto> getList() throws Exception;
	BoardDto findOne(Integer bno) throws Exception;
	
	int getCount() throws Exception;
    int remove(Integer bno) throws Exception;
    int write(BoardDto boardDto) throws Exception;
    List<BoardDto> getPage(Map map) throws Exception;
    int modify(BoardDto boardDto) throws Exception;
    
    int getSearchResultCnt(SearchCondition sc) throws Exception;
    List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception;
	
}

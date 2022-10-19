package com.example.site.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.site.domain.BoardDto;
import com.example.site.domain.CommentDto;
import com.example.site.domain.SearchCondition;


@Mapper
public interface CommentMapper {
	
	int count(Integer bno) throws Exception;
    int deleteAll(Integer bno);
    int delete(Integer cno, String commenter) throws Exception;
    int insert(CommentDto dto) throws Exception;
    List<CommentDto> selectAll(Integer bno) throws Exception;
    CommentDto select(Integer cno) throws Exception;
    int update(CommentDto dto) throws Exception;

}

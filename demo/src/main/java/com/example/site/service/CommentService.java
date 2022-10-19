package com.example.site.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.example.site.domain.CommentDto;

public interface CommentService {
	
	public int getCount(Integer bno) throws Exception;

    public int remove(Integer cno, Integer bno, String commenter) throws Exception;

    public int write(CommentDto commentDto) throws Exception;

    public List<CommentDto> getList(Integer bno) throws Exception;

    public CommentDto read(Integer cno) throws Exception;

    public int modify(CommentDto commentDto) throws Exception;

	
}

package com.example.site.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.site.domain.CommentDto;
import com.example.site.mapper.BoardMapper;
import com.example.site.mapper.CommentMapper;

import lombok.RequiredArgsConstructor;

@Transactional
@RequiredArgsConstructor
@Service
public class CommentServiceImpl implements CommentService {

	private final BoardMapper boardMapper;
	private final CommentMapper commentMapper;
    
    @Override
    public int getCount(Integer bno) throws Exception {
        return commentMapper.count(bno);
    }

    @Override
    @Transactional(rollbackFor = Exception.class) //예외가 발생하면 롤백.
    public int remove(Integer cno, Integer bno, String commenter) throws Exception {
        int rowCnt = boardMapper.updateCommentCnt(bno, -1);
        System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
//        throw new Exception("test");
        rowCnt = commentMapper.delete(cno, commenter);
        System.out.println("rowCnt = " + rowCnt);
        return rowCnt;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(CommentDto commentDto) throws Exception {
    	boardMapper.updateCommentCnt(commentDto.getBno(), 1);
//                throw new Exception("test");
        return commentMapper.insert(commentDto);
    }

    @Override
    public List<CommentDto> getList(Integer bno) throws Exception {
//        throw new Exception("test");
        return commentMapper.selectAll(bno);
    }

    @Override
    public CommentDto read(Integer cno) throws Exception {
        return commentMapper.select(cno);
    }

    @Override
    public int modify(CommentDto commentDto) throws Exception {
        return commentMapper.update(commentDto);
    }

}

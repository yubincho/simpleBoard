package com.example.site.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.site.domain.CommentDto;
import com.example.site.service.CommentService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CommentController {
	
	private final CommentService service;
	
	
	@GetMapping("/test")
	public String test() {
		return "test";
	}
	
//	@ResponseBody
//	@GetMapping("/comments")
//	public ResponseEntity<List<CommentDto>> list(Integer bno) {
//		
//		List<CommentDto> list = null;
//		
//		try {
//			list = service.getList(bno);
//			return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK); // 200
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return new ResponseEntity<List<CommentDto>>(HttpStatus.BAD_REQUEST); // 400
//		}
//	
//	}
	
	@ResponseBody
	@GetMapping("/comments")
	public ResponseEntity<List<CommentDto>> list(Integer bno) {
		
		List<CommentDto> list = null;
		
		try {
			list = service.getList(bno);
			return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK); // 200
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<List<CommentDto>>(HttpStatus.BAD_REQUEST); // 400
		}
	
	}
	
	
	// 댓글 삭제
	@ResponseBody
	@DeleteMapping("/comments/{cno}") // /comments/1?bno=3
	public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session) {
		String commenter = (String)session.getAttribute("id"); // getAttribut 가 반환하는 것 object라서 String으로 변환
		
		//String commenter = "asdf";
		
		try {
			int rowCnt = service.remove(cno, bno, commenter);
			
			if(rowCnt != 1)
				throw new Exception("Delete Failed");
			
			return new ResponseEntity<>("DELETE_OK", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<>("DELETE_ERROR", HttpStatus.BAD_REQUEST);
		}
		
		
	}
	
	
	// 댓글 등록
	@ResponseBody
	@PostMapping("/comments")
	public ResponseEntity<String> write(@RequestBody CommentDto dto, Integer bno, HttpSession session) {
		String commenter = (String)session.getAttribute("id"); // getAttribut 가 반환하는 것 object라서 String으로 변환
		
		//String commenter = "asdf";
		dto.setCommenter(commenter);
		dto.setBno(bno);
		System.out.println("dto = " + dto);
		
		try {
			if(service.write(dto) != 1)
				throw new Exception("Write failed");
			
			return new ResponseEntity<>("WRITE_OK", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<String>("WRITE_ERROR", HttpStatus.BAD_REQUEST);
		}
		
	}
	
	
	// 댓글 수정
	@ResponseBody
	@PatchMapping("comments/{cno}")
	public ResponseEntity<String> modify(@PathVariable Integer cno, @RequestBody CommentDto dto, HttpSession session) {
		String commenter = (String)session.getAttribute("id"); // getAttribut 가 반환하는 것 object라서 String으로 변환
		
				//String commenter = "asdf";
				dto.setCommenter(commenter);
				dto.setCno(cno);
				System.out.println("dto = " + dto);
				
				try {
					if(service.modify(dto) != 1)
						throw new Exception("Write failed");
					
					return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return new ResponseEntity<String>("MOD_ERROR", HttpStatus.BAD_REQUEST);
				}
		
		
		
	}

}

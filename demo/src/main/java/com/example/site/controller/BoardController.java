package com.example.site.controller;

import com.example.site.domain.BoardDto;
import com.example.site.domain.PageHandler;
import com.example.site.domain.SearchCondition;
import com.example.site.mapper.BoardMapper;
import com.example.site.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/board")
public class BoardController {
    
	private final BoardService boardService;
    
	
//    @GetMapping("/boardList.do")
//	public String list(Integer page, Integer pageSize, Model m, HttpServletRequest request) {
////		if(!loginCheck(request))
////			return "redirect:/member/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
//    	
//    	if (page == null) page = 1;
//    	if (pageSize == null) pageSize = 10;
//    	
//    	try {
//    		int totalCnt = boardService.getCount();
//    		
//    		PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
//    		
//    		Map map = new HashMap();
//			map.put("offset", (page-1) * pageSize);
//			map.put("pageSize", pageSize);
//			
//			List<BoardDto> list = boardService.getPage(map);
//			
////			List<BoardDto> list = boardService.getList();
//			m.addAttribute("list", list);
//			m.addAttribute("ph", pageHandler);
//			
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//    	
//		return "board/boardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
//	}
//    
    
    @GetMapping("/boardList.do")
    public String list(Model m, SearchCondition sc, HttpServletRequest request) {
    	if(!loginCheck(request))
    		return "redirect:/memLogin.do";  // 로그인을 안했으면 로그인 화면으로 이동

        try {
            int totalCnt = boardService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);

            PageHandler pageHandler = new PageHandler(totalCnt, sc);

            List<BoardDto> list = boardService.getSearchResultPage(sc);
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);

            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
            m.addAttribute("totalCnt", 0);
        }

        return "board/boardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
    }

    

//    @GetMapping("/findOne/{bno}")
//    public String findOne(@PathVariable("bno") Integer bno, Model m){
//    		
//		try {
//			BoardDto boardDto = boardService.findOne(bno);
//			m.addAttribute("boardDto", boardDto);
//			log.info("boardDto"+ boardDto);
//			} catch (Exception e) {
//			e.printStackTrace();		
//		}  	
//    	return "board/boardContent";
//    }
    
    
    @GetMapping("/findOne")
    public String read(Integer bno, HttpSession session, SearchCondition sc, RedirectAttributes rattr, Model m, HttpServletRequest request) {
    	
    	String writer = (String)session.getAttribute("id");
    	System.out.println(writer);   
    	
        try {
            BoardDto boardDto = boardService.findOne(bno);
            m.addAttribute("boardDto", boardDto);
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "READ_ERR");
            return "redirect:/board/boardList"+sc.getQueryString();
        }

        return "board/boardContent";
    }
    

//    @GetMapping("/list")
//    public String list( Model m, HttpServletRequest request) {
//        // page와 pageSize를 int로 받으면 nullPointer 에러남. null을 허용하는 Integer를 사용해야.
////        if(!loginCheck(request))
////            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
//
//        try {
//
//            int totalCnt = boardService.getSearchResultCnt(sc);
//            m.addAttribute("totalCnt", totalCnt);
//
//            PageHandler pageHandler = new PageHandler(totalCnt, sc);
//
//
//            List<BoardDto> list = boardService.getSearchResultPage(sc);
//            m.addAttribute("list", list);
//            m.addAttribute("ph", pageHandler);
//
//            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
//            m.addAttribute("startOfToday", startOfToday.toEpochMilli());
//        } catch (Exception e) {
//            e.printStackTrace();
//            m.addAttribute("msg", "LIST_ERR");
//            m.addAttribute("totalCnt", 0);
//        }
//
//        return "boardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
//    }


//    @GetMapping("/read")
//    public String read(Integer bno, Integer page, Integer pageSize, Model m) {
//        try {
//            BoardDto boardDto = boardService.read(bno);
//            m.addAttribute(boardDto);
//            m.addAttribute("page", page);
//            m.addAttribute("pageSize", pageSize);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return "board";
//    }
    
    
//    @PostMapping("/remove")
//    public String remove(Integer bno, String writer, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr) {
//// String writer -> 삭제하기
////        String writer1 = (String) session.getAttribute("id");   // -> 추가하기
//
//        try{
//        	boardService.remove(bno, writer);
//        	
//            m.addAttribute("page", page);
//            m.addAttribute("pageSize", pageSize);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return "redirect:/board/boardList";
//    }


//    @PostMapping("/remove")
//    public String remove(Integer bno, String writer, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr) {
//// String writer -> 삭제하기
////        String writer = (String) session.getAttribute("id"); -> 추가하기
//
//        try{
//            m.addAttribute("page", page);
//            m.addAttribute("pageSize", pageSize);
//
//           int rowCnt =  boardService.remove(bno, writer);
//
//           if (rowCnt != 1) throw new Exception("remove error");
//
////           m.addAttribute("msg", "잘 삭제되었습니다.");
//            
//            // 에러 메시지 1번만 보여주기
//           rattr.addFlashAttribute("msg", "잘 삭제되었습니다.");
//
//        } catch (Exception e) {
//            e.printStackTrace();
////            m.addAttribute("msg", "DELETE ERROR");
//            rattr.addFlashAttribute("msg", "DELETE ERROR");
//        }
//
//        return "redirect:/board/list";
//    }
    
    @PostMapping("/remove")
    public String remove(Integer bno, SearchCondition sc, RedirectAttributes rattr, HttpSession session) {
        String writer = (String)session.getAttribute("id");
        String msg = "DEL_OK";
        
        System.out.println("id");       
        

        try {
            if(boardService.remove(bno)!=1)
                throw new Exception("Delete failed.");
        } catch (Exception e) {
            e.printStackTrace();
            msg = "DEL_ERR";
        }

        rattr.addFlashAttribute("msg", msg);
        return "redirect:/board/boardList.do"+sc.getQueryString();
    }

    
    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");
        return "board/boardWrite"; //읽기와 쓰기 모두 사용. 쓰기에 사용할때는 mode=new
    }

    @PostMapping("/write")
    public String write(BoardDto boardDto, Model m, HttpSession session, RedirectAttributes rattr) {
        //String writer, -> 삭제하기
    	String writer = (String)session.getAttribute("id");
    	System.out.println("id");   
        boardDto.setWriter(writer);

        try{
            int rowCnt = boardService.write(boardDto);
            if (rowCnt != 1) throw new Exception("Write failed!");

            rattr.addFlashAttribute("msg", "Write_OK");
            return "redirect:/board/boardList.do"; 

        }catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto); // 실패해도 입력한 내용이 유지됨
            rattr.addFlashAttribute("msg", "Write_Error");
            return "board/boardWrite";
        }

    }


//    @PostMapping("/modify")
//    public String modify(BoardDto boardDto, Model m, String writer, HttpSession session, RedirectAttributes rattr) {
//        //String writer, -> 삭제하기
////        String writer = (String)session.getAttribute("id");
//        boardDto.setWriter(writer);
//
//        try{
//            int rowCnt = boardService.modify(boardDto);
//            if (rowCnt != 1) throw new Exception("Modify failed!");
//
//            rattr.addFlashAttribute("msg", "Modify");
//            return "redirect:/board/list";
//
//        }catch (Exception e) {
//            e.printStackTrace();
//            m.addAttribute(boardDto);
//            rattr.addFlashAttribute("msg", "Modify_ERROR");
//            return "board/boardContent";
//        }
//
//    }
    
    
    @PostMapping("/modify")
    public String modify(BoardDto boardDto, SearchCondition sc, RedirectAttributes rattr, Model m, HttpSession session) {
        String writer = (String)session.getAttribute("id");
        boardDto.setWriter(writer);

        try {
            if (boardService.modify(boardDto)!= 1)
                throw new Exception("Modify failed.");

            rattr.addFlashAttribute("msg", "MOD_OK");
            return "redirect:/board/boardList.do"+sc.getQueryString();
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto);
            m.addAttribute("msg", "MOD_ERR");
            return "board/boardContent";
        }
    }


    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id")!=null;
    }
}

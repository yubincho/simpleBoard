## Springboot 기본 게시판 구현


##### 언어 : 자바 11, 패키징 : jar,  maven project, Springboot 버전 : 2.6.12


##### Spring의 MVC 구조


##### 기본적인 회원의 로그인/로그아웃, 정보수정(이미지 업로드 포함), 기본적인 게시글, 댓글, 대댓글의 CRUD와, 대댓글 까지만 허용하는 댓글의 계층구조 구현


* 로그인시 아이디 기억하기 (쿠키 사용)
@RequestMapping("/memLogin.do")
		public String memLogin(boolean rememberId, Member m, RedirectAttributes rttr, HttpSession session,  HttpServletRequest request, HttpServletResponse response) {
			if(m.getMemID()==null || m.getMemID().equals("") ||
			   m.getMemPassword()==null || m.getMemPassword().equals("")) {
			   rttr.addFlashAttribute("msgType", "실패 메세지");
			   rttr.addFlashAttribute("msg", "모든 내용을 입력해주세요.");
			   return "redirect:/memLogin.do";			
			}
			Member mvo=memberMapper.memLogin(m);
			if(mvo!=null) { // 로그인에 성공
			//  세션 객체를 얻어오기
		        
		        //  세션 객체에 id를 저장
		        session.setAttribute("id", m.getMemID());
		        
		        if(rememberId) {
		            //     1. 쿠키를 생성
		            Cookie cookie = new Cookie("id", m.getMemID()); // ctrl+shift+o 자동 import
//				       2. 응답에 저장
		            response.addCookie(cookie);
		        } else {
		            // 1. 쿠키를 삭제
		            Cookie cookie = new Cookie("id", m.getMemID()); // ctrl+shift+o 자동 import
		            cookie.setMaxAge(0); // 쿠키를 삭제
//				       2. 응답에 저장
		            response.addCookie(cookie);
		        }
		        
		        
			   rttr.addFlashAttribute("msgType", "성공 메세지");
			   rttr.addFlashAttribute("msg", "로그인에 성공했습니다.");
			   
			   session.setAttribute("mvo", mvo); // ${!empty mvo}
			   return "redirect:/";	 // 메인		
			}else { // 로그인에 실패
			   rttr.addFlashAttribute("msgType", "실패 메세지");
			   rttr.addFlashAttribute("msg", "다시 로그인 해주세요.");
			   return "redirect:/memLogin.do";
			}		
		}
    
    
    

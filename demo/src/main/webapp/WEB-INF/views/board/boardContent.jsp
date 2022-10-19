<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>

<%@ include file="../layout/header2.jsp" %>
<style>

body{margin-top:20px;
background:#eee;
}
.contact-area {
    background: url(../img/bg/contact-bg.png) no-repeat;
    background-attachment: fixed;
    background-size: cover;
    background-position: center;
}

@media only screen and (max-width:768px) {
    .contact {
        margin-bottom: 60px;
    }
}

.contact input {
    background: #fff;
    border: 1px solid #fff;
    border-radius: 3px;
    -webkit-box-shadow: none;
    box-shadow: none;
    color: #232434;
    font-size: 16px;
    height: 60px;
    padding: 10px;
    width: 100%;
    font-family: 'poppins', sans-serif;
    padding-left: 30px;
    -webkit-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
}

.contact textarea {
    background: #fff;
    border: 1px solid #fff;
    border-radius: 3px;
    -webkit-box-shadow: none;
    box-shadow: none;
    color: #232434;
    font-size: 16px;
    padding: 10px;
    width: 100%;
    font-family: 'poppins', sans-serif;
    padding-left: 30px;
    -webkit-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
}

.contact input:focus {
    background: #fff;
    border: 1px solid #fff;
    color: #232434;
    -webkit-box-shadow: none;
    box-shadow: none;
    outline: 0 none;
}

.contact textarea:focus {
    background: #fff;
    border: 1px solid #fff;
    color: #232434;
    -webkit-box-shadow: none;
    box-shadow: none;
    outline: 0 none;
}

.form-control::placeholder {
    color: #232434;
    opacity: 1;
}

.btn-contact-bg {
    border-radius: 30px;
    color: #fff;
    outline: medium none !important;
    padding: 15px 27px;
    text-transform: capitalize;
    -webkit-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
    background: #7564e5;
    font-family: 'poppins', sans-serif;
    cursor: pointer;
    width: 100%;
}

.btn-contact-bg:hover,
.btn-contact-bg:focus {
    background: #232434;
    color: #fff;
}

/*START ADDRESS*/

.single_address {
    overflow: hidden;
    margin-bottom: 10px;
    padding-left: 40px;
}

@media only screen and (max-width:768px) {
    .single_address {
        padding-left: 0px;
    }
}

.single_address i {
    background: #f6f6f6;
    color: #7564e5;
    border-radius: 30px;
    width: 60px;
    height: 60px;
    line-height: 60px;
    text-align: center;
    float: left;
    margin-right: 14px;
    font-size: 22px;
    -webkit-box-shadow: 0 5px 30px 0 rgba(0, 0, 0, 0.1);
    box-shadow: 0 5px 30px 0 rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    -webkit-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
}

.single_address:hover i {
    background: #7564e5;
    color: #fff;
}

.single_address h4 {
    font-size: 18px;
    margin-bottom: 0px;
    overflow: hidden;
    font-weight: 600;
}

.single_address p {
    overflow: hidden;
    margin-top: 5px;
}

.section-title h1 {
	font-family: 'poppins', sans-serif;
    font-size: 30px;
    font-weight: 600;
    margin-top: 0;
    position: relative;
    text-transform: capitalize;
    margin-bottom: 15px;
}
.section-title p {
    padding: 0 10px;
    width: 70%;
    margin: auto;
    letter-spacing: 1px;
}
.section-title {
    margin-bottom: 60px;
}
.text-center {
    text-align: center!important;
}

.clearfix {
list-style:none;
}

.comts {
	width:500px;
	height: 30px;
	
}

#text-success {
	
	height: 30px;
}

</style>
<script>

let msg = "${msg}";
if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");

</script>

<div id="contact" class="contact-area section-padding">
	<div class="container">										
		<div class="section-title text-center">
		<br/><br/><br/>
		
			<h2>게시판 읽기</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae risus nec dui venenatis dignissim. Aenean vitae metus in augue pretium ultrices.</p>
		</div>					
		<div class="row">
			<div class="col-lg-7">	
				<div class="contact">
					<form  id="form" class="frm form" name="enq" method="post" action="" >
						<div class="row">
							<input type="hidden" id="bno" name="bno" value="${boardDto.bno}">
							
							<div class="form-group col-md-12">
								<input type="text" name="title" class="form-control" placeholder="제목을 입력해 주세요." value="${boardDto.title}" readonly="readonly"}>
							</div>
							
							<div class="form-group col-md-12">
								<textarea rows="6" name="content" class="form-control" placeholder="내용을 입력해 주세요." readonly="readonly" >${boardDto.content}</textarea>
							</div>
							
							<div class="col-md-12 text-center">
					        <c:if test="${boardDto.writer eq mvo.memID}">
								<button type="submit" id="modifyBtn" value="Send message" name="submit" class="btn btn-contact-bg" style="margin:2px;">수정</button>
								<br/>
								<button type="submit" id="removeBtn" value="Send message" name="submit" class="btn btn-contact-bg" >삭제</button>
							</c:if>	
								<button type="button" id="listBtn" value="Send message" name="submit"  class="btn btn-contact-bg" style="margin:2px;"> 목록</button>
							</div>
						</div>
					</form>
				</div>
			</div><!--- END COL --> 
		
			
			<div class="col-lg-5">
				<div class="single_address">
					<i class="fa fa-map-marker"></i>
					<h4>Our Address</h4>
					<p>3481 Melrose Place, Beverly Hills</p>
				</div>
				<div class="single_address">
					<i class="fa fa-envelope"></i>
					<h4>Send your message</h4>
					<p>Info@example.com</p>
				</div>
				<div class="single_address">
					<i class="fa fa-phone"></i>
					<h4>Call us on</h4>
					<p>(+1) 517 397 7100</p>
				</div>
				<div class="single_address">
					<i class="fa fa-clock-o"></i>
					<h4>Work Time</h4>
					<p>Mon - Fri: 08.00 - 16.00. <br>Sat: 10.00 - 14.00</p>
				</div>					
			</div><!--- END COL --> 
		</div><!--- END ROW -->
	</div><!--- END CONTAINER -->	
</div>




<br/><br/>
<div class="container bootstrap snippets bootdey">
    <div class="row">
		<div class="col-md-12">
		    <div class="blog-comment">
<h3 class="text-success">Comments</h3>
                <hr/>
	
		
	<h3 class="text-success" id="text-success" >댓글을 남겨보세요.:</h3> <input type="text" class="comts" name="comment" /><br/><br/>

    <button id="sendBtn" type="button" class="btn btn-contact-bg" style="width:80px;">SEND</button>
    <button id="modBtn" type="button" class="btn btn-contact-bg" style="width:80px;">수정</button>
   <br/><br/><hr>
   
    <div id="commentList" ></div>
    <div id="replyForm" style="display:none;">
    	<input type="text" name="replyComment">
    	<button id="wrtRepBtn" type="button" class="btn btn-contact-bg" style="width:80px;">등록</button>
    	<button id="btn-cancel-reply" type="button" class="btn btn-contact-bg" style="width:80px;">취소</button>
    </div>
	  </div>
	  </div>
	  </div>

</div>

 <script type="text/javascript">
 
 $(document).ready(function(){
     let formCheck = function() {
         let form = document.getElementById("form");
         if(form.title.value=="") {
             alert("제목을 입력해 주세요.");
             form.title.focus();
             return false;
         }
         if(form.content.value=="") {
             alert("내용을 입력해 주세요.");
             form.content.focus();
             return false;
         }
         return true;
     }
     
     
     $("#modifyBtn").on("click", function(){
         let form = $("#form");
         let isReadonly = $("input[name=title]").attr('readonly');
         // 1. 읽기 상태이면, 수정 상태로 변경
         if(isReadonly=='readonly') {
             $("h2").html("게시물 수정");
             $("input[name=title]").attr('readonly', false);
             $("textarea").attr('readonly', false);
             $("#modifyBtn").html("등록");
             return false; // 수정된 상태일때 밖으로 빠져나감. 그렇지 않으면 전송됨
         }
         // 2. 수정 상태이면, 수정된 내용을 서버로 전송
         form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>");
         form.attr("method", "post");
         if(formCheck())
             form.submit();
     });
     
     $("#removeBtn").on("click", function(){
         if(!confirm("정말로 삭제하시겠습니까?")) 
        	 return;
         let form = $("#form");
         form.attr("action", "<c:url value='/board/remove?${searchCondition.queryString}'/>");
         form.attr("method", "post");
         form.submit();
     });
     $("#listBtn").on("click", function(){
    	 //alert("listBtn clicked");
         location.href="<c:url value='/board/boardList.do?${searchCondition.queryString}'/>";
     });
 });
 
 
 
 
 // ------------------------- 댓글 시작
 
 // let bno = ${boardDto.bno};
 
 
 //let bno = $("input[name=bno]").val();
 let bno = document.getElementById("bno").value;
 
 let showList = function(bno) {
 	$.ajax({
         type:'GET',       // 요청 메서드
         url: '/site/comments?bno='+bno,  // 요청 URI
         success : function(result){
             $("#commentList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
         },
         error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
     }); // $.ajax()
 }

 
 // 댓글 등록
     $(document).ready(function(){
     	showList(bno);

         $("#sendBtn").click(function(){
         	
         	let comment = $("input[name=comment]").val();
         	
         	if(comment.trim() == ''){
         		$("input[name=comment]").focus()
         		return false;
         	}
         	
         	$.ajax({
                 type:'POST',       // 요청 메서드 
                 url: '/site/comments?bno='+bno,  // 요청 URI  site/comments?bno=3
                 headers : { "content-type": "application/json"}, // 요청 헤더
                 data : JSON.stringify({bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                 success : function(result){
                 	alert(result)
                 	showList(bno); 
                 },
                 error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
             });
	
         });
         
         
         // 수정
     	$("#commentList").on("click", ".modBtn", function() {
     		
     		let cno = $(this).parent().attr("data-cno");
     		let comment = $("div.comment", $(this).parent()).text(); // $(this).parent()) : li
     		
     		// 1. comment의 내용을 input에 뿌려주기
     		$("input[name=comment]").val(comment);
     		
     		// 2. cno 전달하기
     		$("#modBtn").attr("data-cno", cno);
     	});
 
			$("#modBtn").on("click", function() {
     		
				let comment = $("input[name=comment]").val();
				let cno = $(this).attr("data-cno");
				
				if(comment.trim() == ''){
         		$("input[name=comment]").focus()
         		return false;
         	}
     
     		$.ajax({
                 type:'PATCH',       // 요청 메서드
                 url: '/site/comments/'+cno,  // 요청 URI
                 headers : { "content-type": "application/json"}, // 요청 헤더
                 data : JSON.stringify({cno:cno, comment:comment}), 
                 success : function(result){
                      alert(result)
                      showList(bno)
                 },
                 error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
             }); 
     	});
  
         
      //  $(".delBtn").click(function(){
     	$("#commentList").on("click", ".delBtn", function() {
     		
     		let cno = $(this).parent().attr("data-cno");
     		let bno = $(this).parent().attr("data-bno");
     
     		$.ajax({
                 type:'DELETE',       // 요청 메서드
                 url: '/site/comments/'+cno+'?bno='+bno,  // 요청 URI
                 success : function(result){
                      alert(result)
                      showList(bno)
                 },
                 error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
             }); 
     	});
            
  });  
      
  $("#btn-cancel-reply").click(function(e){
      $("#replyForm").css("display", "none");
  });
      
      
		// 답글    
  $("#wrtRepBtn").click(function(){
  	
  	let comment = $("input[name=replyComment]").val();
  	let pcno = $("#replyForm").parent().attr("data-pcno");
  	
  	if(comment.trim() == ''){
  		$("input[name=replyComment]").focus()
  		return false;
  	}
  	
  	$.ajax({
          type:'POST',       // 요청 메서드 
          url: '/site/comments?bno='+bno,  // 요청 URI  site/comments?bno=3
          headers : { "content-type": "application/json"}, // 요청 헤더
          data : JSON.stringify({pcno:pcno, bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
          success : function(result){
          	alert(result)
          	showList(bno); 
          },
          error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
      });
  	
  	$("#replyForm").css("display", "none");
  	$("input[name=replyComment]").val('');
  	$("#replyForm").appendTo("body"); // 원래 위치로 되돌림

  });
  
      
      
	// 답글 입력 폼 보여주기
	$("#commentList").on("click", ".replyBtn", function() {
		// 1. replyForm을 옮기고
		$("#replyForm").appendTo($(this).parent()); // li 태그 뒤에 붙음
		
		// 2. 답글을 입력할 폼을 보여주고
		$("#replyForm").css("display", "block");
		
	});
	
     
  let toHtml = function(result) {
 	 let tmp = "<ul>";
 	 
 	 result.forEach(function(comment){
 		 
 		 tmp += '<li class="clearfix" data-cno='+comment.cno
 		 tmp += ' data-pcno=' + comment.pcno
 		 tmp += ' data-bno=' + comment.bno + '>'
 		 if(comment.cno != comment.pcno)
 			 tmp += '<span style="padding-left: 5px; font-size:20px;">ㄴ</span>'
 		 tmp += ' <span class="commenter " style="padding-left:5px; font-size:20px;">' + comment.commenter + '</span>'
 		 tmp += ' <div class="text-success" style="font-size:15px;">' + comment.comment + '</div>'
 		 tmp += ' <span class="up_date">' + comment.up_date + '</span>'
 		 tmp += '<button class="delBtn btn btn-contact-bg" style="width:80px;">삭제</button>'
 		 tmp += '<button class="modBtn btn btn-contact-bg" style="width:80px;">수정</button>'
 		 tmp += '<button class="replyBtn btn btn-contact-bg" style="width:80px;">답글</button>'
 		 tmp += '</li>'
     
 	 })
 	 
 	 return tmp + "</ul>";
 	 
 	
 	 
 	 
  }
  
 
 </script>
 

 


<%@ include file="../layout/footer.jsp" %>
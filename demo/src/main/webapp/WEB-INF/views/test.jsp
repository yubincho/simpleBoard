<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/font-awesome.min.css">

<style>

.container3 {

}

.commentList {
	width : 50%;
    margin : auto;
}

li {
	
    list-style-type: none;
    border-bottom : 1px solid rgb(235,236,239);
    padding : 18px 18px 0 18px;


}
</style>
</head>

<div class="container3">

<br/><br/>
	<h2>Comment </h2>
	
		
	댓글을 남겨보세요.: <input type="text" name="comment" /><br/>

    <button id="sendBtn" type="button">SEND</button>
    <button id="modBtn" type="button">수정</button>
    <h2>Data From Server :</h2>
    <div id="commentList${temp.bno}">${list}</div>
    <div id="replyForm" style="display:none;">
    	<input type="text" name="replyComment">
    	<button id="wrtRepBtn" type="button" >등록</button>
    	<button id="btn-cancel-reply" type="button" >취소</button>
    </div>
	  

</div>
    <script>
    
   
    
 
    
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
        	showList();

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
    		 
    		 tmp += '<li data-cno='+comment.cno
    		 tmp += ' data-pcno=' + comment.pcno
    		 tmp += ' data-bno=' + comment.bno + '>'
    		 if(comment.cno != comment.pcno)
    			 tmp += 'ㄴ'
    		 tmp += ' <span class="commenter">' + comment.commenter + '</span>'
    		 tmp += ' <div class="comment">' + comment.comment + '</div>'
    		 tmp += ' <span class="up_date">' + comment.up_date + '</span>'
    		 tmp += '<button class="delBtn">삭제</button>'
    		 tmp += '<button class="modBtn">수정</button>'
    		 tmp += '<button class="replyBtn">답글</button>'
    		 tmp += '</li>'
        
    	 })
    	 
    	 return tmp + "</ul>";
    	 
    	 
    	 
    	 
     }
     
     
     
        
    </script>
</body>
</html>
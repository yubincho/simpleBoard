<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <style>

* {
    border : 0;
    padding : 0;
}

ul {
    border:  1px solid rgb(235,236,239);
    border-bottom : 0;
}

li {
    background-color: #f9f9fa;
    list-style-type: none;
    border-bottom : 1px solid rgb(235,236,239);
    padding : 18px 18px 0 18px;
}

#commentList {
    width : 50%;
    margin : auto;
}

.comment-content {
    overflow-wrap: break-word;
}

.comment-bottom {
    font-size:9pt;
    color : rgb(97,97,97);
    padding: 8px 0 8px 0;
}

.comment-bottom > a {
    color : rgb(97,97,97);
    text-decoration: none;
    margin : 0 6px 0 0;
}

.comment-area {
    padding : 0 0 0 46px;
}

.commenter {
    font-size:12pt;
    font-weight:bold;
}

.commenter-writebox {
    padding : 15px 20px 20px 20px;
}

.comment-img {
    font-size:36px;
    position: absolute;
}

.comment-item {
    position:relative;
}

.up_date {
    margin : 0 8px 0 0;
}

#comment-writebox {
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
}

textarea {
    display: block;
    width: 100%;
    min-height: 17px;
    padding: 0 20px;
    border: 0;
    outline: 0;
    font-size: 13px;
    resize: none;
    box-sizing: border-box;
    background: transparent;
    overflow-wrap: break-word;
    overflow-x: hidden;
    overflow-y: auto;
}

#comment-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

.btn {
    font-size:10pt;
    color : black;
    background-color: #eff0f2;
    text-decoration: none;
    padding : 9px 10px 9px 10px;
    border-radius: 5px;
    float : right;
}

#btn-write-comment, #btn-write-reply { 
    color : #009f47;
    background-color: #e0f8eb;
}

#btn-cancel-reply { 
    background-color: #eff0f2;
    margin-right : 10px;
}

#btn-write-modify { 
    color : #009f47;
    background-color: #e0f8eb;
}

#btn-cancel-modify { 
    margin-right : 10px;
}

#reply-writebox {
    display : none;
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
    margin : 10px;
}

#reply-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

#modify-writebox {
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
    margin : 10px;
}

#modify-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}



.paging {
    color: black;
    width: 100%;
    text-align: center;
}

.page {
    color: black;
    text-decoration: none;
    padding: 6px;
    margin-right: 10px;
}

.paging-active {
    background-color: rgb(216, 216, 216);
    border-radius: 5px;
    color: rgb(24, 24, 24);
}

.paging-container {
    width:100%;
    height: 70px;
    margin-top: 50px;
    margin : auto;
}



    </style>
</head>
<body>

    <div id="commentList">
        
    </div>	
    
        <div id="comment-writebox">
            <div class="commenter commenter-writebox">${id}</div>
            <div class="comment-writebox-content">
                <input name="comment" id="" cols="30" rows="3" placeholder="????????? ???????????????">
            </div>
            <div id="comment-writebox-bottom">
                <div class="register-box">
                    <a href="#" class="btn" id="btn-write-comment">??????</a>
                </div>
            </div>
        </div>
        
        <div id="replyForm" style="display:none;">
    		<input type="text" name="replyComment">
    		<button id="wrtRepBtn" type="button" >??????</button>
    	</div>
	
    <div id="reply-writebox">
        <div class="commenter commenter-writebox">${id}</div>
        <div class="reply-writebox-content">
            <input name="replyComment" id="" cols="30" rows="3" placeholder="????????? ???????????????">
        </div>
        <div id="reply-writebox-bottom">
            <div class="register-box">
                <button class="btn" id="btn-write-reply">??????</button>
                <button class="btn" id="btn-cancel-reply">??????</button> 
            </div>
        </div>
    </div>
    <div id="modalWin" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>
            <h2> | ?????? ??????</h2>
            <div id="modify-writebox">
                <div class="commenter commenter-writebox"></div>
                <div class="modify-writebox-content">
                    <textarea name="" id="" cols="30" rows="5" placeholder="????????? ???????????????"></textarea>
                </div>
                <div id="modify-writebox-bottom">
                    <div class="register-box">
                        <button class="btn" id="btn-write-modify">??????</button>
                    </div>
                </div>
            </div>
            </p>
        </div>
    </div>
    <script>
        
    	
    
        let addZero = function(value=1){
            return value > 9 ? value : "0"+value;
        }

        let dateToString = function(ms=0) {
            let date = new Date(ms);

            let yyyy = date.getFullYear();
            let mm = addZero(date.getMonth() + 1);
            let dd = addZero(date.getDate());

            let HH = addZero(date.getHours());
            let MM = addZero(date.getMinutes());
            let ss = addZero(date.getSeconds());          

            return yyyy+"."+mm+"."+dd+ " " + HH + ":" + MM + ":" + ss;            
        }
        
        
        let showLists = function(data) {
        	let bno;
        	for(const i in data){
        		bno = data[i].bno;
        	} return bno;
        	
        	$.ajax({
                type:'GET',       // ?????? ?????????
                url: '/site/comments?bno='+bno,  // ?????? URI
                data:JSON.stringify(data), // ????????? ?????? ????????? ????????? JSON?????? ????????? ???????????? ??????
                contentType:"application/json; charset=utf-8", 
                success : function(result){
                    $("#commentList").html(toHtmls(result));    // ??????????????? ????????? ???????????? ????????? ??????
                },
                error   : function(){ alert("error") } // ????????? ???????????? ???, ????????? ??????
            }); // $.ajax()
        }
        

        $(document).ready(function(){	
        	showLists();

        	// ?????? ??????
        	$("#btn-write-comment").click(function(){
            	
            	let comment = $("input[name=comment]").val();
            	
            	if(comment.trim() == ''){
            		$("input[name=comment]").focus()
            		return false;
            	}
            	
            	$.ajax({
                    type:'POST',       // ?????? ????????? 
                    url: '/site/comments?bno='+bno,  // ?????? URI  site/comments?bno=3
                    headers : { "content-type": "application/json"}, // ?????? ??????
                    data : JSON.stringify({bno:bno, comment:comment}),  // ????????? ????????? ?????????. stringify()??? ????????? ??????.
                    success : function(result){
                    	alert(result)
                    	showList(bno); 
                    },
                    error   : function(){ alert("error") } // ????????? ???????????? ???, ????????? ??????
                });
	
            });
        	
            
        	
        	
        	

            $("#btn-cancel-reply").click(function(e){
                $("#reply-writebox").css("display", "none");
            });

            $("a.btn-modify").click(function(e){
                let target = e.target;
                let cno = target.getAttribute("data-cno");
                let bno = target.getAttribute("data-bno");
                let pcno = target.getAttribute("data-pcno");
                let li = $("li[data-cno="+cno+"]");
                let commenter = $(".commenter", li).first().text();
                let comment = $(".comment-content", li).first().text();

                $("#modalWin .commenter").text(commenter);
                $("#modalWin textarea").text(comment);
                $("#btn-write-modify").attr("data-cno", cno);
                $("#btn-write-modify").attr("data-pcno", pcno);
                $("#btn-write-modify").attr("data-bno", bno);

                // ???????????? ?????? ????????? ????????????.
                $("#modalWin").css("display","block");
            });

            $("a.btn-delete").click(function(e){
                alert("delete");
            });

            $("#btn-write-modify").click(function(){
                // 1. ????????? ????????? ????????? ??????
                // 2. ?????? ?????? ?????????. 
                $(".close").trigger("click");
            });

            $(".close").click(function(){
                $("#modalWin").css("display","none");
            });
        });
        
        
    	// ??????(?????????) ??????
        $("#btn-write-reply").click(function(){
        	
        	let comment = $("input[name=replyComment]").val();
        	let pcno = $("#reply-writebox").parent().attr("data-pcno");
        	
        	if(comment.trim() == ''){
        		$("input[name=replyComment]").focus()
        		return false;
        	}
        	
        	$.ajax({
                type:'POST',       // ?????? ????????? 
                url: '/site/comments?bno='+bno,  // ?????? URI  site/comments?bno=3
                headers : { "content-type": "application/json"}, // ?????? ??????
                data : JSON.stringify({pcno:pcno, bno:bno, comment:comment}),  // ????????? ????????? ?????????. stringify()??? ????????? ??????.
                success : function(result){
                	alert(result)
                	showList(bno); 
                },
                error   : function(){ alert("error") } // ????????? ???????????? ???, ????????? ??????
            });
        	
        	$("#reply-writebox").css("display", "none");
        	$("input[name=replyComment]").val('');
        	$("#reply-writebox").appendTo("body"); // ?????? ????????? ?????????

        });
        $("#wrtRepBtn").click(function(){
         	
         	let comment = $("input[name=replyComment]").val();
         	let pcno = $("#replyForm").parent().attr("data-pcno");
         	
         	if(comment.trim() == ''){
         		$("input[name=replyComment]").focus()
         		return false;
         	}
         	
         	$.ajax({
                 type:'POST',       // ?????? ????????? 
                 url: '/site/comments?bno='+bno,  // ?????? URI  site/comments?bno=3
                 headers : { "content-type": "application/json"}, // ?????? ??????
                 data : JSON.stringify({pcno:pcno, bno:bno, comment:comment}),  // ????????? ????????? ?????????. stringify()??? ????????? ??????.
                 success : function(result){
                 	alert(result)
                 	showList(bno); 
                 },
                 error   : function(){ alert("error") } // ????????? ???????????? ???, ????????? ??????
             });
         	
         	$("#replyForm").css("display", "none");
         	$("input[name=replyComment]").val('');
         	$("#replyForm").appendTo("body"); // ?????? ????????? ?????????

         });
        
        
     	
     	$("#commentList").on("click", ".replyBtn", function() {
     		// 1. replyForm??? ?????????
     		$("#replyForm").appendTo($(this).parent()); // li ?????? ?????? ??????
     		
     		// 2. ????????? ????????? ?????? ????????????
     		$("#replyForm").css("display", "block");
     		
     	});
            
            
            let toHtmls = function(data) {
           		let tmp = "<ul>";
           	 
           		data.forEach(function(comment){
           		 
           		tmp += '<li class="comment-item" data-cno='+comment.cno
           		tmp += ' data-pcno=' + comment.pcno
           		tmp += ' data-bno=' + comment.bno + '>'
           		if(comment.cno != comment.pcno)
           			 tmp += '???'

       		 	tmp += ' <span class="comment-img">'
       		 	tmp += ' <i class="fa fa-user-circle" aria-hidden="true">'
       		 	tmp += ' </i>'
       		 	tmp += ' </span>'
       		 	tmp += ' <div class="comment-area">'
       		
           		tmp += ' <div class="commenter">' + comment.commenter + '</div>'

           		tmp += ' <div class="comment">' + comment.comment + '</div>'

       		 	tmp += ' <div class="comment-bottom">' 
           		tmp += ' <span class="up_date">' + comment.up_date + '</span>'

           		tmp += ' <button class="delBtn">??????</button>'
           		tmp += ' <button class="modBtn">??????</button>'
           		tmp += ' <button class="replyBtn">????????????</button>'

           		tmp += ' </div>'
       			tmp += '</div>'
       			tmp += '</li>'
           		 
           	 })
           	 
           	 return tmp + "</ul>";
            }
            
            
            
       
    </script>
</body>
</html>
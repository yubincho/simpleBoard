<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
		
			<h2>게시판 글쓰기</h2>
			<br/>
		</div>					
		<div class="row">
			<div class="col-lg-7">	
				<div class="contact">
					<form  id="form" class="frm form" name="enq" method="post" action="" >
						<div class="row">
							
							
							<div class="form-group col-md-12">
								<input type="text" name="title" class="form-control" placeholder="제목을 입력해 주세요." value="${boardDto.title}">
							</div>
							
							<div class="form-group col-md-12">
								<textarea rows="6" name="content" class="form-control" placeholder="내용을 입력해 주세요." value="${boardDto.content}"></textarea>
							</div>
							
						
							
							<div class="col-md-12 text-center">
							
					            <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
								<button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
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
     
     $("#writeBtn").on("click", function(){
         let form = $("#form");
         form.attr("action", "<c:url value='/board/write'/>");
         form.attr("method", "post");
         if(formCheck())
             form.submit();
     });
    
     $("#listBtn").on("click", function(){
    	 //alert("listBtn clicked");
         location.href="<c:url value='/board/boardList.do?${searchCondition.queryString}'/>";
     });
 });
 
 
 
 </script>

<%@ include file="../layout/footer.jsp" %>
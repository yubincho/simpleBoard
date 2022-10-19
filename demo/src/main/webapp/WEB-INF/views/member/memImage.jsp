<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>

<%@ include file="../layout/header2.jsp" %>

<div class="container">
	<div class="panel panel-default">
	<br/>    <br/>
    <div class="panel-heading"></div>
    <h2>회원 사진 등록</h2>
    <br/>    <br/>
    <div class="panel-body">
      <form action="${contextPath}/memImageUpdate.do" method="post" enctype="multipart/form-data">
         <input type="hidden" name="memID" value="${mvo.memID}"/>
         <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
           <tr>
             <td style="width: 110px; vertical-align: middle;">아이디</td>
             <td>${mvo.memID}</td>
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">사진 업로드</td>
             <td colspan="2">
               <span class="btn btn-default">
                 이미지를 업로드하세요.<input type="file" name="memProfile" />
                 
               </span>
             </td>            
           </tr>      
           <tr>
             <td colspan="2" style="text-align: left;">
                <input type="submit" class="btn btn-primary btn-sm pull-right" value="등록"/>
             </td>             
           </tr>
         </table>
      </form> 
    </div>
    
     <form action="uploadOk" method="post" enctype="multipart/form-data">       
    	<input type="file" name="filename"> <br />       
    	 <input type="submit" value="File Upload">    
    	</form>

    
   	<!-- 실패 메세지를 출력(modal) -->
	<div id="myMessage" class="modal fade" role="dialog" >
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div id="messageType" class="modal-content panel-info">
	      <div class="modal-header panel-heading">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">${msgType}</h4>
	      </div>
	      <div class="modal-body">
	        <p>${msg}</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>	
	  </div>
	</div>   

  </div>
</div>


 <script type="text/javascript">
 $(document).ready(function(){
 	if(${!empty msgType}){
  		$("#messageType").attr("class", "modal-content panel-warning");    
 		$("#myMessage").modal("show");
 	}
 });
 

  </script>

<%@ include file="../layout/footer.jsp" %>

</body>
</html>

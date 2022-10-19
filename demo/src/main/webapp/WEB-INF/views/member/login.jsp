<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>


<%@ include file="../layout/header2.jsp" %>


<div class="panel panel-default">
    <div class="panel-heading">로그인화면</div>
    <div class="panel-body">
      <form name="frm" action="${contextPath}/memLogin.do" method="post">
         <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
           <tr>
             <td style="width: 110px; vertical-align: middle;">아이디</td>
             <td><input id="memID" name="memID" class="form-control" type="text" maxlength="20" placeholder="아이디를 입력하세요." value="${cookie.id.value}"/></td>
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">비밀번호</td>
             <td colspan="2"><input id="memPassword" name="memPassword" class="form-control" type="password" maxlength="20" placeholder="비밀번호를 입력하세요."/></td>            
           </tr>      
           
           <tr>
           <td><label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label></td>
           </tr>
           
           
           <tr>
             <td colspan="2" style="text-align: left;">
                <input type="submit" class="btn btn-primary btn-sm pull-right" value="로그인"/>
             </td>             
           </tr>
         </table>
      </form> 
    </div>
    
    <!--  다이얼로그창(모달) -->
    <!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog" >
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div id="checkType" class="modal-content panel-info">
	      <div class="modal-header panel-heading">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">메세지 확인</h4>
	      </div>
	      <div class="modal-body">
	        <p id="checkMessage"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>	
	  </div>
	</div> 
    
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



 <script type="text/javascript">
$(document).ready(function(){
	if(${!empty msgType}){
 		$("#messageType").attr("class", "modal-content panel-success");    
		$("#myMessage").modal("show");
	}
});  
</script>
   
<%@ include file="../layout/footer.jsp" %>

</body>
</html>
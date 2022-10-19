<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>


<%@ include file="../layout/header2.jsp" %>
<style>
.img-user{
    width:350px;
    height:200px;
}

.jumbotron label {
    font-size:12px;    
}

.reg-icon{
    color:#5bc0de;
    font-weight:bold;
}

.nav-pills>li.active>a, .nav-pills>li.active>a:hover, .nav-pills>li.active>a:focus {
    color: #fff;
    background-color: #5bc0de;
}

.prj-name{
    font-weight:bold;
    color:#5bc0de;
}

</style>

<div class="container bootstrap snippets bootdey">
  <div class="header">
  <br/><br/>
    <h3 class="text-muted prj-name">카테고리 등록</h3>
  </div>

  <div class="jumbotron" style="height:auto;min-height:300px;">
    <div class="col-md-4">
       <img src="https://bootdey.com/img/Content/Manbrown2.png" class="img-responsive center-block img-user"> 
    </div>
    <div class="col-md-6 form-content">
        <form id="form" class="form-horizontal" role="form" action="${contextPath}/category/insert" method="post">
            <div class="form-group text-center">
                <div class="col-sm-10 reg-icon">
                    <span class="fa fa-user fa-2x"></span>
                </div>
            </div>
              <div class="form-group">
                <div class="col-sm-10">
                  <input type="text" form:input path="name" name="name" class="form-control" id="categoryName" placeholder="카테고리를 입력하세요.">
                  <p><font color="red"><form:errors path="name" /></font>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-10">
                  <button type="submit" id="rSubmit" class="btn btn-info">
                    <span class="glyphicon glyphicon-share-alt"></span>
                    제출
                  </button>
                   <button type="submit" id="back" class="btn btn-warning">
                    <span class="glyphicon glyphicon-share-alt"></span>
                    목록으로
                  </button>
                </div>
              </div>
        </form>
    </div>
  </div>
</div>                                        



 <script type="text/javascript">
$(document).ready(function() {
	let formCheck = function() {
		let form = document.getElementById("form");
		if(form.name.value=="") {
            alert("카티고리를 입력해 주세요.");
            form.name.focus();
            return false;
        }
        return true;
    }


    $("#rSubmit").on("click", function(){
        let form = $("#form");
        form.attr("action", "<c:url value='/category/insert'/>");
        form.attr("method", "post");
        if(formCheck())
            form.submit();
    });

    $("#back").on("click", function(){
    	location.href="<c:url value='/category/list'/>";
    });

})
</script>
   
<%@ include file="../layout/footer.jsp" %>

</body>
</html>
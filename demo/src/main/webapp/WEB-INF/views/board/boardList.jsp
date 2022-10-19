<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>

<%@ include file="../layout/header2.jsp" %>

<div class="container">

<br/><br/>





  <div class="col">
    <div class="e-tabs mb-3 px-3">
      <ul class="nav nav-tabs">
        <li class="nav-item"><a class="nav-link active" href="#">Users</a></li>
      </ul>
    </div>
    
    <form action="<c:url value="/board/boardList.do"/>" class="search-form" method="get">
                <select class="search-option" name="option">
                    <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
                    <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
                    <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
                </select>

                <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
                <input type="submit" class="search-button" value="검색">
     </form>

    <div class="row flex-lg-nowrap">
      <div class="col mb-3">
        <div class="e-panel card">
          <div class="card-body">
            <div class="card-title">
              <h6 class="mr-2"><span>Users</span><small class="px-1">Be a wise leader</small></h6>
            </div>
            <div class="e-table">
              <div class="table-responsive table-lg mt-3">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th class="max-width">번호</th>
                      <th class="max-width">writer</th>
                      <th class="max-width">제목</th>
                      <th class="sortable">등록일</th>
                      <th class="max-width">댓글수</th>
                      <th class="max-width">조회수</th>
                    </tr>
                  </thead>
                  <tbody>
                   <c:forEach var="board" items="${list}">
                    <tr>
                      <td class="align-middle">
                        <div class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0 align-top">
                          ${board.bno}
                        </div>
                      </td>
                      <td class="align-middle text-center">
                        <div class="bg-light d-inline-flex justify-content-center align-items-center align-top" style="width: 35px; height: 35px; border-radius: 3px;">${board.writer}</div>
                      </td>
                      <td class="text-nowrap align-middle"><a href="<c:url value="/board/findOne${ph.sc.queryString}&bno=${board.bno}"/>">${board.title}</a></td>
                      <c:choose>  
                        <c:when test="${board.reg_date.time >= startOfToday}">
                      <td class="text-nowrap align-middle"><span><fmt:formatDate value="${board.reg_date}" pattern="HH:mm" type="time"/></span></td>
                      </c:when>
                        <c:otherwise>
                       <td class="text-nowrap align-middle"><span><fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd" type="date"/></span></td>
                       </c:otherwise>
                    </c:choose>	
                      <td class="text-nowrap align-middle">${board.comment_cnt}</td>
                      <td class="text-nowrap align-middle">${board.view_cnt}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                   </table>
                   
                   	</div>
                   	<br/>
                   	<c:if test="${!empty mvo}" >
                   	 <button type="button" id="writeBtn" class="" onclick="location.href='<c:url value='/board/write'/>' "> 글쓰기</button>
                   	</c:if>
                   	
                   	<div class="d-flex justify-content-center" style="padding:70px;">
                   	 <c:if test="${totalCnt==null || totalCnt==0}">
                    	<div style="font-size: 20px;"> "게시물이 없습니다." </div>
                	 </c:if>
		                <ul class="pagination mt-3 mb-0" style="font-size:25px;">
		                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    		<c:if test="${ph.showPrev}">
		                  <li class="page-item"><a class="page" href="<c:url value="/board/boardList.do${ph.sc.getQueryString(ph.beginPage-1)}"/>">‹</a></li>
		                  	</c:if>
		                  <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
		                  	<li class="page-item" style="margin:3.5px; "><a class="page ${i==ph.sc.page? "page-item" : ""}" href="<c:url value="/board/boardList.do${ph.sc.getQueryString(i)}"/>">${i}</a></li>
		                  </c:forEach>
                    	  <c:if test="${ph.showNext}">
		                  	<li class="page-item"><a class="page" href="<c:url value="/board/boardList.do${ph.sc.getQueryString(ph.endPage+1)}"/>">›</a></li>
		                  	 <li class="page-item"><a href="#" class="page-link">»</a></li>
		                  </c:if>
		                </c:if>  
		                </ul>
                    </div>
                   	
                   </div>
                   </div>
                   </div>
                  </div>
				</div>
			</div>
		</div>
</div>

 <script type="text/javascript">
 </script>

<%@ include file="../layout/footer.jsp" %>
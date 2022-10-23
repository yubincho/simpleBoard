<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/css/index.css'/>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<head profile="http://www.w3.org/2005/10/profile">

<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>

</head>
<body>
<header class="header-area overlay">
    <nav class="navbar navbar-expand-md navbar-dark">
		<div class="container">
			<a href="#" class="navbar-brand">Simple Board</a>
			
			
			<button type="button" class="navbar-toggler collapsed" data-toggle="collapse" data-target="#main-nav">
				<span class="menu-icon-bar"></span>
				<span class="menu-icon-bar"></span>
				<span class="menu-icon-bar"></span>
			</button>
			
			<div id="main-nav" class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto">
					<li><a href="${contextPath}/home" class="nav-item nav-link active">Home</a></li>
					
					
					
					
					<li><a href="${contextPath}/board/boardList.do" class="nav-item nav-link">관리자 전용</a></li>
					
					<li><a href="${contextPath}/board/boardList.do" class="nav-item nav-link">게시판</a></li>
					
					
					<c:if test="${empty mvo}" >
					<li><a href="${contextPath}/memLogin.do" class="nav-item nav-link">로그인</a></li>
					<li><a href="${contextPath}/memJoin.do" class="nav-item nav-link">회원가입</a></li>
					</c:if>
					<c:if test="${!empty mvo}" >
						<li class="dropdown">
							<c:if test="${mvo.memProfile eq ''}">
							<a href="#" class="nav-item nav-link" data-toggle="dropdown">
								<img src="${contextPath}/resources/images/12.png"  style="width:25px; height:25px; border-radius:50%;"/>
									 ${mvo.memName}님 방문을 환영합니다.</a>
									 <div class="dropdown-menu">
											<a href="#" class="dropdown-item">프로필사진등록</a>
											<a href="${contextPath}/memUpdate.do" class="dropdown-item">회원정보수정</a>
											<a href="${contextPath}/memLogout.do" class="dropdown-item">로그아웃</a>
									</div>
							</c:if>
							 <c:if test="${mvo.memProfile ne ''}">
							 <a href="#" class="nav-item nav-link" data-toggle="dropdown">
							 	<img src="${contextPath}/resources/images/${mvo.memProfile}"  style="width:25px; height:25px; border-radius:50%;"/>
							 		 ${mvo.memName}님 방문을 환영합니다.</a>
							 		<div class="dropdown-menu">
										<a href="#" class="dropdown-item">프로필사진등록</a>
										<a href="${contextPath}/memUpdate.do" class="dropdown-item">회원정보수정</a>
										<a href="${contextPath}/memLogout.do" class="dropdown-item">로그아웃</a>
									</div>
							</c:if>
							</li>
						</c:if>	
					
					
				</ul>
			</div>
		</div>
	</nav>
	

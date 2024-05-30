<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">

</head>
<body>
	<header><%@include file="../common/header.jsp"%></header>
	<section>
		<div class="mypage_container">
			<div class="profile">
				<div>
					<img src="${path}/resources/images/duck.jpg">
				</div>
				<div>
					<h2>손동희</h2>
					<button>개인정보 변경</button>
				</div>
			</div>
			<div>평점</div>
			<div>내 계좌</div>
			<div>
				포인트

				<button onclick="location.href='${path}/pointCharge'">충전</button>
			</div>
			<ul>
				<li>판매내역</li>
				<li>구매내역</li>
				<li>찜</li>
			</ul>
		</div>
	</section>
</body>
</html>
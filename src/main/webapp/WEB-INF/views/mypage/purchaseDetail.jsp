<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 상품 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/saleDetail.css">
</head>
<%@ include file="../common/header.jsp"%>
<body>
	<script src="/heehee/resources/js/purchaseDetail.js"></script>
	<div class="purchaseDetail">
		<p id="proStatus">${saleDetail.proStatus}</p>

		<div id="product">
			<img id="img"
				src="https://sh-heehee-bucket.s3.ap-northeast-2.amazonaws.com/images/sell/${saleDetail.imgName}">

			<!-- 카테고리, 거래확정일자, 글제목, 시세조회 -->
			<div class="title-container">
				<p id="product_category">${saleDetail.category}>
					${saleDetail.detailCategory} (${saleDetail.prodName})</p>

				<p id="date">${saleDetail.psDate}</p>
				<p id="articleTitle">${saleDetail.articleTitle}</p>
				<p id="dealTitle">거래방식:</p>
				<p id="deal">${saleDetail.deal}</p>

				<div id="delivery">
					<p>택배사: ${saleDetail.DCompany}</p>
					<p id="dNumber">송장번호: ${saleDetail.DNumber}</p>
					<p id="dStatus">${saleDetail.DStatus}</p>
				</div>

			</div>

		</div>

		<p id="progress">진행상황</p>
		<c:if
			test="${saleDetail.PCheck != null && saleDetail.proStatus != '거래완료'}">
			<p>판매자가 아직 거래 완료 버튼을 누르지 않았습니다.</p>
		</c:if>
		<c:if test="${saleDetail.PCheck == null && saleDetail.proStatus != '판매중지' && (saleDetail.deal != '택배' || (saleDetail.deal == '택배' && saleDetail.DNumber != null))}">
			<button id="complete"
				onclick="updatePCheck(${saleDetail.productSeq})">거래완료</button>
		</c:if>
		<c:if
			test="${saleDetail.proStatus == '거래완료' && saleDetail.rateSeq == 0}">
			<button id="accuracy">평점 매기기</button>
		</c:if>
		<%@ include file="/WEB-INF/views/mypage/ratingModal.jsp"%>
		<p id="rateSeq">${saleDetail.rateSeq}</p>
		<p id="pCheck">${saleDetail.PCheck}</p>
		<progress id="graph" value="0" max="100"></progress>
		<div id="deliveryText" class="progress_ing">
			<p>결제완료</p>
			<p>발송완료</p>
			<p>배송 중</p>
			<p>배송완료</p>
			<p>거래완료</p>
		</div>
		<div id="directText" class="progress_ing">
			<p>예약중</p>
			<p>거래완료</p>
		</div>

		<div id="price_area">
			<div class="order">
				<p>구매가</p>
				<p class="order_right">
					<fmt:formatNumber value="${saleDetail.productPrice}"
						pattern="#,###" />
					원
				</p>
			</div>
			<div class="order">
				<p>배송비</p>
				<p class="order_right">
					<fmt:formatNumber value="${saleDetail.DCharge}" pattern="#,###" />
					원
				</p>
			</div>
			<hr>
			<div class="order">
				<p id="total">총 결제금액</p>
				<p class="order_right" id="total_price">
					<fmt:formatNumber
						value="${saleDetail.productPrice + saleDetail.DCharge}"
						pattern="#,###" />
					원
				</p>
			</div>
		</div>

	</div>
	<div id="footerArea">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>
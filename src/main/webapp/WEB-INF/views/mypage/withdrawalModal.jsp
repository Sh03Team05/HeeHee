<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />

<link rel="stylesheet" href="${path}/resources/css/myPageModal.css">

<body>
	<script>
		$(function() {
			$("#drawal").on("click", show);
			$(".mModal_close").on("click", hide);
			$(".btn_cancel").on("click", hide);
			function show() {
				$(".mModal").addClass("show");
				$("body").css("overflow", "hidden"); /* 모달 열리면 스크롤 불가능 */
			}
			function hide() {
				$(".mModal").removeClass("show");
				$("body").css("overflow", "scroll"); /* 모달 닫히면 스크롤 가능 */
			}
		});
	</script>

	<div class="mModal">
		<div class="mModal_body">
			<img
				src="https://sh-heehee-bucket.s3.ap-northeast-2.amazonaws.com/images/header/icon_login_close.png"
				alt="로그인 창 닫기 아이콘" class="mModal_close">

			<h1 class="wModal_h">정말 탈퇴하시겠습니까?</h1>
			<p class="wModal_p">계정의 모든 정보는 삭제되며 복구되지 않습니다.</p>
			<div class="btn_modal">
				<button class="btn_cancel">아니요</button>
				<button class="btn_submit" onclick="location.href='${path}/userWithdrawal'">네</button>				
			</div>
		</div>
	</div>
</body>
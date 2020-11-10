<%@page import="com.cbox.movie.dao.MovieDAO"%>
<%@page import="com.cbox.movie.vo.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#frm img {
display: block; margin: 0px auto;
}
</style>
</head>
<body>
	<script>
		$().ready(function() {
			var type;
			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});

			$('.toggleBG').click(function() {
				var toggleBG = $(this);
				var toggleFG = $(this).find('.toggleFG');
				var left = toggleFG.css('left');
				if (left == '30px') {
					toggleBG.css('background', '#CCCCCC');
					type = toggleActionStart(toggleFG, 'TO_LEFT');
				} else if (left == '0px') {
					toggleBG.css('background', '#ABD0BC');
					type = toggleActionStart(toggleFG, 'TO_RIGHT');
				}
				console.log("type : " + type);
			});
		});
	</script>
	<div id="info" class="info">
		<div id="infoR">
			<img src="${pageContext.request.contextPath}/images/${vo.mvPost}">
			<div class="btnDiv">
				<a href="#" class="ticketBtn">예매</a>
			</div>
		</div>
		<div id="infoL">
			<p class="title" style="white-space: normal;">${vo.mvTitle}</p>
			<p style="font-size: 20px;">${vo.mvAge}</p>
			<p style="font-size: 20px; margin: 10px 0;">${vo.mvCont}</p>
			<p style="font-size: 20px;">
				<c:forEach begin="1" end="${vo.mvRank}">
					&#11088;
				</c:forEach>
			</p>
		</div>
	</div>
	<div class="tab-list">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">주요 정보</li>
			<li class="tab-link" data-tab="tab-2">실관람평</li>
			<li class="tab-link" data-tab="tab-3">예고편/스틸컷</li>
		</ul>
	</div>
	<div id="mainContent" style="min-width: 600px !important;">
		<div id="tab-1" class="tab-content current">
			<form id="frm" name="frm" enctype="multipart/form-data">
				<div class="col-sm-12 pt-3">
					<div class="card">
						<div class="card-header card-header-primary">
							<span class="card-title" id="movieTitle"> <i
								class="fas fa-square"></i>${vo.mvTitle}
							</span>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table">
									<tbody>
										<tr style="line-height: 32px;">
											<td>제목</td>
											<td><input type="text" name="mvTitle"
												class="form-control" value="${vo.mvTitle}" readonly></td>
											<td>감독</td>
											<td><input type="text" name="mvDir" class="form-control"
												value="${vo.mvDir}" readonly></td>
										</tr>
										<tr>
											<td>개봉일</td>
											<td><input type="text" name="strdate"
												class="form-control" value="${vo.strdate}" readonly></td>
											<td>상영 종료일</td>
											<td><input type="text" name="findate"
												class="form-control" value="${vo.findate}" readonly></td>
										</tr>
										<tr>
											<td>장르</td>
											<td><input type="text" name="mvType"
												class="form-control" value="${vo.mvType}" readonly></td>
											<td>관람 연령</td>
											<td><input type="text" name="mvAge" class="form-control"
												value="${vo.mvAge}" readonly></td>
										</tr>
										<tr>
											<td>등장인물</td>
											<td colspan="3"><input type="text" name="mvCha"
												class="form-control mb-3" value="${vo.mvCha}" readonly></td>
										</tr>
										<tr>
											<td>줄거리</td>
											<td colspan="3"><textarea rows="3" cols="60"
													name="mvSum" readonly>${vo.mvSum}</textarea></td>
										</tr>
										<tr>
											<td>설명</td>
											<td colspan="3"><textarea rows="3" cols="60"
													name="mvCont" readonly>${vo.mvCont}</textarea></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div id="tab-2" class="tab-content"></div>
		<div id="tab-3" class="tab-content">
			<form id="frm" name="frm" enctype="multipart/form-data">
				<div class="col-sm-12 pt-3">
					<div class="card">
						<div class="card-header">
							<i class="fas fa-square"></i> 티저 / 스틸컷
						</div>
						<div class="table-responsive">
							<div class="card-body">
								<table class="table">
									<tbody>
										<tr
											style="line-height: 32px; float: center; text-align: center;">
											<td colspan="4"><p
													style="width: 220px; size: 20px;">포스터 이미지</p> <img
												src="${pageContext.request.contextPath}/images/${vo.mvPost}"></td>
										</tr>
										<tr style="text-align: center;">
											<td colspan="4" style="width: 50%;"><p>스틸컷</p> <img
												src="${pageContext.request.contextPath}/images/${vo.mvImg}"></td>
										</tr>
										<tr style="text-align: center;">
											<td colspan="2"><p>티저 영상</p> <video autoplay="autoplay"
													src="${pageContext.request.contextPath}/images/${vo.mvTeaser}"></video></td>
											<td colspan="2"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>
</body>
</html>
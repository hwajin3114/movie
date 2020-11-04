<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>
<script>
	$(function(){
		
		$("#test00 a").on("click",function(){
			console.log("바보")
		});
	});
</script>

<%
		Calendar cal = Calendar.getInstance();
		int nowYear = cal.get(Calendar.YEAR); //년도
		int nowMonth = (cal.get(Calendar.MONTH) + 1); //달
		int nowDay = cal.get(Calendar.DAY_OF_MONTH); // 일
		int nowLastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); //마지막날
		String[] weekDay = { "일", "월", "화", "수", "목", "금", "토" };
		int num = cal.get(Calendar.DAY_OF_WEEK) - 1;
		String today = weekDay[num]; //요일
%>
</head>
<body>

	<div id="wrap" oncontextmenu="return false" ondragstart="return false"
		onselectstart="return false">
		<!-- 컨텐츠 -->
		<div id="container">
			<!-- 빠른예매 -->
			<div id="ticket" class="ticket ko">

				<!-- 메인컨텐츠 -->
				<div class="steps">
					<!-- step1 -->
					<div class="step step1" style="height: 595px; display: block;">

						<!-- MOVIE 섹션 -->
						<div class="section section-movie">
							<!-- col-head -->
							<div class="col-head" id="skip_movie_list">
								<h3 class="sreader">영화</h3>
								<a href="#" class="skip_to_something"
									onclick="skipToSomething('skip_theater_list');return false;">영화선택
									건너뛰기</a>
							</div>
							<!-- col-body -->
							<div class="col-body" style="height: 560px;">
								<!-- 영화선택 -->
								<div class="movie-select">

									<div class="tabmenu">
										<!-- 전체보기 -->
										<span class="side on"></span> <a href="#"
											class="button menu1 selected">전체</a> <span class="side on"></span>
									</div>

									<div class="sortmenu">
										<!-- 정렬 -->
										<a href="#" onclick="sortMovieByName();return false;"
											id="movieSortNameBtn" class="button btn-abc">가나다순</a>
									</div>

									<!-- 영화목록 -->
									<div class="movie-list nano has-scrollbar has-scrollbar-y"
										id="movie_list">
										<ul id="test00" class="content scroll-y"
											onscroll="movieSectionScrollEvent();" tabindex="-1"
											style="right: -17px;" ">
											
											<c:forEach var="movie" items="${movies }">
												<li class="rating-18" ><a href="#"
												 title="${movie.mvTitle }" alt="${movie.mvTitle }"><span
													class="icon">&nbsp;</span><span class="text">${movie.mvTitle }</span><span
													class="sreader"></span></a></li>
												
											</c:forEach>
										</ul>
										<div class="pane pane-y"
											style="display: block; opacity: 1; visibility: visible;">
											<div class="slider slider-y" style="height: 50px; top: 0px;"></div>
										</div>
										<div class="pane pane-x"
											style="display: none; opacity: 1; visibility: visible;">
											<div class="slider slider-x" style="width: 50px;"></div>
										</div>
									</div>


								</div>
							</div>
						</div>


						<!-- DATE 섹션 -->
						<div class="section section-date">
							<!-- 날짜 타이틀 -->
							<div class="col-head" id="skip_date_list">
								<h3 class="sreader">날짜</h3>
								<a href="#" onclick="return false;" class="skip_to_something">날짜
									건너뛰기</a>
							</div>
							<!-- 날짜 body -->
							<div class="col-body" style="height: 560px;">
								<!-- 날짜선택 -->
								<div class="date-list nano has-scrollbar has-scrollbar-y"
									id="date_list">
									<ul class="content scroll-y" tabindex="-1"
										style="right: -17px;">

										<div>
											<li class="month dimmed"><div>
													<span class="year">
														<!-- 현재년도 --><%=nowYear%></span> <span class="month">
														<!-- 현재월 --><%=nowMonth%></span>
													<div></div>
												</div></li>
											<!--  <li data-index="0" date="20201102" class="day"><a
												href="#" onclick="return false;"><span class="dayweek">오늘날짜(무슨요일) </span><span
													class="day">오늘일 </span><span class="sreader"></span></a></li> 
											-->
											<c:forEach var="item" begin="<%=nowDay%>"
												end="<%=nowLastDay%>" step="1">
												<li data-index="1" date="20201103" class="day"><a
													href="#" onclick="return false;"><span class="dayweek"><%=weekDay[num++ % 7]%></span><span
														class="day">${item }</span><span class="sreader"></span></a></li>

											</c:forEach>

										</div>
									</ul>
									<div class="pane pane-y"
										style="display: block; opacity: 1; visibility: visible;">
										<div class="slider slider-y" style="height: 50px; top: 0px;"></div>
									</div>
									<div class="pane pane-x"
										style="display: none; opacity: 1; visibility: visible;">
										<div class="slider slider-x" style="width: 50px;"></div>
									</div>
								</div>
							</div>
						</div>

						<!-- TIME 섹션 -->
						<div class="section section-time">
							<!-- 시간 타이틀 -->
							<div class="col-head" id="skip_time_list">
								<h3 class="sreader">시간</h3>
								<a href="#" class="skip_to_something"
									onclick="skipToSomething('tnb_step_btn_right');return false;">시간선택
									건너뛰기</a>
							</div>
							<!-- ENd 시간 타이틀 -->
							<div class="col-body" style="height: 560px;">
								<!-- 시간선택 -->
								<div class="time-option">
									<span class="morning">조조</span><span class="night">심야</span>
								</div>
								<!--  <div class="placeholder">영화, 날짜를 선택해주세요.</div>-->
								<!-- 관 , 시간출력 -->
								<div class="time-list nano has-scrollbar">
									<div class="content scroll-y" tabindex="-1"
										style="right: -17px;">
								
										<c:forEach var="time" items="${times }">
										<div class="theater" screen_cd="001" movie_cd="20024753">
											<span class="title"><span class="name">2D</span><span
												class="floor">${time.mv_title }</span><span class="seatcount">(총${time.th_max }석)</span></span>
											<ul>
												<li data-index="0" data-remain_seat="211"
													play_start_tm="1800" screen_cd="001" movie_cd="20024753"
													play_num="4"><a class="button" href="#"
													onclick="screenTimeClickListener(event);return false;"><span
														class="time"><span>${time.tt_start }</span></span><span class="count">${time.tt_empty }석</span>
													<div class="sreader"><!--  종료시간 20:00--></div>
														<span class="sreader mod"></span></a></li>
												
											</ul>
										</div>
										</c:forEach>
										
										
									</div>
									<div class="pane pane-y"
										style="display: none; opacity: 1; visibility: visible;">
										<div class="slider slider-y" style="height: 50px;"></div>
									</div>
									<div class="pane pane-x"
										style="display: none; opacity: 1; visibility: visible;">
										<div class="slider slider-x" style="width: 50px;"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- End TIME섹션 -->
					</div>
					<!-- //step1 -->

					<!-- step2 -->
					<!-- //step2 -->
		
				</div><!-- end main content -->
				
				
			</div>
			<!-- //빠른예매 -->
		</div>
		<!-- //컨텐츠 -->

		<!-- 클릭한 예매정보 저장??? -->
		<div id="ticket_tnb" class="tnb_container ">
			<div class="tnb step1">
				<!-- btn-left -->
				<a class="btn-left" href="#"
					onclick="OnTnbLeftClick(); return false;" title="영화선택">이전단계로 이동</a>
				<!-- 영화선택 -->
				<div class="info movie">	
					<div class="placeholder" title="영화선택"></div>
				</div>
				<!-- 극장선택 -->
				<div class="info theater">
					<div class="placeholder" title="극장선택"></div>
				</div>
				<!-- 좌석선택 
				<div class="info seat">
					<div class="placeholder" title="좌석선택"></div>
				</div>
				-->
				<div>
					<div>
						<span><img src="${pageContext.request.contextPath}/images/좌석선택.JPG">&nbsp;</span>
						<span><img src="${pageContext.request.contextPath}/images/결제.JPG">&nbsp;</span> 
					</div>
				</div>
				
				<!-- btn-right -->
				
				<a class="btn-right" id="tnb_step_btn_right" href="#"
					onclick="OnTnbRightClick(); return false;" title="좌석선택"></a>
			</div>
		</div>
		<!-- end 예매한 영화정보저장??? -->

		<!-- bottom banner -->
		<div class="banner" id="ticket_bottom_banner"
			style="padding-top: 0px;">
			<a target="_blank" title="새창"
				href="http://ad.cgv.co.kr/click/CGV/CGV_201401/RIA@B_ticketing?ads_id=44087&amp;creative_id=62166&amp;click_id=82006&amp;event="
				style="background-color: rgb(255, 255, 255);"><span style="">?援</span><img
				src="http://adimg.cgv.co.kr/images/202010/Collectors/1030_996x140.jpg"
				alt="?援" onload="ticketNeedResize();"
				style="width: 996px; height: 140px"></a>
		</div>

		
	</div>



	<div class="blackscreen" style="display: none;" id="blackscreen"></div>
	<!-- loading -->
	<div class="loading" id="ticket_loading" style="display: none;">
		<div class="dimm"></div>
		<p class="loadWrap">
			<img
				src="http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/common/ajax-loader-w.gif"
				alt="로딩 애니메이션">
		</p>
	</div>
	<!-- iframe -->
	<iframe id="proxy_iframe" src="http://www.cgv.co.kr/Ticket/Proxy.html"
		scrolling="no" frameborder="0" width="0" height="0"
		style="display: none;" title="데이터 연동 숨김 프레임"></iframe>
	<iframe src="/CGV2011/RIA/RR999.aspx" name="rsvDataframe"
		id="rsvDataframe" scrolling="no" frameborder="0" width="0" height="0"
		style="display: none;" title="데이터 연동 프레임"></iframe>
	<!-- javascript 상위프레임에 있는 스크립트를 사용-->
	<!--<script type="text/javascript" src="http://img.cgv.co.kr/common/js/insightIS.js"></script>-->

</body>
</html> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 상세정보</title>
<style type="text/css">
.highlight{
	font-size: 20px;
	font-weight: bolder;
}
#menubar {
	float: left;
	width: 20% !important;
	position:relative;
	top:120px;
	list-style-type: none;
	margin: 0;
	padding: 0;
}

#menubar li a {
  display:block;
  color: #000;
  padding: 16px 16px;
  text-decoration: none;
  border-bottom: 1px solid;
}

#menubar li a.active {
  background-color: red;
  color: white;
  font-weight: bold;
}

#menubar li a:hover:not(.active) {
  background-color: #555;
  color: white;
}
.frm {
	float: left;
	width: 80%;
	position:relative;
	top:120px;
}
</style>
<script>
	$(function(){
		var ReservNo = ${ infoData.tc_num };
		$(".btn-delete").on("click",function(){
			
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/ReservDelete.do",
				contentType:"application/x-www-form-urlencoded",
				type:"post",
				data:{ReservNo : ReservNo},
				dataType:"json",
				success:function(){
					alert("성공인가요 ~?")
				},error:function(xhr, status){
					alert("오류일까?");
				}
			});
		});//end click
	});
</script>
</head>
<body>
<div id="menubar">
<ul>
  <li><a class="active">MY PAGE</a></li>
  <li><a href="${pageContext.request.contextPath}/memberInfo.do">회원정보</a></li>
  <li><a href="${pageContext.request.contextPath}/UserReservList.do">예매정보</a></li>
  <li><a href="${pageContext.request.contextPath}/couponForm.do">쿠폰</a></li>
  <li><a href="${pageContext.request.contextPath}/QnAListForm.do">1:1문의</a></li>
</ul>
</div>
	<form class="frm" id="frm" name="frm" method="post" style="padding: 20px; max-width: 70%; margin-bottom: 10px;">
		<div class="col-sm-12 pt-3">
			<div class="card">
				<div class="card-header card-header-primary">
					<span class="card-title" id="title">
					<i class="fas fa-square"></i>예매 상세 정보
					</span>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<tr style="line-height: 32px;">
								<td class="txt">예매번호</td>
								<td><label id="tc_num" class="highlight">${ infoData.tc_num }</label></td>
								<td class="txt">예매일</td>
								<td><label id="tc_date" class="highlight">${ infoData.tc_date }</label></td>
							</tr>
							<tr>
								<td class="txt">영화 제목</td>
								<td colspan="2"><label class="highlight" id="mv_title"><b>${ infoData.mv_title }</b></label></td>
								<td class="txt"><label id="mv_age" class="highlight">${ infoData.mv_age }세</label></td>
							</tr>
							<tr>
								<td class="txt">상영일</td>
								<td><label id="tt_scr_date" class="highlight">${ infoData.tt_scr_date }</label></td>
								<td class="txt">상영시간</td>
								<td><label id="tt_time" class="highlight">${ infoData.tt_start } ~ ${ infoData.tt_end }</label></td>
							</tr>
							<tr>
								<td class="txt">상영관명</td>
								<td><label id="th_name" class="highlight">${ infoData.th_name }</label></td>
								<td class="txt">좌석번호</td>
								<td><label id="tc_st_num" class="highlight">${ infoData.tc_st_num }</label></td>
							</tr>
							
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center mt-3">
			<button type="button" class="btn btn-dark" onclick="location.href='UserReservList.do'">목록으로</button>
			<button type="button" class="btn btn-delete">예매취소</button>
		</div>
	</form>
</body>
</html>
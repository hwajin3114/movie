<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function formCheck() {
		var frm = document.search;
		if (frm.keyword.value == "") {
			alert("검색어를 입력해주세요.");
			return;
		}
		/* form.submit(); */
	}
</script>
</head>
<body>
	<h2>영화 리스트 관리</h2>
	<div id="topMvMenu">
		<a href="mvRegistForm.do" class="registBtn">등록</a>
		<form name="search" id="search" method="get" action="mvList.do">
			<select id="searchType" name="searchType">
				<option value="title">제목</option>
			</select> <input type="text" name="keyword" id="keyword" placeholder="영화 제목">
			<button type="submit" onclick="return formCheck()">검색</button>
		</form>
	</div>
	<div id="mvList">
		<table border="1">
			<tr>
				<th width="50">번호</th>
				<th width="150">제목</th>
				<th width="180">포스터</th>
				<th>설명</th>
				<th width="100">개봉일</th>
				<th width="100">평균 평점</th>
				<th width="70">수정</th>
			</tr>
			<c:forEach var="movie" items="${movies}">
				<tr>
					<td>${movie.mvNum }</td>
					<td>${movie.mvTitle }</td>
					<td><img id="mvPoster"
						src="${pageContext.request.contextPath}/images/${movie.mvPost}"></td>
					<td>${movie.mvCont }</td>
					<td>${movie.strdate }</td>
					<td>${movie.mvRank }</td>
					<td><a href="mvDetail.do?seq=${movie.mvNum }">&#x2705;</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
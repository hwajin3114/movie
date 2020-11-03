<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>게시판 - 글쓰기</title>
<link rel="stylesheet" href="/css/info.css">
<script>
function listFrm(){
	location.href="infoList.do";
}
function deleteFrm(){
	location.href="infoDelete.do";
}
	
</script>
</head>
<body>
		<table width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td id="title">공지번호</td>
				<td>${vo.info_Num}</td>
			</tr>
			<tr>
				<td id="title">제목</td>
				<td>${vo.info_Title}</td>
			</tr>
			<tr>
				<td id="title">날짜</td>
				<td>${vo.info_Date}</td>
			</tr>
			<tr>
				<td id="title">카테고리</td>
				<td>${vo.info_Category}</td>
				
			</tr>
			<tr>
				<td id="title">내 용</td>
				<td>${vo.info_Cont}
				</td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5">
				<input type ="button" value="수정">
	 			<input type ="button" value="삭제" onclick ="deleteFrm()">
				<input type="button" value="목록" onclick="listFrm()">
				</td>
			</tr>
		</table>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<table class="top">
		<tr>
			<td>
				<!-- Mypage 링크 메뉴  --> <a href="#"><font size="2.5px"
					face="BareunDotum1"> MyPage &nbsp;</a> <!-- 회원가입 링크 메뉴  --> <c:if
					test='${empty loginId}'>
					<a href="#"><font size="2.5px" face="BareunDotum1"> 회원가입
							&nbsp;</a>
				</c:if> <!-- 로그인 링크 메뉴  --> <c:if test='${empty loginId}'>
					<a href="#"><font size="2.5px" face="BareunDotum1"> 로그인
							&nbsp;</font></a>
				</c:if> <!-- 로그아웃 링크 메뉴  --> <c:if test='${!empty loginId}'>
					<a href="#"><font size="2.5px" face="BareunDotum1"> 로그아웃
							&nbsp;</font></a>
				</c:if> <!-- <a href="customer_main.do?mode=customerMain"><font
						size="2.5px" face="BareunDotum1"> 고객센터 &nbsp;</font></a> &nbsp;&nbsp; -->
				<!-- 메뉴 간격 가독성을 위한 공백 -->
			</td>
		</tr>
	</table>
</body>
</html>
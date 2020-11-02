<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>�Խ��� - �۾���</title>
<link rel="stylesheet" href="/css/info.css">
<script>
function listFrm(){
	location.href="infoList.do";
}
	
</script>
</head>
<body>
		<table width="700" border="3" bordercolor="lightgray" align="center">
		<c:forEach var="detail" items="${detail}">
			<tr>
				<td id="title">����</td>
				<td>${detail.info_Title}</td>
			</tr>
			<tr>
				<td id="title">��¥</td>
				<td>${detail.info_Date}</td>
			</tr>
			<tr>
				<td id="title">ī�װ�</td>
				<td>${detail.info_Category}</td>
				
			</tr>
			<tr>
				<td id="title">�� ��</td>
				<td>${detail.info_Cont}
				</td>
			</tr>
			</c:forEach>

			<tr align="center" valign="middle">
				<td colspan="5">
				<c:if test="admin"><!-- admin�̸� ������ư ���̰� -->
					<input type ="button" value="����">
				</c:if>
				<input type="reset" value="���"> 
				<input type="button" value="���" onclick="listFrm()">
				</td>
			</tr>
		</table>

</body>
</html>

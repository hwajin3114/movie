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
function deleteFrm(){
	location.href="infoDelete.do?info_Num=${vo.info_Num}";
}
function updateFrm(){
	location.href="infoUpdate.do";
}
	
</script>
</head>
<body>
		<table width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td id="title" name=" info_Num">������ȣ</td>
				<td>${vo.info_Num}</td>
			</tr>
			<tr>
				<td id="title" name=" info_Title">����</td>
				<td>${vo.info_Title}</td>
			</tr>
			<tr>
				<td id="title" name=" info_Date">��¥</td>
				<td>${vo.info_Date}</td>
			</tr>
			<tr>
				<td id="title" name=" info_Category">ī�װ�</td>
				<td>${vo.info_Category}</td>
				
			</tr>
			<tr>
				<td id="title" name=" info_Cont">�� ��</td>
				<td>${vo.info_Cont}
				</td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5">
				<input type ="button" value="����" onclick = "updateFrm()">
	 			<input type ="button" value="����" onclick ="deleteFrm()">
				<input type="button" value="���" onclick="listFrm()">
				</td>
			</tr>
		</table>

</body>
</html>

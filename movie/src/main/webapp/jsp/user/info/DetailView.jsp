<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>�Խ��� - �۾���</title>
<link rel="stylesheet" href="css/info.css">
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script>
function listFrm(){
	location.href="infoList.do";
}
function deleteFrm(){
	
	location.href="infoDelete.do?info_Num=${vo.info_Num}";
	
}
function updateFrm(){
	location.href="infoUpdateForm.do?info_Num=${vo.info_Num}";
}
	
</script>
<style>
.txt {
	font-size: 20px;
	font-weight: bolder;
	width: 20%;
}
#info_Cont {
	height:400px;
	font-size: 15px;
}
</style>
</head>
<body>
<div class="col-sm-12 pt-3">
	<div class="card">
		<div class="card-header card-header-primary">
			<span class="card-title" id="title">
			<i class="fas fa-square"></i>${vo.info_Title}
			</span>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table">
					<tr style="line-height: 32px;">
						<td class="txt">������ȣ</td>
						<td><label id="info_Num">${vo.info_Num}</label></td>
					</tr>
					<tr>
						<td class="txt">��¥</td>
						<td><label id="info_Date">${vo.info_Date}</label></td>
					</tr>
					<tr>
						<td class="txt">ī�װ�</td>
						<td><label id="info_Category">${vo.info_Category}</label></td>
					</tr>
					<tr>
						<td class="txt">����</td>
						<td><label id=info_Cont>${vo.info_Cont}</label></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="text-center mt-3">
	<c:if test="${mbr_author eq 'admin'}">
		<button id="btn" type="button" class="btn btn-success" onclick = "updateFrm()" style="margin-right: 30px;">����</button>
		<button id="btn" type="button" class="btn btn-danger" onclick ="deleteFrm()" style="margin-right: 30px;">����</button>
	</c:if>
	<button id="btn" type="button" class="btn btn-dark" onclick="listFrm()">���</button>
</div>
</body>
</html>

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
	<form method="post" action="infoInsert.do" name="infoForm" >
		<table width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td id="title">������ȣ</td>
				<td><input name="info_Num" type="text" value=""></td>
			</tr>
			<tr>
				<td id="title">����</td>
				<td><input name="info_Title" type="text" size="70"
					maxlength="100" value="" /></td>
			</tr>
			<tr>
				<td id="title">��¥</td>
				<td><input name="info_Date" type="date" value=""></td>
			</tr>
			<tr>
				<td id="title">ī�װ�</td>
				<td><select name="info_Category">
						<option value="��������">��������</option>
						<option value="�̺�Ʈ">�̺�Ʈ</option>
				</select></td>
				
			</tr>
			<tr>
				<td id="title">�� ��</td>
				<td><textarea name="info_Cont" cols="70" rows="10"></textarea>
				</td>
			</tr>
			
			<div align="center">
			<tr>
				<td colspan="5">
				<input type="reset" value="���������"> 
				<input type="submit" value="���">
				<input type="button" value="�ۼ����" onclick="listFrm()">
				</td>
			</tr>
			</div>
		</table>
	</form>

</body>
</html>

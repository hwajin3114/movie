<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>�Խ��� - �۾���</title>
<link rel="stylesheet" href="/css/info.css">
</head>
<body>
	<form method="post" action="infoWriteAction.do" name="infoForm"
		enctype="multipart/form-data">
		<input type="hidden" name="info_id" value="">
		<table width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td id="title">�ۼ���</td>
				<td></td>
			</tr>
			<tr>
				<td id="title">�� ��</td>
				<td><input name="info_subject" type="text" size="70"
					maxlength="100" value="" /></td>
			</tr>
			<tr>
				<td id="title">ī�װ�</td>
				<td><select name="opt">
						<option value="0">1</option>
						<option value="1">2</option>
						<option value="2">3</option>
						<option value="3">4</option>
				</select></td>
			</tr>
			<tr>
				<td id="title">�� ��</td>
				<td><textarea name="info_content" cols="72" rows="20"></textarea>
				</td>
			</tr>
			<tr>
				<td id="title">����÷��</td>
				<td><input type="file" name="info_file" /></td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5">
				<input type="reset" value="�ۼ����"> 
				<input type="submit" value="���"> <input type="button" value="���">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>

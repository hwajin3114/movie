<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>�Խ��� - �亯��</title>
</head>
<body>
    <br>
    <b><font size="6" color="gray">��� �ۼ�</font></b>
    <br>

	<form method="post" action="QnAReply.do" name="QnAForm">
		<table width="700" border="3" bordercolor="lightgray" align="center">
		<tr>
				<td id="title">�۹�ȣ</td>
				<td><input name="qa_no" type="text" size="70" maxlength="100"
					/></td>
			</tr>
		<tr>
				<td id="title">�ۼ���</td>
				<td><input name="qa_name" type="text" size="70" maxlength="100"
					/></td>
			</tr>
			<tr>
				<td id="title">�� ��</td>
				<td><input name="qa_title" type="text" size="70"
					maxlength="100" /></td>
			</tr>
			<tr>
				<td id="title">�� ��</td>
				<td><textarea name="qa_cont" cols="72" rows="20">
                </textarea></td>
			</tr>
			
			<tr>
				<td id="title">�ۼ���</td>
				<td><input name="qa_date" type="date" size="70"
					maxlength="100" /></td>
                
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5"><input type="reset" value="�ۼ����"> <input
					type="submit" value="���"> <input type="button" value="���">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>�Խ��� - �亯��</title>
    
    <style type="text/css">
        #title{
            height : 16;
            font-family :'����';
            font-size : 12;
            text-align :center;
        }
    </style>
    
</head>
<body>
 
    <br>
    <b><font size="6" color="gray">��� �ۼ�</font></b>
    <br>
    
    <form method="post" action="QnAReplyAction.do?qa_no=${qa_no}" name="QnAForm">
 
    <table width="700" border="3" bordercolor="lightgray" align="center">
            <tr>
            <td id="title">
               	 �� ��
            </td>
            <td>
                <input name="qa_title" type="text" size="70" maxlength="100" value=""/>
            </td>        
        </tr>
        <tr>
            <td id="title">
                �� ��
            </td>
            <td>
                <textarea name="qa_cont" cols="72" rows="20">
                </textarea>            
            </td>        
        </tr>
 
        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="reset" value="�ۼ����" >
                <input type="submit" value="���" >
                <input type="button" value="���">            
            </td>
        </tr>
    </table>    
    </form>
    
</body>
</html>

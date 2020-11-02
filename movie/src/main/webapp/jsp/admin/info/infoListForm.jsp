<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html>
<head>
    <title>��ü �Խñ�</title>
    <link rel="stylesheet" href="/css/info.css">
    <script>
        function writeForm(){
            location.href="infoWriteForm.do"; //�۾��� ��ư Ŭ���� �ۼ�ȭ������ �̵�
        }
        function deleteForm(){
        	location.href="infoDeleteForm.jsp";
        }
    </script>
    
</head>
<body>    
 
<div id="wrap">
<div align="right" id="searchForm">
        <form>
            <select name="opt">
                <option value="0">����</option>
                <option value="1">����</option>
                <option value="2">����+����</option>
                <option value="3">�۾���</option>
            </select>
            <input type="text" size="20" name="condition"/>&nbsp;
            <input type="submit" value="�˻�"/>
        </form>    
    </div>
    <br/>
    <div align="center" id="board">
        <table id="bList" width="800" border="3" bordercolor="black">
            <tr height="30">
                <td>������ȣ</td>
                <td>ī�װ�</td>
                <td>����</td>
                <td>�ۼ���</td>
                <td>��ȸ��</td>
                <td>����</td>
            </tr>    
            <tr>
                <td>a1</td>
                <td>b1</td>
                <td>c1</td>
                <td>d1</td>
                <td>e1</td>
                <td><input type="checkbox"></td>
            </tr>
        </table>
    </div>
    <div align="right" id="topForm">
            <input type="button" value="�۵��" onclick="writeForm()">
             <input type="button" value="�ۻ���" onclick="deleteForm()">
    </div>
    <br>
    <div align="center">
        	<a href="#" type="submit">1</a>
        	<a href="#" type="submit">2</a>
     </div>
    
    <br>
</div>    
 
</body>
</html>


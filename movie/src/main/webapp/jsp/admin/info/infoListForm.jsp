<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html>
<head>
    <title>��ü �Խñ�</title>
    <link rel="stylesheet" href="/css/info.css">
    <script>
        function writeForm(){
            location.href="infoWriteForm.do"; //infoWriteForm.do = �۾��� ��ư�� Ŭ�� �� �� �ۼ� ȭ������ �̵��ϴ� ��ɾ�
        }
        function deleteForm(){
        	location.href="infoDeleteForm.do";
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
                <td>�ۼ���</td>
                <td>��ȸ��</td>
            </tr>    
            <tr>
                <td>a1</td>
                <td>b1</td>
                <td>c1</td>
                <td>d1</td>
                <td>e1</td>
                <td>f1</td>
            </tr>
        </table>
    </div>
    <div align="right" id="topForm">
        <c:if test="${sessionScope.sessionID!=null}">
            <input type="button" value="�۵��" onclick="writeForm()">
             <input type="button" value="�ۻ���" onclick="deleteForm()">
        </c:if>    
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


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
    <title>��ü �Խñ�</title>
    <link rel="stylesheet" href="/css/info.css">
    
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
    <form action="infoList.do" method="post">
    <div align="center" id="info" >
        <table id="bList" width="800" border="3" bordercolor="black">
            <tr height="30">
                <td>������ȣ</td>
                <td>ī�װ�</td>
                <td>����</td>
                <td>�ۼ���</td>
                <td>�ۼ���</td>
                <td>��ȸ��</td>
            </tr>
            <c:forEach var="info" items="${infoList}"> 
            <tr>
                <td>${info.infoNum}</td>
                <td>${info.infoCategory}</td>
                <td>${info.infoTitle}</td>
                <td>${info.infoDate}</td>
                <td>${info.infoChk}</td>
                <td>${info.infoCont}</td>
            </tr>
            </c:forEach>
        </table>
    </div>
    </form>
    <br>
    <div align="center">
        	<a href="#" type="submit">1</a>
        	<a href="#" type="submit">2</a>
     </div>
    <br>
</div>    
 
</body>
</html>


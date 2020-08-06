<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2020/8/5
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>更新商品</title>
</head>
<body>
<form id="itemsForm" action="${pageContext.request.contextPath}/items/update.do" method="post">
    <table border="1">
        <tr>
            <td>
                名称
            </td>
            <td>
                <input type="text" name="name" value="${items.name}" style="width: 100%; height: 100%">
                <input type="hidden" name="id" value="${items.id}">
            </td>
        </tr>
        <tr>
            <td>
                价格
            </td>
            <td>
                <input type="text" name="price" value="${items.price}" style="width: 100%; height: 100%">
            </td>
        </tr>
        <tr>
            <td>
                描述
            </td>
            <td>
                <textarea name="detail" rows="10" cols="40">${items.detail}</textarea>
            </td>
        </tr>
        <tr>
            <td>
                图片
            </td>
            <td>
                <img id="pic" src="${items.pic}" width="150px" height="100px">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="更新" style="width: 100%; height: 100%">
            </td>
        </tr>
    </table>

</form>

</body>
</html>


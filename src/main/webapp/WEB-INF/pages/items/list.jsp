<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2020/8/5
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品列表</title>
</head>
<body>
<h1>商品：</h1>
<h2>
    <a href="${pageContext.request.contextPath}/items/add.do">新增</a>
</h2>
<table border="1">
    <tr>
        <td>名称</td>
        <td>价格</td>
        <td>描述</td>
        <td>日期</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${itemsList}" var="items">
        <tr>
            <td>${items.name}</td>
            <td>${items.price}</td>
            <td>${items.detail}</td>
            <td>${items.createtime}</td>
            <td>
                <a href="${pageContext.request.contextPath}/items/delete.do?id=${items.id}">删除</a>
                <a href="${pageContext.request.contextPath}/items/edit.do?id=${items.id}">编辑</a>

            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>



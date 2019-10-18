<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <c:import url="../common/common.jsp"></c:import>
</head>

<body ontouchstart>
<div class="weui-content">
    <div class="weui-c-inner">
        <div class="weui-c-content">
            <h2 class="weui-c-title">404</h2>
            <div class="weui-c-article">
                <p> 您访问的页面不存在 ！</p>
                <p><img src="${pageContext.request.contextPath}/static/wx/images/404.gif"></p>

            </div>
        </div>

    </div>

</div>

</body>
</html>

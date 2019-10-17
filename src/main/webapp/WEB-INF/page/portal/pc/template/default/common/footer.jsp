<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="footer-inner">
	<p class="copyright">Copyright © 2019-2029 huaiwei All Rights Reserved</p>
</div>

<!--回到顶部-->
<div class="alien">
	<div id="goTopBtn">
		<img width="29" height="65" src="${pageContext.request.contextPath}/static/default/images/goTopBtn.gif">
	</div>
</div>

<script>
	javaex.goTopBtn({
		id : "goTopBtn"
	});
</script>
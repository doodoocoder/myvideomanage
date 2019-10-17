<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>${seoInfo.title}</title>
    <meta name="keywords" content="${seoInfo.keywords}"/>
    <meta name="description" content="${seoInfo.description}"/>
    <c:import url="common/common.jsp"></c:import>
</head>
<body>
<!--头部-->
<div class="header-wrap header-channel">
    <c:import url="common/header.jsp"></c:import>
</div>

<!--内容-->
<div style="width: 1340px; margin: 20px auto;">


    <!--开放手术-->
    <div class="block no-shadow" style="height:447px;">
        <!--正文内容-->
        <div class="main">
            <!--选项卡切换-->
            <div id="tab1" class="tab">
                <!--选项卡标题部分-->
                <div class="tab-title">
                    <!--可以为选项卡添加图标、大标题、链接-->
                    <img class="mod-icon" src="${pageContext.request.contextPath}/static/default/images/ico2.png"/>
                    <em>开放手术 <i style="color:#ccc">></i></em>
                    <ul>
                        <li>心脏手术</li>
                        <li>骨科手术</li>
                        <li>胃肠手术</li>
                        <li>脑科手术</li>
                        <!--可以为选项卡右上角添加链接-->
                        <a class="more"  href="${pageContext.request.contextPath}/portal/list.action?name=开放手术&value=心脏手术&typeId=6" target="_blank">加载更多>></a>
                        <span class="clearfix"></span>
                    </ul>
                </div>
                <div class="tab-content">
                    <div>
                        <ul id="heart_opt" class="equal-6 poster">
                            <c:forEach items="${heartOpt}" var="opt">
                                <li>
                                    <a href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                       target="_blank" class="screenshot">
                                        <img src="${opt.imgUrl}" width="100%" height="100%"/>
                                    </a>
                                    <p class="screenshot-title"><a
                                            href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                            target="_blank">${opt.biaoti}</a></p>
                                </li>

                            </c:forEach>

                            <span class="clearfix"></span>
                        </ul>
                    </div>
                    <div>
                        <ul id="ske_opt" class="equal-6 poster">
                            <c:forEach items="${skeOpt}" var="opt">
                                <li>
                                    <a href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                       target="_blank" class="screenshot">
                                        <img src="${opt.imgUrl}" width="100%" height="100%"/>
                                    </a>
                                    <p class="screenshot-title"><a
                                            href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                            target="_blank">${opt.biaoti}</a></p>
                                </li>

                            </c:forEach>
                            <span class="clearfix"></span>
                        </ul>
                    </div>
                    <div>
                        <ul id="guts_opt" class="equal-6 poster">
                            <c:forEach items="${gutsOpt}" var="opt">
                                <li>
                                    <a href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                       target="_blank" class="screenshot">
                                        <img src="${opt.imgUrl}" width="100%" height="100%"/>
                                    </a>
                                    <p class="screenshot-title"><a
                                            href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                            target="_blank">${opt.biaoti}</a></p>
                                </li>
                            </c:forEach>
                            <span class="clearfix"></span>
                        </ul>
                    </div>
                    <div>
                        <ul id="head_opt" class="equal-6 poster">
                            <c:forEach items="${headOpt}" var="opt">
                                <li>
                                    <a href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                       target="_blank" class="screenshot">
                                        <img src="${opt.imgUrl}" width="100%" height="100%"/>
                                    </a>
                                    <p class="screenshot-title"><a
                                            href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                            target="_blank">${opt.biaoti}</a></p>
                                </li>

                            </c:forEach>
                            <span class="clearfix"></span>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <!--微创手术-->
    <div class="block no-shadow" style="height:447px;">
        <!--正文内容-->
        <div class="main">
            <!--选项卡切换-->
            <div id="tab2" class="tab">
                <!--选项卡标题部分-->
                <div class="tab-title">
                    <!--可以为选项卡添加图标、大标题、链接-->
                    <img class="mod-icon" src="${pageContext.request.contextPath}/static/default/images/ico2.png"/>
                    <em>微创手术 <i style="color:#ccc">></i></em>
                    <ul>
                        <li>DSA</li>
                        <li>腔镜</li>
                        <li>胃肠镜</li>
                        <%--微创手术在type_field中对应的id为7--%>
                        <a class="more" href="${pageContext.request.contextPath}/portal/list.action?name=微创手术&value=DSA&typeId=7"  target="_blank">加载更多>></a>
                        <span class="clearfix"></span>
                    </ul>
                </div>
                <!--选项卡内容部分-->
                <div class="tab-content">
                    <div>
                        <ul id="dsa_mir" class="equal-6 poster">
                            <c:forEach items="${dsaMir}" var="opt">
                                <li>
                                    <a href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                       target="_blank" class="screenshot">
                                        <img src="${opt.imgUrl}" width="100%" height="100%"/>
                                    </a>
                                    <p class="screenshot-title"><a
                                            href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                            target="_blank">${opt.biaoti}</a></p>
                                </li>
                            </c:forEach>
                            <span class="clearfix"></span>
                        </ul>


                    </div>

                    <div>
                        <ul id="guts_mir" class="equal-6 poster">
                            <c:forEach items="${gutsMir}" var="opt">
                                <li>
                                    <a href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                       target="_blank" class="screenshot">
                                        <img src="${opt.imgUrl}" width="100%" height="100%"/>
                                    </a>
                                    <p class="screenshot-title"><a
                                            href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                            target="_blank">${opt.biaoti}</a></p>
                                </li>
                            </c:forEach>
                            <span class="clearfix"></span>
                        </ul>
                    </div>
                    <div>
                        <ul id="stomach_mir" class="equal-6 poster">
                            <c:forEach items="${stomachMir}" var="opt">
                                <li>
                                    <a href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                       target="_blank" class="screenshot">
                                        <img src="${opt.imgUrl}" width="100%" height="100%"/>
                                    </a>
                                    <p class="screenshot-title"><a
                                            href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                            target="_blank">${opt.biaoti}</a></p>
                                </li>
                            </c:forEach>
                            <span class="clearfix"></span>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--全科医生培训-->
    <div class="block no-shadow" style="height:447px;">
        <!--正文内容-->
        <div class="main">
            <!--选项卡切换-->
            <div id="tab3" class="tab">
                <!--选项卡标题部分-->
                <div class="tab-title">
                    <!--可以为选项卡添加图标、大标题、链接-->
                    <img class="mod-icon" src="${pageContext.request.contextPath}/static/default/images/ico2.png"/>
                    <em>全科医生培训 <i style="color:#ccc">></i></em>
                    <ul>
                        <li>专家讲座</li>
                        <li>专家访谈</li>
                        <a class="more" href="${pageContext.request.contextPath}/portal/list.action?name=全科医生培训&value=专家讲座&typeId=8" id="lesson_train_more" target="_blank">加载更多>></a>
                        <span class="clearfix"></span>
                    </ul>
                </div>

                <!--选项卡内容部分-->
                <div class="tab-content">
                    <div>
                        <ul id="pro_speak" class="equal-6 poster">
                            <c:forEach items="${proSpeak}" var="opt">
                                <li>
                                    <a href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                       target="_blank" class="screenshot">
                                        <img src="${opt.imgUrl}" width="100%" height="100%"/>
                                    </a>
                                    <p class="screenshot-title"><a
                                            href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                            target="_blank">${opt.biaoti}</a></p>
                                </li>
                            </c:forEach>
                            <span class="clearfix"></span>
                        </ul>

                    </div>
                    <div>
                        <ul id="pro_interview" class="equal-6 poster">
                            <c:forEach items="${proInterview}" var="opt">
                                <li>
                                    <a href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                       target="_blank" class="screenshot">
                                        <img src="${opt.imgUrl}" width="100%" height="100%"/>
                                    </a>
                                    <p class="screenshot-title"><a
                                            href="${pageContext.request.contextPath}/portal/play.action?videoId=${opt.vid}"
                                            target="_blank">${opt.biaoti}</a></p>
                                </li>
                            </c:forEach>
                            <span class="clearfix"></span>
                        </ul>
                    </div>


                </div>
            </div>
        </div>
    </div>

</div>

<!--底部-->
<div class="footer-wrap js-use-footer">
    <c:import url="common/footer.jsp"></c:import>
</div>
</body>
<script>
    javaex.tab({
        id: "tab1",
        mode: "click"
    });
    javaex.tab({
        id: "tab2",
        display: "flex",
        mode: "click"
    });
    javaex.tab({
        id: "tab3",
        display: "flex",
        mode: "click"
    });
</script>
</html>

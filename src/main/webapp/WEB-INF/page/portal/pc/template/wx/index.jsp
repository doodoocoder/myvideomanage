<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/wx/css/weui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/wx/css/weuix.css"/>

    <script src="${pageContext.request.contextPath}/static/wx/js/zepto.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/wx/js/zepto.weui.js"></script>
    <script src="${pageContext.request.contextPath}/static/wx/js/swipe.js"></script>
</head>
<body ontouchstart>
<div class="page-hd">
    <h1 class="page-hd-title">
        手术教学视频
    </h1>
    <p class="page-hd-desc"></p>
</div>
<div class="slide" id="slide1">
    <ul>
        <li>
            <a href="javascript:;">
                <img src='${pageContext.request.contextPath}/static/wx/images/1.jpg' alt="">
            </a>
            <div class="slide-desc">白日依山尽</div>
        </li>
        <li>
            <a href="javascript:;">
                <img src='${pageContext.request.contextPath}/static/wx/images/2.jpg' alt="">
            </a>
            <div class="slide-desc">东风无力百花残</div>
        </li>
        <li>
            <a href="javascript:;">
                <img src='${pageContext.request.contextPath}/static/wx/images/3.jpg' alt="">
            </a>
            <div class="slide-desc">千金易得一将难求</div>
        </li>
    </ul>
    <div class="dot">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>

<div class="page-bd">
    <c:forEach items="${pageInfo.list}" var="entity">
        <div class="weui-panel weui-panel_access">
            <div class="weui-panel__bd">
                <a href="${entity.url}" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media-box__hd">
                        <img class="weui-media-box__thumb" src="${entity.fengmian}" alt="">
                    </div>
                    <div class="weui-media-box__bd">
                        <h4 class="weui-media-box__title">${entity.biaoti}</h4>
                            <%--控件中的简介是这样的格式 <p>xxxxxx<br></p> --%>
                        <p class="weui-media-box__desc">${fn:substring(entity.jianjie, 3, fn:indexOf(entity.jianjie,"<br>")-1 )}</p>
                    </div>
                </a>
                <div class="weui-news-info">
                    <div class="weui-news-infoitem">
                        <span>1条评论</span>
                    </div>
                    <div class="weui-news-infoitem">2018-12-14 10:31</div>
                </div>
            </div>

        </div>
    </c:forEach>
    <div class="weui-panel__ft">
        <a href="javascript:void(0);" class="weui-cell weui-cell_access weui-cell_link">
            <div class="weui-cell__bd" id="getmore">查看更多<i id="loading" class="weui-loading"></i></div>

        </a>
    </div>


</div>
<script>
    var pageSize = 10;//每页数据条数
    $(function () {

        var page = 2;
        var maxpage=${pageInfo.pages};

        $('#getmore').on('click', function () {
            sessionStorage['maxpage'] = maxpage;
            if (page <= maxpage) {
                ajaxpage(page);
                page++;
            }
        });

      /**************幻灯片****************************/
        $('#slide1').swipeSlide({
            autoSwipe:true,//自动切换默认是
            speed:3000,//速度默认4000
            continuousScroll:true,//默认否
            transitionType:'cubic-bezier(0.22, 0.69, 0.72, 0.88)',//过渡动画linear/ease/ease-in/ease-out/ease-in-out/cubic-bezier
            lazyLoad:true,//懒加载默认否
            firstCallback : function(i,sum,me){
                me.find('.dot').children().first().addClass('cur');
            },
            callback : function(i,sum,me){
                me.find('.dot').children().eq(i).addClass('cur').siblings().removeClass('cur');
            }
        });

    });


    $('#loading').hide();
    function index_assemble(o){//传入视频的信息
        var div_html=' <div class="weui-panel weui-panel_access">\n' +
            '            <div class="weui-panel__bd">\n' +
            '                <a href="'+o.url+'" class="weui-media-box weui-media-box_appmsg">\n' +
            '                    <div class="weui-media-box__hd">\n' +
            '                        <img class="weui-media-box__thumb" src="'+o.fengmian+'" alt="">\n' +
            '                    </div>\n' +
            '                    <div class="weui-media-box__bd">\n' +
            '                        <h4 class="weui-media-box__title">'+o.biaoti+'</h4>\n' +
            '                            <%--控件中的简介是这样的格式 <p>xxxxxx<br></p> --%>\n' +
            '                        <p class="weui-media-box__desc">'+o.jianjie.substring(3,o.jianjie.indexOf("<br>")-1)+'</p>\n' +
            '                    </div>\n' +
            '                </a>\n' +
           '<div class="weui-news-info">\n' +
            '                    <div class="weui-news-infoitem">\n' +
            '                        <span>1条评论</span>\n' +
            '                    </div>\n' +
            '                    <div class="weui-news-infoitem">2018-12-14 10:31</div>\n' +
            '                </div>'
            '            </div>\n' +
            '\n' +
            '        </div>';
            return div_html;
    }
    function ajaxpage(page) {
        $.ajax({
            type: "post",
            url: '${pageContext.request.contextPath}/portal/wx/getMore.json?pageNum=' + page + '&pageSize=' + pageSize,
            dataType: 'json',
            timeout: 10000,
            beforeSend: function (xhr) {
                $('#loading').show();
            },
            success: function (rs) {
                $('#loading').hide();
                var maxpage = rs.data.data.pages;
                sessionStorage['maxpage'] = maxpage;
                var list = rs.data.data.list;
                for(var i in list){
                    $(".weui-panel").last().after(index_assemble(list[i]));
                }
                if (page == maxpage) {
                    $("#getmore").html("没有更多数据了");
                    return false;
                }
            },
            error: function (xhr) {
                console.log(xhr);
                alert('ajax出错');
            }
        });


    }
</script>
</body>

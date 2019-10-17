<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <script>
        $(function () {

            var page = 2;
            var maxpage;

            $('#getmore').on('click', function () {
                maxpage = sessionStorage['maxpage'];
                if (page <= maxpage) {
                    ajaxpage(page);
                    page++;
                }
            });
           // ajaxpage(1);
        });

        $('#loading').hide();
        var pagesize = 10;//每页数据条数
        function ajaxpage(page) {
            $.ajax({
                type: "post",
                url: '${pageContext.request.contextPath}/portal/wx/index.action?pageNum='+page+'&pageSize='+pagesize,
                dataType: 'json',
                timeout: 10000,
                beforeSend: function (xhr) {
                    $('#loading').show();
                },
                success: function (rs) {
                    $('#loading').hide();
                 //   $("#rank-list").append(tpl(document.getElementById('tpl').innerHTML, rs));
                    console.log(rs);
                    var maxpage = Math.ceil(rs.total / pagesize);
                    sessionStorage['maxpage'] = maxpage;

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
</head>

<body ontouchstart class="page-bg">
<div class="page-hd">
    <h1 class="page-hd-title">
        手术教学视频
    </h1>
</div>

<div class="weui-news">
    <ul class="weui-news-list">
        <li class="weui-news-item">
            <div class="weui-news-inner">
                <div class="weui-news-inners">
                    <div class="weui-news-text">
                        <div class="weui-news-title"><a href="http://www.baidu.com"  class="weui-cell weui-cell_access">Flutter 是 Google 用以帮助开发者在 Android 和 iOS 两个平台，同时开发高质量原生应用的全新移动 UI 框架</a>
                        </div>
                    </div>
                    <div class="weui-news-info">
                        <div class="weui-news-infoitem">
                            <img src="${pageContext.request.contextPath}/static/wx/images/user.png"
                                 class="weui-news-round"><span class="weui-news-left">分类:开放手术</span>
                        </div>
                        <div class="weui-news-infoitem">1条评论</div>
                    </div>
                </div>
                <div class="weui-news-media">
                    <a href="http://www.baidu.com"  class="weui-cell weui-cell_access"> <img src="${pageContext.request.contextPath}/static/wx/images/1.jpg"></a>
                </div>
            </div>
        </li>
        <li class="weui-news-item">
            <div class="weui-news-inner">
                <div class="weui-news-inners">
                    <div class="weui-news-text">
                        <div class="weui-news-title"><a href="http://www.baidu.com"  class="weui-cell weui-cell_access">Google 在 2018 世界移动大会上发布 Flutter 的 Beta 版本</a></div>
                    </div>
                    <div class="weui-news-info">
                        <div class="weui-news-infoitem">
                            <img src="${pageContext.request.contextPath}/static/wx/images/user.png"
                                 class="weui-news-round"><span class="weui-news-left">分类:微创手术</span>
                        </div>
                        <div class="weui-news-infoitem">1条评论</div>
                    </div>
                </div>
                <div class="weui-news-media">
                    <a href="http://www.baidu.com"  class="weui-cell weui-cell_access"><img src="${pageContext.request.contextPath}/static/wx/images/2.jpg"></a>
                </div>
            </div>
        </li>
        <li class="weui-news-item">
            <div class="weui-news-inner">
                <div class="weui-news-inners">
                    <div class="weui-news-text">
                        <div class="weui-news-title"><a href="http://www.baidu.com" class="weui-cell weui-cell_access">weui+最新版本包含更多组件</a></div>
                    </div>
                    <div class="weui-news-info">
                        <div class="weui-news-infoitem">
                            <img src="${pageContext.request.contextPath}/static/wx/images/user.png"
                                 class="weui-news-round">
                            <span class="weui-news-left">分类:全科医生培训</span>
                        </div>
                        <div class="weui-news-infoitem">1条评论</div>
                    </div>
                </div>

                <div class="weui-news-media">
                    <a href="http://www.baidu.com"  class="weui-cell weui-cell_access">
                        <img src="${pageContext.request.contextPath}/static/wx/images/3.jpg"> </a>
                </div>

            </div>
        </li>


        <li class="weui-news-item">
            <a href="javascript:void(0);" class="weui-cell weui-cell_access weui-cell_link">
                <div class="weui-cell__bd" id="getmore">查看更多<i id="loading" class="weui-loading"></i></div>

            </a>

        </li>
    </ul>

</div>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <c:import url="../common/common.jsp"></c:import>
    <script>
        function textarea(input) {
            var content = $(input);
            var max =  content.next().find('i') .text();
            var value = content.val();
            if (value.length>0) {
                $("#movie_comment_btn").removeClass('weui-btn weui-btn_disabled weui-btn_default')
                    .addClass('weui-btn weui-btn_primary');
                value = value.replace(/\n|\r/gi,"");
                var len = value.length;
                content.next().find('span').text(len) ;
                if(len>max){
                    content.next().addClass('f-red');
                }else{
                    content.next().removeClass('f-red');
                }
            }else {//没输入时变灰
                content.next().find('span').text(0) ;
                $("#movie_comment_btn").removeClass('weui-btn weui-btn_primary')
                    .addClass('weui-btn weui-btn_disabled weui-btn_default ');
            }
        }
    </script>
</head>
<body>
<div class="weui-content">
    <div class="weui-c-inner">
        <div class="weui-c-content">
            <h2 class="weui-c-title">手术教学视频</h2>
            <div class="weui-c-article">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/static/wx/css/DPlayer.min.css">
                <div id="dplayer"></div>
                <script src="${pageContext.request.contextPath}/static/wx/js/DPlayer.min.js"></script>
                <script type="text/javascript">
                    const dp = new DPlayer({
                        container: document.getElementById('dplayer'),
                        screenshot: false,//不需要截屏功能
                        autoplay: true,
                        video: {
                            url: '${videoInfo.url}',
                            pic: '${mediaInfo.fengmian}',
                            thumbnails: '${mediaInfo.fengmian}'
                        }
                    });
                </script>
                <h4>${mediaInfo.biaoti}--简介：</h4>
                <p>
                    <span class="f12">${fn:substring(mediaInfo.jianjie, 3, fn:indexOf(mediaInfo.jianjie,"<br>")-1 )}</span>

                </p>
            </div>

        </div>

        <div class="page-hd">
            <h1 class="page-hd-title">
                评论列表
            </h1>
            <p class="page-hd-desc"></p>
        </div>
        <div class="page-bd-15">
            <a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_primary open-popup" data-target="#half">来一波神评?</a>
            <ul class="weui-comment">
                <li class="weui-comment-item">
                    <div class="weui-comment-li"><span class="check checked"> <i class="weui-comment-icon"></i> <span
                            class="weui-comment-num">11</span> </span></div>
                    <div class="userinfo"><strong class="nickname">骑猪看世界</strong> <img class="avatar"
                                                                                     src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAADs0lEQVRogcVa7ZHjIAx1CSkhJaSElJASXEJKcAcpwSWkhPwHHpTgElxC7sdJnOwQI2TvnmY8O5M16OmDJwHuugMlpXRKKZ2dc5cQwg3A3Xs/AOi999eU0vlIfYeIc+4C4B5jTABmAO/aE2N8AXh476//BXRK6QSgJ9AS3Ey/PQGMBHIAMMYYXwR8beQM4PFr4L331xXwGcCTUuSknYMMm6Qx3vvhx4A75y4SeIzxFUK4aUF/E+/9laLFhkwhhNtRuKWSWXj8vhf4WtYOOiwaAO4C/KMGPKV0CiHcOPfFc9csWtKXo7wX/EN6vQL8TO/XmGiqeZcizkYkK3j2xFzLSeL8nGJMkyGEG/2vXxsXY0xb0ZQp1RwJmfM18FQHZlZUK1Yt3iW6zumrAi8B1UKdUjqJhVddH2LcWYzbTE1psIqdKPwqiyk92PNNrERr5g1g1uqpvitf1ACiiqvzTHk883+v1bWZFcL7m2EVk04A3tYmjYlCw/kyYkV9wvuTNh20KfBNhM5RqW/8+j6HSBNOMWamCJiqsqBqFcMQK306TdCVKvdZmEmcc5dG7F3XdR1V66a2QaR5n38UoXy2AODJrH09p0QLCVBRXKaRlU1Eq9G3jFvrbXFAMY2sbNJCgyWxRpDx5tRl9jEASDtTiCOoom0xbsx6mV8tXd8BLMT53LSlXBjOvYal9z6KhVojsGCv4qpWijUFWHgNtJLHogC2VsPSRJboUddrquQLp4t2takGdF2mtMlIwWNOg0ZZVHDmVev+U3hD7QDpfQsBiLXTf+8vlGIZb638LB8VfC8dttaDPelD46eFvr0VVeRklQjkPteyj5ARzw7fQ6XrSWvvHpA+n2tu7zqgiVX9lLVxrI4XpwS9ZWJtY2ZtHLsubyvL+xYRmuamjsarWmNhwB76LKdfa1FKKZ2oEOZTt5pnOVL0V31ILHeNX3svzflLCTSP0XSVNHZxLxBjfHnvhy3j8W/Pvq1DrIVFmAToovLWjpScJe8F3jIyK/D5nLYaMXH+8sbfy7lhfZVkBd1qDIDn6uBY1/XK80jxTEeCNhjTdo8mwvYG0B99I1MTygRO16dJ/8oTpk2LReRCr90jaCYbzGE0CMSVluXUuyjrSwlrtVboeEpnHZq2tAmZpCFHXIcW7tbmn3BQFgqxrAUTGj8bcM5dBD3/6PXtVykYkrkbwOi9H2j93MnD/LnBx+cJlC7nXwG+Fv5soABs65kAPJxzl9+m56qIT216isADdMlNgM9H6vsDQwYeNVuvb4wAAAAASUVORK5CYII=">
                    </div>
                    <div class="weui-comment-msg"><span class="status"></span> 很专业</div>
                    <p class="time">昨天 </p>

                </li>
                <li class="weui-comment-item">
                    <div class="weui-comment-li"><span class="check"> <i class="weui-comment-icon"></i> <span
                            class="weui-comment-num">0</span> </span></div>
                    <div class="userinfo"><strong class="nickname">李大仙人</strong> <img class="avatar"
                                                                                     src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAADs0lEQVRogcVa7ZHjIAx1CSkhJaSElJASXEJKcAcpwSWkhPwHHpTgElxC7sdJnOwQI2TvnmY8O5M16OmDJwHuugMlpXRKKZ2dc5cQwg3A3Xs/AOi999eU0vlIfYeIc+4C4B5jTABmAO/aE2N8AXh476//BXRK6QSgJ9AS3Ey/PQGMBHIAMMYYXwR8beQM4PFr4L331xXwGcCTUuSknYMMm6Qx3vvhx4A75y4SeIzxFUK4aUF/E+/9laLFhkwhhNtRuKWSWXj8vhf4WtYOOiwaAO4C/KMGPKV0CiHcOPfFc9csWtKXo7wX/EN6vQL8TO/XmGiqeZcizkYkK3j2xFzLSeL8nGJMkyGEG/2vXxsXY0xb0ZQp1RwJmfM18FQHZlZUK1Yt3iW6zumrAi8B1UKdUjqJhVddH2LcWYzbTE1psIqdKPwqiyk92PNNrERr5g1g1uqpvitf1ACiiqvzTHk883+v1bWZFcL7m2EVk04A3tYmjYlCw/kyYkV9wvuTNh20KfBNhM5RqW/8+j6HSBNOMWamCJiqsqBqFcMQK306TdCVKvdZmEmcc5dG7F3XdR1V66a2QaR5n38UoXy2AODJrH09p0QLCVBRXKaRlU1Eq9G3jFvrbXFAMY2sbNJCgyWxRpDx5tRl9jEASDtTiCOoom0xbsx6mV8tXd8BLMT53LSlXBjOvYal9z6KhVojsGCv4qpWijUFWHgNtJLHogC2VsPSRJboUddrquQLp4t2takGdF2mtMlIwWNOg0ZZVHDmVev+U3hD7QDpfQsBiLXTf+8vlGIZb638LB8VfC8dttaDPelD46eFvr0VVeRklQjkPteyj5ARzw7fQ6XrSWvvHpA+n2tu7zqgiVX9lLVxrI4XpwS9ZWJtY2ZtHLsubyvL+xYRmuamjsarWmNhwB76LKdfa1FKKZ2oEOZTt5pnOVL0V31ILHeNX3svzflLCTSP0XSVNHZxLxBjfHnvhy3j8W/Pvq1DrIVFmAToovLWjpScJe8F3jIyK/D5nLYaMXH+8sbfy7lhfZVkBd1qDIDn6uBY1/XK80jxTEeCNhjTdo8mwvYG0B99I1MTygRO16dJ/8oTpk2LReRCr90jaCYbzGE0CMSVluXUuyjrSwlrtVboeEpnHZq2tAmZpCFHXIcW7tbmn3BQFgqxrAUTGj8bcM5dBD3/6PXtVykYkrkbwOi9H2j93MnD/LnBx+cJlC7nXwG+Fv5soABs65kAPJxzl9+m56qIT216isADdMlNgM9H6vsDQwYeNVuvb4wAAAAASUVORK5CYII=">
                    </div>
                    <div class="weui-comment-msg"><span class="status"></span> 这是什么</div>
                    <p class="time">2018-10-10 13:13:13 </p></li>

                <li class="weui-comment-item">
                    <div class="weui-comment-li"><span class="check checked"> <i class="weui-comment-icon"></i> <span
                            class="weui-comment-num">999</span> </span></div>
                    <div class="userinfo"><strong class="nickname">可可西的西瓜</strong> <img class="avatar"
                                                                                     src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAADs0lEQVRogcVa7ZHjIAx1CSkhJaSElJASXEJKcAcpwSWkhPwHHpTgElxC7sdJnOwQI2TvnmY8O5M16OmDJwHuugMlpXRKKZ2dc5cQwg3A3Xs/AOi999eU0vlIfYeIc+4C4B5jTABmAO/aE2N8AXh476//BXRK6QSgJ9AS3Ey/PQGMBHIAMMYYXwR8beQM4PFr4L331xXwGcCTUuSknYMMm6Qx3vvhx4A75y4SeIzxFUK4aUF/E+/9laLFhkwhhNtRuKWSWXj8vhf4WtYOOiwaAO4C/KMGPKV0CiHcOPfFc9csWtKXo7wX/EN6vQL8TO/XmGiqeZcizkYkK3j2xFzLSeL8nGJMkyGEG/2vXxsXY0xb0ZQp1RwJmfM18FQHZlZUK1Yt3iW6zumrAi8B1UKdUjqJhVddH2LcWYzbTE1psIqdKPwqiyk92PNNrERr5g1g1uqpvitf1ACiiqvzTHk883+v1bWZFcL7m2EVk04A3tYmjYlCw/kyYkV9wvuTNh20KfBNhM5RqW/8+j6HSBNOMWamCJiqsqBqFcMQK306TdCVKvdZmEmcc5dG7F3XdR1V66a2QaR5n38UoXy2AODJrH09p0QLCVBRXKaRlU1Eq9G3jFvrbXFAMY2sbNJCgyWxRpDx5tRl9jEASDtTiCOoom0xbsx6mV8tXd8BLMT53LSlXBjOvYal9z6KhVojsGCv4qpWijUFWHgNtJLHogC2VsPSRJboUddrquQLp4t2takGdF2mtMlIwWNOg0ZZVHDmVev+U3hD7QDpfQsBiLXTf+8vlGIZb638LB8VfC8dttaDPelD46eFvr0VVeRklQjkPteyj5ARzw7fQ6XrSWvvHpA+n2tu7zqgiVX9lLVxrI4XpwS9ZWJtY2ZtHLsubyvL+xYRmuamjsarWmNhwB76LKdfa1FKKZ2oEOZTt5pnOVL0V31ILHeNX3svzflLCTSP0XSVNHZxLxBjfHnvhy3j8W/Pvq1DrIVFmAToovLWjpScJe8F3jIyK/D5nLYaMXH+8sbfy7lhfZVkBd1qDIDn6uBY1/XK80jxTEeCNhjTdo8mwvYG0B99I1MTygRO16dJ/8oTpk2LReRCr90jaCYbzGE0CMSVluXUuyjrSwlrtVboeEpnHZq2tAmZpCFHXIcW7tbmn3BQFgqxrAUTGj8bcM5dBD3/6PXtVykYkrkbwOi9H2j93MnD/LnBx+cJlC7nXwG+Fv5soABs65kAPJxzl9+m56qIT216isADdMlNgM9H6vsDQwYeNVuvb4wAAAAASUVORK5CYII=">
                    </div>
                    <div class="weui-comment-msg"><span class="status"></span> 好血腥</div>
                    <p class="time">2019-10-10 23:59:59 </p></li>

            </ul>

        </div>

        <div id="half" class='weui-popup__container popup-bottom'>
            <div class="weui-popup__overlay"></div>
            <div class="weui-popup__modal">
                <div class="toolbar">
                    <div class="toolbar-inner">
                        <a href="javascript:;" class="picker-button close-popup">关闭</a>
                    </div>
                </div>
                <div class="modal-content">
                    <div class="weui-cells weui-cells_form">
                        <div class="weui-cell">
                            <div class="weui-cell__bd">
                                <textarea class="weui-textarea" rows="4" placeholder="评论一波..." onkeyup="textarea(this);" ></textarea>
                                <div class="weui-textarea-counter"><span>0</span>/<i>50</i></div>
                            </div>

                        </div>
                    </div>
                    <div class="weui-btn-area">
                        <a class="weui-btn weui-btn_disabled weui-btn_default" onclick="" href="javascript:" id="movie_comment_btn">确定</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

</body>
</html>

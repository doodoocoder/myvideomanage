package cn.shirdon.liao.action.portal;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.shirdon.liao.config.SystemOptDictConfig;
import cn.shirdon.liao.exception.QingException;
import cn.shirdon.liao.service.channel_info.ChannelInfoService;
import cn.shirdon.liao.service.field_info.FieldInfoService;
import cn.shirdon.liao.service.media_info.MediaInfoService;
import cn.shirdon.liao.service.nav_info.NavInfoService;
import cn.shirdon.liao.service.seo_info.SeoInfoService;
import cn.shirdon.liao.service.template_info.TemplateInfoService;
import cn.shirdon.liao.service.user_info.UserInfoService;
import cn.shirdon.liao.service.video_info.VideoInfoService;
import cn.shirdon.liao.view.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.shirdon.liao.exception.QingException;
import cn.shirdon.liao.service.channel_info.ChannelInfoService;
import cn.shirdon.liao.service.field_info.FieldInfoService;
import cn.shirdon.liao.service.media_info.MediaInfoService;
import cn.shirdon.liao.service.nav_info.NavInfoService;
import cn.shirdon.liao.service.seo_info.SeoInfoService;
import cn.shirdon.liao.service.template_info.TemplateInfoService;
import cn.shirdon.liao.service.type_info.TypeInfoService;
import cn.shirdon.liao.service.user_info.UserInfoService;
import cn.shirdon.liao.service.video_info.VideoInfoService;
import cn.shirdon.liao.service.web_info.WebInfoService;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("portal")
public class PortalAction {

    @Autowired
    private VideoInfoService videoInfoService;
    @Autowired
    private MediaInfoService mediaInfoService;
    @Autowired
    private FieldInfoService fieldInfoService;
    @Autowired
    private NavInfoService navInfoService;
    @Autowired
    private ChannelInfoService channelInfoService;
    @Autowired
    private WebInfoService webInfoService;
    @Autowired
    private SeoInfoService seoInfoService;
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private TemplateInfoService templateInfoService;
    @Autowired
    private TypeInfoService typeInfoService;

    @GetMapping("getVideos.action")
    public String getVideos(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            FileInputStream fis = null;
            OutputStream os = null;
            fis = new FileInputStream("e:\\biz\\video\\big.mp4");
            int size = fis.available(); // 得到文件大小
            byte data[] = new byte[size];
            fis.read(data); // 读数据
            fis.close();
            fis = null;
            response.setContentType("video/mp4"); // 设置返回的文件类型
            os = response.getOutputStream();
            os.write(data);
            os.flush();
            os.close();
            os = null;


        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @author chj
     * @date 2019/10/17 9:34
     * @description 跳转公众号首页测试,获取最新视频
     */
    @RequestMapping("wx/index.action")
    public String wxIndex(ModelMap map,
                          @RequestParam(value="pageNum", defaultValue="1") int pageNum,
                          @RequestParam(value="pageSize", defaultValue="10") int pageSize) throws QingException {
        String templateWx = "wx";
        // pageHelper分页插件
        // 只需要在查询之前调用，传入当前页码，以及每一页显示多少条
        PageHelper.startPage(pageNum, pageSize);
        List<VideoInfo> list = videoInfoService.listNewVideo();
        PageInfo<VideoInfo> pageInfo = new PageInfo<VideoInfo>(list);
        map.put("pageInfo", pageInfo);
        return "portal/pc/template/" + templateWx + "/index";
    }
    /**
     *@author chj
     *@date 2019/10/17 16:15
     *@description  点击查看更多时
     *
     */
    @RequestMapping("wx/getMore.json")
    @ResponseBody
    public Result getMore( @RequestParam(value="pageNum", defaultValue="1") int pageNum,
                           @RequestParam(value="pageSize", defaultValue="10") int pageSize){
        // pageHelper分页插件
        // 只需要在查询之前调用，传入当前页码，以及每一页显示多少条
        PageHelper.startPage(pageNum, pageSize);
        List<VideoInfo> list = videoInfoService.listNewVideo();
        PageInfo<VideoInfo> pageInfo = new PageInfo<VideoInfo>(list);
        Result result = Result.success();
        Map<String,Object> map = new HashMap<>();
        map.put("data",pageInfo);
        result.setData(map);
        return  result;

    }

    /**
     * 跳转首页
     *
     * @return
     */
    @RequestMapping("index.action")
    public String index(ModelMap map, HttpServletRequest request) {
        // 站点信息
        WebInfo webInfo = webInfoService.select();
        map.put("webInfo", webInfo);

        // 网站首页seo
        SeoInfo seoInfo = seoInfoService.selectByType("index");
        map.put("seoInfo", seoInfo);

        // 获取用户信息
        UserInfo userInfo = userInfoService.getUserInfo(request);
        map.put("userInfo", userInfo);

        // 获取所选模板
        String templatePC = templateInfoService.selectNameByType("pc");

        // 获取可用导航
        List<NavInfo> navlist = navInfoService.listIsUse();
        map.put("navlist", navlist);

        //查询开放手术，微创手术，全科医生培训 的信息 video_info中的视频链接，media_info中的图片链接 前6个倒序

        List<BizVideo> heartOpt = videoInfoService.listByMediaFieldValue(SystemOptDictConfig.OPEN_OPT_FIELD, "98");//首页--心脏手术
        List<BizVideo> skeOpt = videoInfoService.listByMediaFieldValue(SystemOptDictConfig.OPEN_OPT_FIELD, "99");//首页--骨科手术
        List<BizVideo> gutsOpt = videoInfoService.listByMediaFieldValue(SystemOptDictConfig.OPEN_OPT_FIELD, "100");//首页--胃肠手术
        List<BizVideo> headOpt = videoInfoService.listByMediaFieldValue(SystemOptDictConfig.OPEN_OPT_FIELD, "101");//首页--脑科手术

        List<BizVideo> dsaMir = videoInfoService.listByMediaFieldValue(SystemOptDictConfig.SMALL_OPT_FIELD, "102");//首页--DSA
        List<BizVideo> gutsMir = videoInfoService.listByMediaFieldValue(SystemOptDictConfig.SMALL_OPT_FIELD, "103");//首页--腔镜
        List<BizVideo> stomachMir = videoInfoService.listByMediaFieldValue(SystemOptDictConfig.SMALL_OPT_FIELD, "104");//首页--胃肠镜

        List<BizVideo> proSpeak = videoInfoService.listByMediaFieldValue(SystemOptDictConfig.LESSON_TRAIN_FIELD, "105");//首页--专家讲座
        List<BizVideo> proInterview = videoInfoService.listByMediaFieldValue(SystemOptDictConfig.LESSON_TRAIN_FIELD, "106");//首页--专家访谈

        map.put("heartOpt", heartOpt);
        map.put("skeOpt", skeOpt);
        map.put("gutsOpt", gutsOpt);
        map.put("headOpt", headOpt);

        map.put("dsaMir", dsaMir);
        map.put("gutsMir", gutsMir);
        map.put("stomachMir", stomachMir);

        map.put("proSpeak", proSpeak);
        map.put("proInterview", proInterview);

        for (NavInfo navInfo : navlist) {
            // 判断是否是首页
            if ("1".equals(navInfo.getIsIndex())) {
                // 判断该链接是否是系统内置的（或者是频道）
                if ("system".equals(navInfo.getType())) {
                    // 系统默认首页
                    if ("portal/index.action".equals(navInfo.getLink())) {
                        map.put("active", navInfo.getLink());
                        return "portal/pc/template/" + templatePC + "/index";
                    } else {
                        // 频道
                        String channelId = navInfo.getChannelId();
                        map.put("active", "portal/portal.action?channelId=" + channelId);
                        ChannelInfo channelInfo = channelInfoService.selectById(channelId);
                        return "portal/pc/template/" + templatePC + "/channel/" + channelInfo.getTemplate();
                    }
                } else {
                    // 自定义链接
                    map.put("active", navInfo.getLink());
                    return "redirect:" + navInfo.getLink();
                }
            }
        }

        return "portal/pc/template/" + templatePC + "/index";
    }

    /**
     * 跳转频道页面
     *
     * @return
     */
    @RequestMapping("portal.action")
    public String portal(ModelMap map,
                         HttpServletRequest request,
                         @RequestParam(value = "channelId") String channelId) {
        // 站点信息
        WebInfo webInfo = webInfoService.select();
        map.put("webInfo", webInfo);

        // 获取所选模板
        String templatePC = templateInfoService.selectNameByType("pc");

        // 判断合法性
        try {
            Integer.parseInt(channelId);
        } catch (Exception e) {
            // 404
            return "portal/pc/template/" + templatePC + "/error/404";
        }
        ChannelInfo channelInfo = channelInfoService.selectById(channelId);
        if (channelInfo == null) {
            // 404
            return "portal/pc/template/" + templatePC + "/error/404";
        }
        map.put("channelInfo", channelInfo);

        // 获取用户信息
        UserInfo userInfo = userInfoService.getUserInfo(request);
        map.put("userInfo", userInfo);

        // 获取可用导航
        List<NavInfo> navlist = navInfoService.listIsUse();
        map.put("navlist", navlist);

        map.put("active", "portal.action?channelId=" + channelId);

        return "portal/pc/template/" + templatePC + "/channel/" + channelInfo.getTemplate();
    }

    /**
     * 跳转到播放页面
     *
     * @param videoId 视频主键
     * @return
     */
    @RequestMapping("play.action")
    public String play(ModelMap map,
                       HttpServletRequest request,
                       @RequestParam(value = "videoId") String videoId) {
        // 站点信息
        WebInfo webInfo = webInfoService.select();
        map.put("webInfo", webInfo);

        // 获取所选模板
        String templatePC = templateInfoService.selectNameByType("pc");

        // 判断合法性
        try {
            Integer.parseInt(videoId);
        } catch (Exception e) {
            // 404
            return "portal/pc/template/" + templatePC + "/error/404";
        }
        // 获取该视频的信息
        VideoInfo videoInfo = videoInfoService.selectByIdWithPortal(videoId);
        if (videoInfo == null) {
            // 404
            return "portal/pc/template/" + templatePC + "/error/404";
        }
        if ("0".equals(videoInfo.getStatus())) {
            // 404
            return "portal/pc/template/" + templatePC + "/error/404";
        }
        map.put("videoInfo", videoInfo);

        // 视频播放页seo
        SeoInfo seoInfo = seoInfoService.selectByType("play");
        map.put("seoInfo", seoInfo);

        // 获取用户信息
        UserInfo userInfo = userInfoService.getUserInfo(request);
        map.put("userInfo", userInfo);

        // 获取可用导航
        List<NavInfo> navlist = navInfoService.listIsUse();
        map.put("navlist", navlist);

        // 根据主键，获取媒体信息
        Map<String, Object> mediaInfo = null;
        try {
            mediaInfo = mediaInfoService.selectByMediaId(videoInfo.getMediaId());
            map.put("mediaInfo", mediaInfo);
        } catch (QingException e) {
            // 404
            return "portal/pc/template/" + templatePC + "/error/404";
        }

        // 电脑端获取播放页模板
        TypeInfo typeInfo = typeInfoService.selectById(mediaInfo.get("type_id").toString());

        map.put("videoId", videoId);

        return "portal/pc/template/" + templatePC + "/play/" + typeInfo.getPlayTemplate();
    }

    /**
     * 跳转到媒体详情页面
     *
     * @param mediaId 视频主键
     * @return
     */
    @RequestMapping("profile.action")
    public String profile(ModelMap map,
                          HttpServletRequest request,
                          @RequestParam(value = "mediaId") String mediaId) {
        // 站点信息
        WebInfo webInfo = webInfoService.select();
        map.put("webInfo", webInfo);

        // 获取所选模板
        String templatePC = templateInfoService.selectNameByType("pc");

        // 判断合法性
        try {
            Integer.parseInt(mediaId);
        } catch (Exception e) {
            // 404
            return "portal/pc/template/" + templatePC + "/error/404";
        }
        // 根据主键，获取媒体信息
        Map<String, Object> mediaInfo = null;
        try {
            mediaInfo = mediaInfoService.selectByMediaId(mediaId);
            map.put("mediaInfo", mediaInfo);
        } catch (QingException e) {
            // 404
            return "portal/pc/template/" + templatePC + "/error/404";
        }

        // 网站首页seo
        SeoInfo seoInfo = seoInfoService.selectByType("profile");
        map.put("seoInfo", seoInfo);

        // 获取用户信息
        UserInfo userInfo = userInfoService.getUserInfo(request);
        map.put("userInfo", userInfo);

        // 获取可用导航
        List<NavInfo> navlist = navInfoService.listIsUse();
        map.put("navlist", navlist);

        // 电脑端获取详情页模板
        TypeInfo typeInfo = typeInfoService.selectById(mediaInfo.get("type_id").toString());
        String profileTemplate = typeInfo.getProfileTemplate();
        if (StringUtils.isEmpty(profileTemplate)) {
            // 404（该分类没有详情页面）
            return "portal/pc/template/" + templatePC + "/error/404";
        }

        map.put("mediaId", mediaId);

        return "portal/pc/template/" + templatePC + "/profile/" + profileTemplate;
    }

    /**
     * 跳转到搜索结果页面
     *
     * @param keyWord 关键词
     * @return
     */
    @RequestMapping("search.action")
    public String search(ModelMap map,
                         HttpServletRequest request,
                         @RequestParam(value = "keyWord") String keyWord) {

        // 站点信息
        WebInfo webInfo = webInfoService.select();
        map.put("webInfo", webInfo);

        // 获取用户信息
        UserInfo userInfo = userInfoService.getUserInfo(request);
        map.put("userInfo", userInfo);

        // 获取所选模板
        String templatePC = templateInfoService.selectNameByType("pc");

        // 获取可用导航
        List<NavInfo> navlist = navInfoService.listIsUse();
        map.put("navlist", navlist);

        map.put("keyWord", keyWord);

        return "portal/pc/template/" + templatePC + "/search/search";
    }

    /**
     * 跳转到分类检索页面
     *
     * @param
     * @return
     */
    @RequestMapping("list.action")
    public String list(ModelMap map,
                       HttpServletRequest request,
                       @RequestParam(value = "typeId") String typeId,
                       @RequestParam(required = false, value = "name") String fieldName,
                       @RequestParam(required = false, value = "value") String fieldValue) {
        // 站点信息
        WebInfo webInfo = webInfoService.select();
        map.put("webInfo", webInfo);

        // 获取所选模板
        String templatePC = templateInfoService.selectNameByType("pc");

        // 判断合法性
        try {
            Integer.parseInt(typeId);
        } catch (Exception e) {
            // 404
            return "portal/pc/template/" + templatePC + "/error/404";
        }
        List<FieldInfo> list = fieldInfoService.getListField(typeId, fieldName, fieldValue);
        if (list == null) {
            // 404
            return "portal/pc/template/" + templatePC + "/error/404";
        }
        map.put("list", list);

        // 分类检索页seo
        SeoInfo seoInfo = seoInfoService.selectByType("list");
        map.put("seoInfo", seoInfo);

        // 获取用户信息
        UserInfo userInfo = userInfoService.getUserInfo(request);
        map.put("userInfo", userInfo);

        // 获取可用导航
        List<NavInfo> navlist = navInfoService.listIsUse();
        map.put("navlist", navlist);

        map.put("typeId", typeId);
        map.put("fieldName", fieldName);
        map.put("fieldValue", fieldValue);

        return "portal/pc/template/" + templatePC + "/list/list";
    }

    /**
     * 跳转注册页面
     *
     * @return
     */
    @RequestMapping("register.action")
    public String register(ModelMap map) {
        // 站点信息
        WebInfo webInfo = webInfoService.select();
        map.put("webInfo", webInfo);

        // 获取所选模板
        String templatePC = templateInfoService.selectNameByType("pc");

        // 获取可用导航
        List<NavInfo> navlist = navInfoService.listIsUse();
        map.put("navlist", navlist);

        return "portal/pc/template/" + templatePC + "/user/register_page";
    }

    /**
     * 打开登录弹出层
     *
     * @return
     */
    @RequestMapping("login.action")
    public String login() {
        // 获取所选模板
        String templatePC = templateInfoService.selectNameByType("pc");

        return "portal/pc/template/" + templatePC + "/user/login";
    }

    /**
     * 跳转登录页面
     *
     * @return
     */
    @RequestMapping("login_page.action")
    public String loginPage(ModelMap map) {
        // 站点信息
        WebInfo webInfo = webInfoService.select();
        map.put("webInfo", webInfo);

        // 获取所选模板
        String templatePC = templateInfoService.selectNameByType("pc");

        return "portal/pc/template/" + templatePC + "/user/login_page";
    }

    /**
     * 跳转到找回密码页面
     *
     * @return
     */
    @RequestMapping("find_pwd.action")
    public String findPwd(ModelMap map) {
        // 站点信息
        WebInfo webInfo = webInfoService.select();
        map.put("webInfo", webInfo);

        // 获取所选模板
        String templatePC = templateInfoService.selectNameByType("pc");

        return "portal/pc/template/" + templatePC + "/user/find_pwd";
    }
}

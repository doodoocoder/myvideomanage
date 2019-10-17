package cn.shirdon.liao.util;

import cn.shirdon.liao.config.BusinessResourceConfig;
import cn.shirdon.liao.view.VideoInfo;

import java.io.File;

/**
 * @author chj
 * @date 2019/10/14
 * @description 对本地视频的一些操作
 */
public class VideoUtil {
    /**
     * @param videoInfo 视频
     * @author chj
     * @date 2019/10/14 13:26
     * @description 删除本地视频文件
     */
    public static boolean deleteLocal(VideoInfo videoInfo) {
        String url = videoInfo.getUrl();
        String fileName = StringUtil.substringAfterLast(url, BusinessResourceConfig.HTTP_VIDEO_PREFIX);
        File file = new File(BusinessResourceConfig.VIDEO_LOCAL_PATH + fileName);
        boolean flg = file.delete();
        return flg;
    }
}

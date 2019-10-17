package cn.shirdon.liao.config;

import org.springframework.core.io.support.PropertiesLoaderUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.IOException;
import java.util.Properties;

/**
 * @author chj
 * @date 2019/10/10
 * @description 加载视频及相关业务图片(不是系统用图片)的本地存储设置,封面的像素大小设置，及视频格式的设置
 */
public class BusinessResourceConfig implements ServletContextListener {
    public static String VIDEO_LOCAL_PATH;
    public static String PICTURE_LOCAL_PATH;
    public static String HTTP_VIDEO_PREFIX;
    public static String HTTP_PICTURE_PREFIX;
    public static int FENGMIAN_WIDTH=200;//封面的像素宽
    public static int FENGMIAN_HEIHT=200;//封面的像素高
    public static String[] TARGET_FORMATS={"mp4"};
    public static int NAME_SUFFIX_NUMS=5;//图片视频最后几位的随机位数
    public static String SEP_POINT=".";//文件中类型间隔符
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        try {
            Properties p = PropertiesLoaderUtils.loadAllProperties("business_resource.properties");
            VIDEO_LOCAL_PATH = p.getProperty("video_local_path");
            PICTURE_LOCAL_PATH = p.getProperty("picture_local_path");

            HTTP_VIDEO_PREFIX=System.getProperty("http.video.prefix");//从JVM获取外部传入的环境配置
            HTTP_PICTURE_PREFIX=System.getProperty("http.picture.prefix");//从JVM获取外部传入的环境配置

            if(HTTP_VIDEO_PREFIX == null && HTTP_PICTURE_PREFIX == null){
                System.out.println("********HTTP_VIDEO_PREFIX,HTTP_PICTURE_PREFIX为空值,使用配置文件中的配置*********");
                HTTP_VIDEO_PREFIX= p.getProperty("http_video_prefix");
                HTTP_PICTURE_PREFIX = p.getProperty("http_picture_prefix");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}

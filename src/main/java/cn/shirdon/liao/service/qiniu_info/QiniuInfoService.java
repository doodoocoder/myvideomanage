package cn.shirdon.liao.service.qiniu_info;

import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

import cn.shirdon.liao.config.BusinessResourceConfig;
import cn.shirdon.liao.constant.ErrorMsg;
import cn.shirdon.liao.exception.QingException;
import cn.shirdon.liao.util.DateUtil;
import cn.shirdon.liao.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import com.qiniu.util.UrlSafeBase64;

import cn.shirdon.liao.dao.qiniu_info.IQiniuInfoDAO;
import cn.shirdon.liao.view.QiniuInfo;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;

import javax.imageio.ImageIO;

@Service("QiniuInfoService")
public class QiniuInfoService {
    @Autowired
    private IQiniuInfoDAO iQiniuInfofoDAO;

    /**
     * 根据指定类型查询配置记录
     *
     * @param type 类型
     * @return
     */
    public QiniuInfo selectByType(String type) {
        return iQiniuInfofoDAO.selectByType(type);
    }

    /**
     * 保存配置
     *
     * @param qiniuInfo
     */
    public void save(QiniuInfo qiniuInfo) {
        iQiniuInfofoDAO.update(qiniuInfo);
    }

    /**
     * @author chj
     * @date 2019/10/10 16:51
     * @description 上传视频到本地服务器，不转换格式，只判断格式是否为flv
     */
    public String uploadVideoLocal(MultipartFile video) throws QingException, IOException {
        String fileName = video.getOriginalFilename();
        //获取文件后缀
        String endName = fileName.substring(fileName.lastIndexOf(BusinessResourceConfig.SEP_POINT)+1);
        for(String str:BusinessResourceConfig.TARGET_FORMATS){//只要匹配一个即可
            if(str.equals(endName)){
                fileName = DateUtil.getDay() + StringUtil.getRandomString(BusinessResourceConfig.NAME_SUFFIX_NUMS) +BusinessResourceConfig.SEP_POINT + endName;
                String localPath=BusinessResourceConfig.VIDEO_LOCAL_PATH + fileName;
                File localFile = new File(localPath);
                video.transferTo(localFile);

                //返回地址字符串
                String url = BusinessResourceConfig.HTTP_VIDEO_PREFIX + fileName;
                return url;
            }
        }
        String s = StringUtil.arrayToStr(BusinessResourceConfig.TARGET_FORMATS);
        throw new QingException("必须上传格式为"+s+"的视频");



    }

    /**
     * @author chj
     * @date 2019/10/10 14:03
     * @description 上传图片到本地, 包括图片压缩成200*300的大小，小于这个时不压缩
     */
    public String uploadImageLocal(MultipartFile uploadfile) throws IOException {

        String fileName = uploadfile.getOriginalFilename();
        //获取文件后缀
        String endName = fileName.substring(fileName.lastIndexOf(BusinessResourceConfig.SEP_POINT)+1);//得到jpg,png,gif

        fileName = DateUtil.getDay() + StringUtil.getRandomString(BusinessResourceConfig.NAME_SUFFIX_NUMS) +BusinessResourceConfig.SEP_POINT+ endName;

        InputStream byteInputStream = uploadfile.getInputStream();
        BufferedImage bufferedImage = ImageIO.read(byteInputStream);
        //图片压缩 200*200
        bufferedImage = resizeBufferedImage(bufferedImage, BusinessResourceConfig.FENGMIAN_WIDTH, BusinessResourceConfig.FENGMIAN_HEIHT, true);
        //写入本地
        String localPath = BusinessResourceConfig.PICTURE_LOCAL_PATH + fileName;
        File localFile = new File(localPath);
        ImageIO.write(bufferedImage, endName, localFile);
        //返回地址字符串
        String imgUrl = BusinessResourceConfig.HTTP_PICTURE_PREFIX + fileName;
        return imgUrl;
    }

    /**
     * 调整bufferedimage大小
     *
     * @param source  BufferedImage 原始image
     * @param targetW int  目标宽
     * @param targetH int  目标高
     * @param flag    boolean 是否同比例调整
     * @return BufferedImage  返回新image
     */
    private BufferedImage resizeBufferedImage(BufferedImage source, int targetW, int targetH, boolean flag) {
        int type = source.getType();
        BufferedImage target = null;
        double sx = (double) targetW / source.getWidth();
        double sy = (double) targetH / source.getHeight();
        if (flag && sx > sy) {
            sx = sy;
            targetW = (int) (sx * source.getWidth());
        } else if (flag && sx <= sy) {
            sy = sx;
            targetH = (int) (sy * source.getHeight());
        }
        if (type == BufferedImage.TYPE_CUSTOM) { // handmade
            ColorModel cm = source.getColorModel();
            WritableRaster raster = cm.createCompatibleWritableRaster(targetW, targetH);
            boolean alphaPremultiplied = cm.isAlphaPremultiplied();
            target = new BufferedImage(cm, raster, alphaPremultiplied, null);
        } else {
            target = new BufferedImage(targetW, targetH, type);
        }
        Graphics2D g = target.createGraphics();
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g.drawRenderedImage(source, AffineTransform.getScaleInstance(sx, sy));
        g.dispose();
        return target;
    }

    /**
     * 上传本地图片到七牛云
     *
     * @param file
     * @param qiniuInfo
     * @return
     * @throws IOException
     * @throws QingException
     */
    public String uploadImage(MultipartFile file, QiniuInfo qiniuInfo) throws IOException, QingException {
        /**
         * 构造一个带指定Zone对象的配置类
         * 华东 : Zone.zone0()
         * 华北 : Zone.zone1()
         * 华南 : Zone.zone2()
         * 北美 : Zone.zoneNa0()
         */
        Configuration cfg = new Configuration(Zone.zone0());
        // ...其他参数参考类注释
        UploadManager uploadManager = new UploadManager(cfg);
        // ...生成上传凭证，然后准备上传
        String accessKey = qiniuInfo.getAk();
        String secretKey = qiniuInfo.getSk();
        String bucket = qiniuInfo.getBucket();
        // 默认不指定key的情况下，以文件内容的hash值作为文件名
        String key = null;

        String imgUrl = "";
        try {
            // 数据流上传
            InputStream byteInputStream = file.getInputStream();
            Auth auth = Auth.create(accessKey, secretKey);
            String upToken = auth.uploadToken(bucket);
            try {
                Response response = uploadManager.put(byteInputStream, key, upToken, null, null);
                // 解析上传成功的结果
                DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
//				System.out.println(putRet.key);
//				System.out.println(putRet.hash);
                String deleteKey = putRet.hash;
                imgUrl = qiniuInfo.getDomain() + putRet.hash;

                // 判断是否需要对图片进行裁剪
                if ("0".equals(qiniuInfo.getWidth()) || "0".equals(qiniuInfo.getHeight())) {

                } else {
                    // 图片裁剪后再次上传
                    imgUrl = uploadCutImage(qiniuInfo, auth, cfg, bucket, imgUrl);
                    // 删除原图
                    deleteFile(auth, cfg, bucket, deleteKey);
                }
            } catch (QiniuException ex) {
                Response r = ex.response;
                System.err.println(r.toString());
                try {
                    System.err.println(r.bodyString());
                } catch (QiniuException ex2) {
                    // ignore
                }
                throw new QingException(ErrorMsg.ERROR_500002);
            }
        } catch (UnsupportedEncodingException ex) {
            // ignore
            throw new QingException(ErrorMsg.ERROR_500002);
        }

        return imgUrl;
    }

    /**
     * 远程图片上传到七牛云
     *
     * @param url       远程图片地址
     * @param qiniuInfo 七牛云对象
     * @return
     * @throws QingException
     */
    public String uploadImageByYuancheng(String url, QiniuInfo qiniuInfo) throws QingException {
        /**
         * 构造一个带指定Zone对象的配置类
         * 华东 : Zone.zone0()
         * 华北 : Zone.zone1()
         * 华南 : Zone.zone2()
         * 北美 : Zone.zoneNa0()
         */
        Configuration cfg = new Configuration(Zone.zone0());
        // ...生成上传凭证，然后准备上传
        String accessKey = qiniuInfo.getAk();
        String secretKey = qiniuInfo.getSk();
        String bucket = qiniuInfo.getBucket();
        // 默认不指定key的情况下，以文件内容的hash值作为文件名
        String key = null;

        String imgUrl = "";

        Auth auth = Auth.create(accessKey, secretKey);
        // 实例化一个BucketManager对象
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            int index = url.indexOf(".jpg");
            if (index > 0) {
                url = url.substring(0, index) + ".jpg";
            }

            String hash = bucketManager.fetch(url, bucket, key).hash;
//			System.out.println(hash);
            String deleteKey = hash;
            imgUrl = qiniuInfo.getDomain() + hash;

            // 判断是否需要对图片进行裁剪
            if ("0".equals(qiniuInfo.getWidth()) || "0".equals(qiniuInfo.getHeight())) {

            } else {
                // 图片裁剪后再次上传
                imgUrl = uploadCutImage(qiniuInfo, auth, cfg, bucket, imgUrl);
                // 删除原图
                deleteFile(auth, cfg, bucket, deleteKey);
            }
        } catch (QiniuException e) {
            e.printStackTrace();
            throw new QingException(ErrorMsg.ERROR_500001);
        }

        return imgUrl;
    }

    /**
     * 图片裁剪后再次上传
     *
     * @param qiniuInfo
     * @param auth
     * @param cfg
     * @param bucket
     * @param imgUrl
     * @return
     * @throws QingException
     */
    public String uploadCutImage(QiniuInfo qiniuInfo, Auth auth, Configuration cfg, String bucket, String imgUrl) throws QingException {
        String apiCut = "";
        String width = qiniuInfo.getWidth();
        String height = qiniuInfo.getHeight();
        String compress = qiniuInfo.getCompress();

        // 判断是否需要裁剪
        if ("0".equals(width) || "0".equals(height)) {
            // 不裁剪
        } else {
            // 裁剪
            apiCut = "?imageView2/1/w/" + width + "/h/" + height;
        }

        // 判断是否需要压缩
        if (!"".equals(apiCut)) {
            if ("0".equals(compress)) {
                apiCut += "/q/100";
            } else {
                apiCut += "/q/" + compress + "|imageslim";
            }
        }

        // 实例化一个BucketManager对象
        BucketManager bucketManager = new BucketManager(auth, cfg);
        // 要fetch的url
        String url = imgUrl + apiCut;
//		System.out.println(url);

        try {
            // 调用fetch方法抓取文件
            String hash = bucketManager.fetch(url, bucket, null).hash;
//			System.out.println(hash);

            return qiniuInfo.getDomain() + hash;
        } catch (QiniuException e) {
            e.printStackTrace();
            throw new QingException(ErrorMsg.ERROR_500003);
        }
    }

    /**
     * 删除七牛云空间的文件
     *
     * @param auth
     * @param cfg
     * @param bucket   空间名称
     * @param fileName 文件名称
     */
    public void deleteFile(Auth auth, Configuration cfg, String bucket, String fileName) {
        //构造一个带指定Zone对象的配置类
//		Configuration cfg = new Configuration(Zone.zone0());
        //...其他参数参考类注释
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            bucketManager.delete(bucket, fileName);
        } catch (QiniuException ex) {
            // 如果遇到异常，说明删除失败
            System.err.println(ex.code());
            System.err.println(ex.response.toString());
        }
    }

    /**
     * 上传base64图片
     *
     * @param file64
     * @param qiniuInfo
     * @return
     * @throws IOException
     */
    public String uploadAvatar(String file64, QiniuInfo qiniuInfo) throws IOException {
        // 密钥配置
        String ak = qiniuInfo.getAk();
        String sk = qiniuInfo.getSk();
        Auth auth = Auth.create(ak, sk);

        // 空间名
        String bucketname = qiniuInfo.getBucket();
        // 上传的图片名
        String key = UUID.randomUUID().toString().replace("-", "");

        file64 = file64.substring(22);
//		System.out.println("file64:"+file64);
        String url = "http://upload.qiniu.com/putb64/" + -1 + "/key/" + UrlSafeBase64.encodeToString(key);
        // 非华东空间需要根据注意事项 1 修改上传域名
        RequestBody rb = RequestBody.create(null, file64);
        String upToken = auth.uploadToken(bucketname, null, 3600, new StringMap().put("insertOnly", 1));
        Request request = new Request.Builder()
                .url(url)
                .addHeader("Content-Type", "application/octet-stream")
                .addHeader("Authorization", "UpToken " + upToken)
                .post(rb).build();
//		System.out.println(request.headers());
        OkHttpClient client = new OkHttpClient();
        okhttp3.Response response = client.newCall(request).execute();
        System.out.println(response);

        String imgUrl = qiniuInfo.getDomain() + key;

        return imgUrl;
    }


}

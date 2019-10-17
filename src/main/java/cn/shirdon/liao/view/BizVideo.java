package cn.shirdon.liao.view;

/**
 * @author chj
 * @date 2019/10/11
 * @description 与数据库中表没关系，是video_info,media_info中的某些字段，
 * 用于我方的业务视频
 */
public class BizVideo {
    private String imgUrl;//media_info表中的fengmian
    private String cnName;//小分类的中文名称 需要映射
    private String code;//小分类的value 99，100等
    private String vUrl;//video_info中的视频链接
    private int vid;//video id
    private int mid;//media id
    private String biaoti;//视频的标题

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getCnName() {
        return cnName;
    }

    public void setCnName(String cnName) {
        this.cnName = cnName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getvUrl() {
        return vUrl;
    }

    public void setvUrl(String vUrl) {
        this.vUrl = vUrl;
    }

    public int getVid() {
        return vid;
    }

    public void setVid(int vid) {
        this.vid = vid;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getBiaoti() {
        return biaoti;
    }

    public void setBiaoti(String biaoti) {
        this.biaoti = biaoti;
    }
}

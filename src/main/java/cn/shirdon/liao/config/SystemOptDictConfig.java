package cn.shirdon.liao.config;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.HashMap;
import java.util.Map;

/**
 * @author chj
 * @date 2019/10/11
 * @description 由于Media_info中的字段是动态添加的如open_opt(开放手术),small_opt(微创手术),lesson_train(培训)，
 * 当为radio时，Media_info中只记录了数字,把数字与中文映射好
 * field_info中的hmtl
 * 	<div class='unit'>		<div class='left'>			<p class='subtitle'>开放手术</p>
 * 	</div>		<div class='right'>			<ul class='equal-6'>
 * 	    <li><input type='radio' class='fill' name='open_opt' value='98' checked />心脏手术</li>
 * 	    <li><input type='radio' class='fill' name='open_opt' value='99' />骨科手术</li>
 * 	    <li><input type='radio' class='fill' name='open_opt' value='100' />胃肠手术</li>
 * 	    <li><input type='radio' class='fill' name='open_opt' value='101' />脑科手术</li>
 * 	</ul>		</div>		<span class='clearfix'></span>	</div>
 *
 * 		<div class='unit'>		<div class='left'>
 * 		    <p class='subtitle'>微创手术</p>		</div>
 * 		    <div class='right'>			<ul class='equal-8'>
 * 		        <li><input type='radio' class='fill' name='small_opt' value='102' checked />DSA</li>
 * 		        <li><input type='radio' class='fill' name='small_opt' value='103' />腔镜</li>
 * 		        <li><input type='radio' class='fill' name='small_opt' value='104' />胃肠镜</li>
 * 		</ul>		</div>		<span class='clearfix'></span>	</div>
 *
 * 		<div class='unit'>		<div class='left'>
 * 		    <p class='subtitle'>医生培训</p>		</div>
 * 		    <div class='right'>			<ul class='equal-6'>
 * 		        <li><input type='radio' class='fill' name='lesson_train' value='105' checked />专家讲座</li>
 * 		        <li><input type='radio' class='fill' name='lesson_train' value='106' />专家访谈</li>
 * 		        </ul>		</div>		<span class='clearfix'></span>	</div>
 */
public class   SystemOptDictConfig implements ServletContextListener {
    public static Map<String,String> DICT = new HashMap<String,String>();
    public static String OPEN_OPT_FIELD = "open_opt";//数据库表中的开放手术字段
    public static String SMALL_OPT_FIELD = "small_opt";//数据库表中的微创手术字段
    public static String LESSON_TRAIN_FIELD = "lesson_train";//数据库表中的培训字段


    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        DICT.put("98","心脏手术");
        DICT.put("99","骨科手术");
        DICT.put("100","胃肠手术");
        DICT.put("101","脑科手术");

        DICT.put("102","DSA");
        DICT.put("103","腔镜");
        DICT.put("104","胃肠镜");

        DICT.put("105","专家讲座");
        DICT.put("106","专家访谈");

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}

package cn.shirdon.liao.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import java.util.UUID;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;



/**
 * 关于String操作的一些工具方法
 */
public class StringUtil {
    /**
     *
     * @description  统一标准得到的uuid
     * @author       chenhuaijin
     * @CreateTime   2017年8月1日 上午11:39:08
     * @return
     */
    public static String uuid(){
        String uuid = UUID.randomUUID().toString();
        return uuid;
    }
    


	// 字符串转换unicode
	public static String stringToUnicode(String string) {
		StringBuffer unicode = new StringBuffer();
		for (int i = 0; i < string.length(); i++) {
			char c = string.charAt(i); // 取出每一个字符
			unicode.append("\\u" + Integer.toHexString(c));// 转换为unicode
		}
		return unicode.toString();
	}

	// unicode 转字符串
	public static String unicodeToString(String unicode) {
		StringBuffer string = new StringBuffer();
		String[] hex = unicode.split("\\\\u");
		for (int i = 1; i < hex.length; i++) {
			int data = Integer.parseInt(hex[i], 16);// 转换出每一个代码点
			string.append((char) data);// 追加成string
		}
		return string.toString();
	}
	

	/**
	 * 
	 * @description  截取最后个分隔符后面的内容，不包括分隔符
	 * @author       chenhuaijin
	 * @CreateTime   2017年7月28日 上午10:54:04
	 * @param str  要处理的字符串
	 * @param sepa 分隔符
	 * @return
	 */
	public static String substringAfterLast(String str,String sepa){
		String rlt = StringUtils.substringAfterLast(str,sepa);
		return rlt;
	}
	/**
	 * 
	 * @description  获取集合最大值
	 * @author       lanxuyu
	 * @CreateTime   2018年5月21日 下午5:26:06
	 * @param list
	 * @return
	 */
	public static Integer getMax(List<Integer> list){
		int max;  
		   
		max=list.get(0);  
		for(int i=0;i<list.size();i++)  
		{  
		if(list.get(i)>max)   // 判断最大值  
			max=list.get(i);  
		} 
		return max;
		
	}	
	/**
	 * 
	 * @description 生成不重复的Long
	 * @author       lanxuyu
	 * @CreateTime   2017年9月5日 上午9:19:08
	 * @return
	 */
	public static long randomNoDuplicate(){
		return System.currentTimeMillis()/1000 - 500;
	}
	public static long randomNum(){
		return new Date().getTime()/1000 - 500;
	}
	/**
	 * 
	 * @description  判断数组是否包含元素
	 * @author       lanxuyu
	 * @CreateTime   2019年2月27日 上午10:35:24
	 * @param arr
	 * @param value
	 * @return
	 */
	public static boolean arrContains(String[] arr,String value){
		for(String s:arr){
			if(s.equals(value)){
				return true;
			}
		}
		return false;
	}

	/**
	 * 
	 * @description  将字符串数组变成List
	 * @author       lanxuyu
	 * @CreateTime   2017年9月14日 上午11:45:47
	 * @param str
	 * @return
	 */
	public static List<String> arrayToList(String[] str){
		return Arrays.asList(str);
	}

	public static String arrayToStr(String[] str){
		if(str==null){
			return "";
		}
		String string="";
		for (int i = 0; i < str.length; i++) {
			if(i==0){
				string+=str[i];
			}else{
				string+=","+str[i];
			}
		}
		return string;
	}
	public static String listToStr(List<String> str){
		if(str==null){
			return "";
		}
		String string="";
		for (int i = 0; i < str.size(); i++) {
			if(i==0){
				string+=str.get(i);
			}else{
				string+=","+str.get(i);
			}
		}
		return string;
	}
	
	public static boolean stringIsNULL(String str){
		if("".equals(str)||str==null){
			return true;
		}
		return false;
	}




	
    


	public String Chr(int I) {
		return new String(String.valueOf((char) I));
	}
	/**
	 * 检测字符串是否不为空(null,"","null")
	 * @param s
	 * @return 不为空则返回true，否则返回false
	 */
	public static boolean notEmpty(String s) {
		return s != null && !"".equals(s) && !"null".equals(s);
	}

	/**
	 * 检测字符串是否为空(null,"","null")
	 * @param s
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean isEmpty(String s) {
		return s == null || "".equals(s) || "null".equals(s);
	}

	/**
	 * 字符串转换为字符串数组
	 * @param str 字符串
	 * @param splitRegex 分隔符
	 * @return
	 */
	public static String[] str2StrArray(String str, String splitRegex) {
		if (isEmpty(str)) {
			return null;
		}
		return str.split(splitRegex);
	}

	/**
	 * 用默认的分隔符(,)将字符串转换为字符串数组
	 * @param str 字符串
	 * @return
	 */
	public static String[] str2StrArray(String str) {
		return str2StrArray(str, ",\\s*");
	}

	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，日期转字符串
	 * @param date
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String date2Str(Date date) {
		return date2Str(date, "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，字符串转日期
	 * @param date
	 * @return
	 */
	public static Date str2Date(String date) {
		if (notEmpty(date)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				return sdf.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return new Date();
		} else {
			return null;
		}
	}

	public String NowWeekStr() {
		String[] dayName = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
		Calendar calendar = Calendar.getInstance();
		int dayOfweek = calendar.get(7) - 1;
		if (dayOfweek < 0) {
			dayOfweek = 0;
		}
		return dayName[dayOfweek];
	}

	public static String NowStr(String infmt) {
		return new SimpleDateFormat(infmt).format(Long.valueOf(System.currentTimeMillis()));
	}
	/**
	 * 按照参数format的格式，日期转字符串
	 * @param date
	 * @param format
	 * @return
	 */
	public static String date2Str(Date date, String format) {
		if (date != null) {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.format(date);
		} else {
			return "";
		}
	}
	
	/**
	 * 验证邮箱
	 * @param email
	 * @return
	 */
	public static boolean checkEmail(String email) {
		boolean flag = false;
		try {
			String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
			Pattern regex = Pattern.compile(check);
			Matcher matcher = regex.matcher(email);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}
	/**
	 * 
	 * @description  某个字符串是否包含另一个字符串
	 * @author       chenhuaijin
	 * @CreateTime   2017年9月5日 上午9:18:45
	 * @param str
	 * @param search
	 * @return
	 */
	public static boolean contains(String str,String search){
		return StringUtils.contains(str, search);
	}
	/**
	 * 
	 * @description  某个字符串是否以某个字符串开头
	 * @author       chenhuaijin
	 * @CreateTime   2017年9月5日 上午9:19:29
	 * @param str
	 * @param prefix
	 * @return
	 */
	public static boolean startWith(String str,String prefix){
		return StringUtils.startsWith(str, prefix);
	}
	/**
	 * 
	 * @description  把字符串左右的空格去掉
	 * @author       chenhuaijin
	 * @CreateTime   2017年9月14日 上午10:33:11
	 * @param str
	 * @return
	 */
	public static String trim(String str){
		return StringUtils.trim(str);
	}
	/**
	 * 时间差转换为 \天\时\分\秒  
	 */
	public static String longTimeToDay(Long ms){
        Integer ss = 1000;  
        Integer mi = ss * 60;  
        Integer hh = mi * 60;  
        Integer dd = hh * 24;  

        Long day = ms / dd;  
        Long hour = (ms - day * dd) / hh;  
        Long minute = (ms - day * dd - hour * hh) / mi;  
        Long second = (ms - day * dd - hour * hh - minute * mi) / ss;  
        Long milliSecond = ms - day * dd - hour * hh - minute * mi - second * ss;  

        StringBuffer sb = new StringBuffer();  
        if(day > 0) {  
            sb.append(day+"天");  
        }  
        if(hour > 0) {  
            sb.append(hour+"小时");  
        }  
        if(minute > 0) {  
            sb.append(minute+"分");  
        }  
        if(second > 0) {  
            sb.append(second+"秒");  
        }  
        if(milliSecond > 0) {  
            sb.append(milliSecond+"毫秒");  
        }  
        return sb.toString();  
    }
	/**
	 * 验证手机号码
	 * @return
	 */
	public static boolean checkMobileNumber(String mobileNumber) {
		boolean flag = false;
		try {
			Pattern regex = Pattern.compile("^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$");
			Matcher matcher = regex.matcher(mobileNumber);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	/**
	 * 随机生成六位数验证码
	 * @return
	 */
	public static int getRandomNum() {
		Random r = new Random();
		return r.nextInt(900000) + 100000;
	}

	private Map<String, String[]> map = new HashMap<String, String[]>();

	public Map<String, String[]> getMap(String Columns) {
		String[] ColumnsArray = Columns.split("\\#");
		for (int i = 0; i < ColumnsArray.length; i++) {
			String[] tempArray = ColumnsArray[i].split("\\;");
			map.put(tempArray[4].split("\\=")[1], tempArray);
		}
		return map;
	}

	public String getId(String name) {
		String[] tempArray = map.get(name);
		if (tempArray != null) {
			if (tempArray[4].split("\\=")[1].equals(name)) {
				return tempArray[0].split("\\=")[1];
			}
		}
		return "";
	}
	/**
	 * 把时间根据时、分、秒转换为时间段
	 * @param StrDate
	 */
	public static String getTimes(String StrDate) {
		String resultTimes = "";
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now;
		try {
			now = new Date();
			Date date = df.parse(StrDate);
			long times = now.getTime() - date.getTime();
			long day = times / (24 * 60 * 60 * 1000);
			long hour = (times / (60 * 60 * 1000) - day * 24);
			long min = ((times / (60 * 1000)) - day * 24 * 60 - hour * 60);
			long sec = (times / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
			StringBuffer sb = new StringBuffer();
			if (hour > 0) {
				sb.append(hour + "小时前");
			} else if (min > 0) {
				sb.append(min + "分钟前");
			} else {
				sb.append(sec + "秒前");
			}

			resultTimes = sb.toString();
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return resultTimes;
	}
	
	/**
	 * 写txt里的单行内容
	 * @param content 写入的内容
	 */
	public static void writeFile(String fileP, String content) {
		String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../"; // 项目路径
		filePath = (filePath.trim() + fileP.trim()).substring(6).trim();
		if (filePath.indexOf(":") != 1) {
			filePath = File.separator + filePath;
		}
		try {
			OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(filePath), "utf-8");
			BufferedWriter writer = new BufferedWriter(write);
			writer.write(content);
			writer.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 读取txt里的单行内容
	 */
	public static String readTxtFile(String fileP) {
		try {
			String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+ "../../"; // 项目路径
			filePath = filePath.replaceAll("file:/", "");
			filePath = filePath.replaceAll("%20", " ");
			filePath = filePath.trim() + fileP.trim();
			if (filePath.indexOf(":") != 1) {
				filePath = File.separator + filePath;
			}
			String encoding = "utf-8";
			File file = new File(filePath);
			if (file.isFile() && file.exists()) { // 判断文件是否存在
				InputStreamReader read = new InputStreamReader(
						new FileInputStream(file), encoding); // 考虑到编码格式
				BufferedReader bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					return lineTxt;
				}
				read.close();
			} else {
				System.out.println("找不到指定的文件,查看此路径是否正确:" + filePath);
			}
		} catch (Exception e) {
			System.out.println("读取文件内容出错");
		}
		return "";
	}
	public static Properties readProperties(String fileName){
		String path = Thread.currentThread().getContextClassLoader().getResource("").toString();
		path = path.replace('/', '\\'); // 将/换成\
		path = path.replace("file:", ""); // 去掉file:
//		path = path.replace("classes\\", ""); // 去掉class\
		path = path.substring(1); // 去掉第一个\,如 \D:\JavaWeb...
		Properties properties = new Properties();
		FileInputStream fileInputStream = null;
		try {
			fileInputStream = new FileInputStream(path + fileName);
			properties.load(fileInputStream);
			return properties;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fileInputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	private static final String HEX_NUMS_STR="0123456789ABCDEF";   
	private static final Integer SALT_LENGTH = 12;   
	/**   
     * 将16进制字符串转换成字节数组   
     * @param hex   
     * @return   
     */ 
    public static byte[] hexStringToByte(String hex) {   
        int len = (hex.length() / 2);   
        byte[] result = new byte[len];   
        char[] hexChars = hex.toCharArray();   
        for (int i = 0; i < len; i++) {   
            int pos = i * 2;   
            result[i] = (byte) (HEX_NUMS_STR.indexOf(hexChars[pos]) << 4 | HEX_NUMS_STR.indexOf(hexChars[pos + 1]));   
        }   
        return result;   
    }   

       
    /** 
     * 将指定byte数组转换成16进制字符串 
     * @param b 
     * @return 
     */ 
    public static String byteToHexString(byte[] b) {   
        StringBuffer hexString = new StringBuffer();   
        for (int i = 0; i < b.length; i++) {   
            String hex = Integer.toHexString(b[i] & 0xFF);   
            if (hex.length() == 1) {   
                hex = '0' + hex;   
            }   
            hexString.append(hex.toUpperCase());   
        }   
        return hexString.toString();   
    }   
       
    /** 
     * 验证口令是否合法 
     * @param password 
     * @param passwordInDb 
     * @return 
     * @throws NoSuchAlgorithmException 
     * @throws UnsupportedEncodingException 
     */ 
    public static boolean validPassword(String password, String passwordInDb)   
            throws NoSuchAlgorithmException, UnsupportedEncodingException {   
        //将16进制字符串格式口令转换成字节数组   
        byte[] pwdInDb = hexStringToByte(passwordInDb);   
        //声明盐变量   
        byte[] salt = new byte[SALT_LENGTH];   
        //将盐从数据库中保存的口令字节数组中提取出来   
        System.arraycopy(pwdInDb, 0, salt, 0, SALT_LENGTH);   
        //创建消息摘要对象   
        MessageDigest md = MessageDigest.getInstance("MD5");   
        //将盐数据传入消息摘要对象   
        md.update(salt);   
        //将口令的数据传给消息摘要对象   
        md.update(password.getBytes("UTF-8"));   
        //生成输入口令的消息摘要   
        byte[] digest = md.digest();   
        //声明一个保存数据库中口令消息摘要的变量   
        byte[] digestInDb = new byte[pwdInDb.length - SALT_LENGTH];   
        //取得数据库中口令的消息摘要   
        System.arraycopy(pwdInDb, SALT_LENGTH, digestInDb, 0, digestInDb.length);
        //比较根据输入口令生成的消息摘要和数据库中消息摘要是否相同   
        if (Arrays.equals(digest, digestInDb)) {   
            return true;   	//口令正确返回口令匹配消息   
        } else {   
            return false;   //口令不正确返回口令不匹配消息  
        }   
    }   

    /** 
     * 获得加密后的16进制形式口令 
     * @param password 
     * @return 
     * @throws NoSuchAlgorithmException 
     * @throws UnsupportedEncodingException 
     */ 
    public static String getEncryptedPwd(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {   
        //声明加密后的口令数组变量   
        byte[] pwd = null;   
        //随机数生成器   
        SecureRandom random = new SecureRandom();   
        //声明盐数组变量   
        byte[] salt = new byte[SALT_LENGTH];   
        //将随机数放入盐变量中   
        random.nextBytes(salt);   
        //声明消息摘要对象   
        MessageDigest md = null;   
        //创建消息摘要   
        md = MessageDigest.getInstance("MD5");   
        //将盐数据传入消息摘要对象   
        md.update(salt);   
        //将口令的数据传给消息摘要对象   
        md.update(password.getBytes("UTF-8"));   
        //获得消息摘要的字节数组   
        byte[] digest = md.digest();   
        //因为要在口令的字节数组中存放盐，所以加上盐的字节长度   
        pwd = new byte[digest.length + SALT_LENGTH];   
        //将盐的字节拷贝到生成的加密口令字节数组的前12个字节，以便在验证口令时取出盐   
        System.arraycopy(salt, 0, pwd, 0, SALT_LENGTH);   
        //将消息摘要拷贝到加密口令字节数组从第13个字节开始的字节   
        System.arraycopy(digest, 0, pwd, SALT_LENGTH, digest.length);   
        //将字节数组格式加密后的口令转化为16进制字符串格式的口令   
        return byteToHexString(pwd);   
    }   


	
	public static String readFile(String RFileName) throws Exception {
		BufferedReader fout = new BufferedReader(new FileReader(RFileName));
		String contact = "";
		String line = "";
		while ((line = fout.readLine()) != null) {
			contact = contact + line;
		}
		fout.close();
		return contact;
	}
	
	public static String CheckString(ResultSet rs, String FileName) throws Exception {
		String value = rs.getString(FileName);
		return (value == null) || ("null".equals(value)) ? "" : value;
	}	
	public Integer StrToInt(String str) {
		Integer ff = Integer.valueOf(0);
		try {
			ff = Integer.valueOf(str);
		} catch (Exception e) {
			ff = Integer.valueOf(0);
		}
		return ff;
	}

	public Integer StrToIntDef(String str, Integer Def) {
		try {
			return Integer.valueOf(str);
		} catch (Exception e) {
		}
		return Def;
	}

	public boolean IsNumberOfStr(String str) {
		boolean Boolean = false;
		try {
			Long.valueOf(str);
			Boolean = true;
		} catch (Exception e) {
			Boolean = false;
		}
		return Boolean;
	}

	public double StrToFloat(String str, double Def) {
		try {
			return Float.valueOf(str).floatValue();
		} catch (Exception e) {
		}
		return Def;
	}

	public String IntToStr(int Num) {
		return String.valueOf(Num);
	}

	public String ObjToStr(Object arg0) {
		return String.valueOf(arg0);
	}

	public Date StrToDateTime(String str) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = format.parse(str);
		return date;
	}
	public String getUUID () {
		UUID uuid = UUID.randomUUID();
		return uuid.toString().toUpperCase();
	}
	/**
	 * 转换字符串编码为utf-8
	 * @param Str
	 * @return
	 */
	
	public String toUtf8String(String Str) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < Str.length(); i++) {
			char c = Str.charAt(i);
			if ((c >= 0) && (c <= 'ÿ')) {
				sb.append(c);
			} else {
				byte[] b;
				try {
					b = Character.toString(c).getBytes("utf-8");
				} catch (Exception e) {
					System.out.println(e);
					b = new byte[0];
				}
				for (int j = 0; j < b.length; j++) {
					int k = b[j];
					if (k < 0) {
						k += 256;
					}
					sb.append(Integer.toHexString(k).toUpperCase());
				}
			}
		}
		return sb.toString();
	}
	
	 /**
     * 获取随机位数的字符串
     *
     * @author fengshuonan
     * @Date 2017/8/24 14:09
     */
    public static String getRandomString(int length) {
        String base = "abcdefghijklmnopqrstuvwxyz";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }



    /**
     * 获取异常的具体信息
     *
     * @author fengshuonan
     * @Date 2017/3/30 9:21
     * @version 2.0
     */
    public static String getExceptionMsg(Exception e) {
        StringWriter sw = new StringWriter();
        try {
            e.printStackTrace(new PrintWriter(sw));
        } finally {
            try {
                sw.close();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        return sw.getBuffer().toString().replaceAll("\\$", "T");
    }

    /**
     * 比较两个对象是否相等。<br>
     * 相同的条件有两个，满足其一即可：<br>
     * 1. obj1 == null && obj2 == null; 2. obj1.equals(obj2)
     *
     * @param obj1 对象1
     * @param obj2 对象2
     * @return 是否相等
     */
    public static boolean equals(Object obj1, Object obj2) {
        return (obj1 != null) ? (obj1.equals(obj2)) : (obj2 == null);
    }

    /**
     * 计算对象长度，如果是字符串调用其length函数，集合类调用其size函数，数组调用其length属性，其他可遍历对象遍历计算长度
     *
     * @param obj 被计算长度的对象
     * @return 长度
     */
    public static int length(Object obj) {
        if (obj == null) {
            return 0;
        }
        if (obj instanceof CharSequence) {
            return ((CharSequence) obj).length();
        }
        if (obj instanceof Collection) {
            return ((Collection<?>) obj).size();
        }
        if (obj instanceof Map) {
            return ((Map<?, ?>) obj).size();
        }

        int count;
        if (obj instanceof Iterator) {
            Iterator<?> iter = (Iterator<?>) obj;
            count = 0;
            while (iter.hasNext()) {
                count++;
                iter.next();
            }
            return count;
        }
        if (obj instanceof Enumeration) {
            Enumeration<?> enumeration = (Enumeration<?>) obj;
            count = 0;
            while (enumeration.hasMoreElements()) {
                count++;
                enumeration.nextElement();
            }
            return count;
        }
        if (obj.getClass().isArray() == true) {
            return Array.getLength(obj);
        }
        return -1;
    }

    /**
     * 对象中是否包含元素
     *
     * @param obj     对象
     * @param element 元素
     * @return 是否包含
     */
    public static boolean contains(Object obj, Object element) {
        if (obj == null) {
            return false;
        }
        if (obj instanceof String) {
            if (element == null) {
                return false;
            }
            return ((String) obj).contains(element.toString());
        }
        if (obj instanceof Collection) {
            return ((Collection<?>) obj).contains(element);
        }
        if (obj instanceof Map) {
            return ((Map<?, ?>) obj).values().contains(element);
        }

        if (obj instanceof Iterator) {
            Iterator<?> iter = (Iterator<?>) obj;
            while (iter.hasNext()) {
                Object o = iter.next();
                if (equals(o, element)) {
                    return true;
                }
            }
            return false;
        }
        if (obj instanceof Enumeration) {
            Enumeration<?> enumeration = (Enumeration<?>) obj;
            while (enumeration.hasMoreElements()) {
                Object o = enumeration.nextElement();
                if (equals(o, element)) {
                    return true;
                }
            }
            return false;
        }
        if (obj.getClass().isArray() == true) {
            int len = Array.getLength(obj);
            for (int i = 0; i < len; i++) {
                Object o = Array.get(obj, i);
                if (equals(o, element)) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 对象是否不为空(新增)
     *
     * @param obj String,List,Map,Object[],int[],long[]
     * @return
     */
    public static boolean isNotEmpty(Object o) {
        return !isEmpty(o);
    }

    /**
     * 对象是否为空
     *
     * @param obj String,List,Map,Object[],int[],long[]
     * @return
     */
    @SuppressWarnings("rawtypes")
    public static boolean isEmpty(Object o) {
        if (o == null) {
            return true;
        }
        if (o instanceof String) {
            if (o.toString().trim().equals("")) {
                return true;
            }
        } else if (o instanceof List) {
            if (((List) o).size() == 0) {
                return true;
            }
        } else if (o instanceof Map) {
            if (((Map) o).size() == 0) {
                return true;
            }
        } else if (o instanceof Set) {
            if (((Set) o).size() == 0) {
                return true;
            }
        } else if (o instanceof Object[]) {
            if (((Object[]) o).length == 0) {
                return true;
            }
        } else if (o instanceof int[]) {
            if (((int[]) o).length == 0) {
                return true;
            }
        } else if (o instanceof long[]) {
            if (((long[]) o).length == 0) {
                return true;
            }
        }
        return false;
    }

    /**
     * 对象组中是否存在 Empty Object
     *
     * @param os 对象组
     * @return
     */
    public static boolean isOneEmpty(Object... os) {
        for (Object o : os) {
            if (isEmpty(o)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 对象组中是否全是 Empty Object
     *
     * @param os
     * @return
     */
    public static boolean isAllEmpty(Object... os) {
        for (Object o : os) {
            if (!isEmpty(o)) {
                return false;
            }
        }
        return true;
    }

    /**
     * 是否为数字
     *
     * @param obj
     * @return
     */
    public static boolean isNum(Object obj) {
        try {
            Integer.parseInt(obj.toString());
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    /**
     * 如果为空, 则调用默认值
     *
     * @param str
     * @return
     */
    public static Object getValue(Object str, Object defaultValue) {
        if (isEmpty(str)) {
            return defaultValue;
        }
        return str;
    }


    /**
     * 强转->string,并去掉多余空格
     *
     * @param str
     * @return
     */
    public static String toStr(Object str) {
        return toStr(str, "");
    }

    /**
     * 强转->string,并去掉多余空格
     *
     * @param str
     * @param defaultValue
     * @return
     */
    public static String toStr(Object str, String defaultValue) {
        if (null == str) {
            return defaultValue;
        }
        return str.toString().trim();
    }

    /**
     * 强转->int
     *
     * @param obj
     * @return
     */
//	public static int toInt(Object value) {
//		return toInt(value, -1);
//	}

    /**
     * 强转->int
     *
     * @param obj
     * @param defaultValue
     * @return
     */
//	public static int toInt(Object value, int defaultValue) {
//		return Convert.toInt(value, defaultValue);
//	}

    /**
     * 强转->long
     *
     * @param obj
     * @return
     */
//	public static long toLong(Object value) {
//		return toLong(value, -1);
//	}

    /**
     * 强转->long
     *
     * @param obj
     * @param defaultValue
     * @return
     */
//	public static long toLong(Object value, long defaultValue) {
//		return Convert.toLong(value, defaultValue);
//	}
//
//	public static String encodeUrl(String url) {
//		return URLKit.encode(url, CharsetKit.UTF_8);
//	}
//
//	public static String decodeUrl(String url) {
//		return URLKit.decode(url, CharsetKit.UTF_8);
//	}

    /**
     * map的key转为小写
     *
     * @param map
     * @return Map<String,Object>
     */
    public static Map<String, Object> caseInsensitiveMap(Map<String, Object> map) {
        Map<String, Object> tempMap = new HashMap<>();
        for (String key : map.keySet()) {
            tempMap.put(key.toLowerCase(), map.get(key));
        }
        return tempMap;
    }

    /**
     * 获取map中第一个数据值
     *
     * @param <K> Key的类型
     * @param <V> Value的类型
     * @param map 数据源
     * @return 返回的值
     */
    public static <K, V> V getFirstOrNull(Map<K, V> map) {
        V obj = null;
        for (Entry<K, V> entry : map.entrySet()) {
            obj = entry.getValue();
            if (obj != null) {
                break;
            }
        }
        return obj;
    }

    /**
     * 创建StringBuilder对象
     *
     * @return StringBuilder对象
     */
    public static StringBuilder builder(String... strs) {
        final StringBuilder sb = new StringBuilder();
        for (String str : strs) {
            sb.append(str);
        }
        return sb;
    }

    /**
     * 创建StringBuilder对象
     *
     * @return StringBuilder对象
     */
    public static void builder(StringBuilder sb, String... strs) {
        for (String str : strs) {
            sb.append(str);
        }
    }

    /**
     * 去掉指定后缀
     *
     * @param str    字符串
     * @param suffix 后缀
     * @return 切掉后的字符串，若后缀不是 suffix， 返回原字符串
     */
    public static String removeSuffix(String str, String suffix) {
        if (isEmpty(str) || isEmpty(suffix)) {
            return str;
        }

        if (str.endsWith(suffix)) {
            return str.substring(0, str.length() - suffix.length());
        }
        return str;
    }



    /**
     * 判断是否是windows操作系统
     *
     * @author stylefeng
     * @Date 2017/5/24 22:34
     */
    public static Boolean isWinOs() {
        String os = System.getProperty("os.name");
        if (os.toLowerCase().startsWith("win")) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 获取临时目录
     *
     * @author stylefeng
     * @Date 2017/5/24 22:35
     */
    public static String getTempPath() {
        return System.getProperty("java.io.tmpdir");
    }

    /**
     * 把一个数转化为int
     *
     * @author fengshuonan
     * @Date 2017/11/15 下午11:10
     */
    public static Integer toInt(Object val) {
        if (val instanceof Double) {
            BigDecimal bigDecimal = new BigDecimal((Double) val);
            return bigDecimal.intValue();
        } else {
            return Integer.valueOf(val.toString());
        }

    }
	public static String conversionAttribute(String s,String alias){
		if(Character.isUpperCase(s.charAt(0))){
			s=(new StringBuilder()).append(Character.toLowerCase(s.charAt(0))).append(s.substring(1)).toString();
		}
		String[]ss = new String [s.length()];
        int count = 0;
        ss[count] = "";
        for( int i = 0 ; i<s.length(); i++ ){            
            char a = s.charAt(i);
            String b = ""+a;            
            if( a>64 && a<91 ){ //大写字母的ASCLL码取值范围                
                count++;                
                ss[count]=b;                
            }else{                
                ss[count]=ss[count].concat(b);                
            }            
        }
       String result="";
       for( int i = 0 ; i < ss.length ; i++){
    	   if(ss[i]!=null){
	        	String lowerCase = ss[i].toLowerCase();
	        	if(i==0){
	        		result=lowerCase;
	        	}else{
	        		result+="_"+lowerCase;
	        	}
    	   }
        }
       if(StringUtils.isNoneBlank(alias)){
    	   result=alias+""+result;
       }
       return result;
	}
}

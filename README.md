# videoManage视频管理系统

#### 项目介绍

#### 软件架构 
前端：javaex  
后端：ssm  
数据库：sql server 2012以上，用mysql.sql要改一些数据库系统函数，比较麻烦，用sqlserver要将数据的排序规则改为Chinese_PRC_CI_AS，否则中文乱码   navicat直接改 编辑数据库--排序规则,然后删除所有表，再重新导入sql即可  
IDE：idea  
JDK：1.8    
tomcat：tomcat8  

#### 特别说明 
前后台用户名 账号：admin 密码：111111 管理员登录后可进入后台  
javaex前端框架官网：http://www.javaex.cn/ 原版视频网站，只是维护视频的url,所有视频及相关的图片都在第三方，并不是在本地。  
数据库image: exoplatform/sqlserver:2017-CU8  
程序打包直接用idea的package打包war

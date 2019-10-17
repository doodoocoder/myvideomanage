/*
Navicat SQL Server Data Transfer

Source Server         : 213_vm
Source Server Version : 120000
Source Host           : 192.168.120.213:1433
Source Database       : vm
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 120000
File Encoding         : 65001

Date: 2019-10-10 18:08:19
*/


-- ----------------------------
-- Table structure for activate_info
-- ----------------------------
DROP TABLE [dbo].[activate_info]
GO
CREATE TABLE [dbo].[activate_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[user_id] int NOT NULL ,
[type] varchar(50) NOT NULL ,
[code] varchar(50) NOT NULL ,
[create_time] datetime NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[activate_info]', RESEED, 41)
GO

-- ----------------------------
-- Records of activate_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[activate_info] ON
GO
SET IDENTITY_INSERT [dbo].[activate_info] OFF
GO

-- ----------------------------
-- Table structure for api_info
-- ----------------------------
DROP TABLE [dbo].[api_info]
GO
CREATE TABLE [dbo].[api_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(100) NOT NULL ,
[sort] int NOT NULL ,
[type] varchar(50) NOT NULL ,
[leixing] varchar(50) NULL ,
[diqu] varchar(50) NULL ,
[nianfen] varchar(50) NULL ,
[zhuangtai] varchar(50) NULL ,
[zifei] varchar(50) NULL ,
[xingqi] varchar(50) NULL ,
[type_id] varchar(50) NULL ,
[field] varchar(50) NULL ,
[num] int NULL ,
[tag] varchar(50) NULL ,
[select_video] int NULL ,
[kandian] varchar(100) NULL ,
[zongjishu] varchar(100) NULL ,
[shangyingnianfen] varchar(100) NULL ,
[fengge] varchar(100) NULL ,
[shengyou] varchar(100) NULL ,
[rank_type] varchar(50) NULL ,
[cache_time] varchar(50) NULL ,
[mingxing] varchar(100) NULL ,
[heart_opt] varchar(100) NULL ,
[ske_opt] varchar(100) NULL ,
[guts_opt] varchar(100) NULL ,
[head_opt] varchar(100) NULL ,
[category] varchar(100) NULL ,
[test_a] varchar(100) NULL ,
[open_opt] varchar(100) NULL ,
[small_opt] varchar(100) NULL ,
[lesson_train] varchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[api_info]', RESEED, 35)
GO

-- ----------------------------
-- Records of api_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[api_info] ON
GO
SET IDENTITY_INSERT [dbo].[api_info] OFF
GO

-- ----------------------------
-- Table structure for channel_info
-- ----------------------------
DROP TABLE [dbo].[channel_info]
GO
CREATE TABLE [dbo].[channel_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(50) NOT NULL ,
[sort] int NOT NULL ,
[template] varchar(50) NULL ,
[title] varchar(255) NULL ,
[keywords] varchar(255) NULL ,
[description] varchar(500) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[channel_info]', RESEED, 3)
GO

-- ----------------------------
-- Records of channel_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[channel_info] ON
GO
SET IDENTITY_INSERT [dbo].[channel_info] OFF
GO

-- ----------------------------
-- Table structure for collection_info
-- ----------------------------
DROP TABLE [dbo].[collection_info]
GO
CREATE TABLE [dbo].[collection_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[media_id] int NOT NULL ,
[user_id] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[collection_info]', RESEED, 88)
GO

-- ----------------------------
-- Records of collection_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[collection_info] ON
GO
SET IDENTITY_INSERT [dbo].[collection_info] OFF
GO

-- ----------------------------
-- Table structure for comment_info
-- ----------------------------
DROP TABLE [dbo].[comment_info]
GO
CREATE TABLE [dbo].[comment_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[video_id] int NOT NULL ,
[user_id] int NOT NULL ,
[content] varchar(1000) NOT NULL ,
[update_time] datetime NOT NULL ,
[login_name] varchar(255) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[comment_info]', RESEED, 52)
GO

-- ----------------------------
-- Records of comment_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[comment_info] ON
GO
SET IDENTITY_INSERT [dbo].[comment_info] OFF
GO

-- ----------------------------
-- Table structure for email_info
-- ----------------------------
DROP TABLE [dbo].[email_info]
GO
CREATE TABLE [dbo].[email_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[smtp] varchar(50) NULL ,
[port] int NULL ,
[email] varchar(50) NULL ,
[password] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[email_info]', RESEED, 3)
GO

-- ----------------------------
-- Records of email_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[email_info] ON
GO
SET IDENTITY_INSERT [dbo].[email_info] OFF
GO

-- ----------------------------
-- Table structure for field_info
-- ----------------------------
DROP TABLE [dbo].[field_info]
GO
CREATE TABLE [dbo].[field_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(50) NOT NULL ,
[sort] int NOT NULL ,
[input_type] varchar(50) NOT NULL ,
[var_name] varchar(50) NOT NULL ,
[content] varchar(MAX) NULL ,
[type] varchar(50) NULL ,
[is_allow_edit] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[field_info]', RESEED, 56)
GO

-- ----------------------------
-- Records of field_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[field_info] ON
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'7', N'海报', N'1', N'image', N'haibao', N'', N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'8', N'小封面', N'1', N'image', N'fengmian', N'', N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'12', N'简介', N'1', N'textarea', N'jianjie', N'', N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'13', N'标题', N'1', N'text', N'biaoti', N'', N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'21', N'别名', N'1', N'text', N'bieming', N'', N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'23', N'媒体主键', N'1', N'text', N'media_id', null, N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'24', N'分类id', N'1', N'text', N'type_id', null, N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'25', N'媒体状态', N'1', N'text', N'status', null, N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'26', N'更新时间', N'1', N'text', N'update_time', null, N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'27', N'标签', N'1', N'text', N'tag', null, N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'28', N'主键', N'1', N'text', N'id', null, N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'32', N'接口字段', N'1', N'text', N'field', null, N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'33', N'接口名称', N'1', N'text', N'name', null, N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'34', N'接口排序', N'1', N'text', N'sort', null, N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'35', N'接口类型', N'1', N'text', N'type', null, N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'45', N'大封面', N'1', N'image', N'dafengmian', null, N'system', null)
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'54', N'开放手术', N'1', N'radio', N'open_opt', N'	<div class=''unit''>		<div class=''left''>			<p class=''subtitle''>开放手术</p>		</div>		<div class=''right''>			<ul class=''equal-6''>		<li><input type=''radio'' class=''fill'' name=''open_opt'' value=''98'' checked />心脏手术</li>		<li><input type=''radio'' class=''fill'' name=''open_opt'' value=''99'' />骨科手术</li>		<li><input type=''radio'' class=''fill'' name=''open_opt'' value=''100'' />胃肠手术</li>		<li><input type=''radio'' class=''fill'' name=''open_opt'' value=''101'' />脑科手术</li>			</ul>		</div>		<span class=''clearfix''></span>	</div>', N'user', N'1')
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'55', N'微创手术', N'2', N'radio', N'small_opt', N'	<div class=''unit''>		<div class=''left''>			<p class=''subtitle''>微创手术</p>		</div>		<div class=''right''>			<ul class=''equal-8''>		<li><input type=''radio'' class=''fill'' name=''small_opt'' value=''102'' checked />DSA</li>		<li><input type=''radio'' class=''fill'' name=''small_opt'' value=''103'' />腔镜</li>		<li><input type=''radio'' class=''fill'' name=''small_opt'' value=''104'' />胃肠镜</li>			</ul>		</div>		<span class=''clearfix''></span>	</div>', N'user', N'1')
GO
GO
INSERT INTO [dbo].[field_info] ([id], [name], [sort], [input_type], [var_name], [content], [type], [is_allow_edit]) VALUES (N'56', N'医生培训', N'3', N'radio', N'lesson_train', N'	<div class=''unit''>		<div class=''left''>			<p class=''subtitle''>医生培训</p>		</div>		<div class=''right''>			<ul class=''equal-6''>		<li><input type=''radio'' class=''fill'' name=''lesson_train'' value=''105'' checked />专家讲座</li>		<li><input type=''radio'' class=''fill'' name=''lesson_train'' value=''106'' />专家访谈</li>			</ul>		</div>		<span class=''clearfix''></span>	</div>', N'user', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[field_info] OFF
GO

-- ----------------------------
-- Table structure for field_profile_info
-- ----------------------------
DROP TABLE [dbo].[field_profile_info]
GO
CREATE TABLE [dbo].[field_profile_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(50) NOT NULL ,
[sort] int NOT NULL ,
[field_id] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[field_profile_info]', RESEED, 106)
GO

-- ----------------------------
-- Records of field_profile_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[field_profile_info] ON
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'94', N'心脏手术', N'1', N'51')
GO
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'95', N'骨科手术', N'2', N'51')
GO
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'96', N'胃肠手术', N'3', N'51')
GO
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'97', N'脑科手术', N'4', N'51')
GO
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'98', N'心脏手术', N'1', N'54')
GO
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'99', N'骨科手术', N'2', N'54')
GO
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'100', N'胃肠手术', N'3', N'54')
GO
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'101', N'脑科手术', N'4', N'54')
GO
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'102', N'DSA', N'1', N'55')
GO
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'103', N'腔镜', N'2', N'55')
GO
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'104', N'胃肠镜', N'3', N'55')
GO
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'105', N'专家讲座', N'1', N'56')
GO
GO
INSERT INTO [dbo].[field_profile_info] ([id], [name], [sort], [field_id]) VALUES (N'106', N'专家访谈', N'2', N'56')
GO
GO
SET IDENTITY_INSERT [dbo].[field_profile_info] OFF
GO

-- ----------------------------
-- Table structure for group_info
-- ----------------------------
DROP TABLE [dbo].[group_info]
GO
CREATE TABLE [dbo].[group_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(50) NOT NULL ,
[power] int NOT NULL ,
[type] varchar(50) NOT NULL ,
[sort] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[group_info]', RESEED, 12)
GO

-- ----------------------------
-- Records of group_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[group_info] ON
GO
INSERT INTO [dbo].[group_info] ([id], [name], [power], [type], [sort]) VALUES (N'1', N'管理员', N'255', N'system', N'1')
GO
GO
INSERT INTO [dbo].[group_info] ([id], [name], [power], [type], [sort]) VALUES (N'2', N'注册用户', N'1', N'system', N'3')
GO
GO
SET IDENTITY_INSERT [dbo].[group_info] OFF
GO

-- ----------------------------
-- Table structure for history_info
-- ----------------------------
DROP TABLE [dbo].[history_info]
GO
CREATE TABLE [dbo].[history_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[video_id] int NOT NULL ,
[user_id] int NOT NULL ,
[update_time] datetime NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[history_info]', RESEED, 1111)
GO

-- ----------------------------
-- Records of history_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[history_info] ON
GO
SET IDENTITY_INSERT [dbo].[history_info] OFF
GO

-- ----------------------------
-- Table structure for media_info
-- ----------------------------
DROP TABLE [dbo].[media_info]
GO
CREATE TABLE [dbo].[media_info] (
[media_id] int NOT NULL IDENTITY(1,1) ,
[update_time] datetime NOT NULL ,
[status] int NOT NULL ,
[haibao] varchar(200) NULL ,
[fengmian] varchar(200) NULL ,
[biaoti] varchar(100) NULL ,
[kandian] varchar(50) NULL ,
[jianjie] varchar(5000) NULL ,
[tag] varchar(100) NULL ,
[zongjishu] varchar(50) NULL ,
[bieming] varchar(200) NULL ,
[type_id] int NOT NULL ,
[dafengmian] varchar(200) NULL ,
[has_video] int NULL ,
[open_opt] varchar(100) NULL ,
[small_opt] varchar(100) NULL ,
[lesson_train] varchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[media_info]', RESEED, 191)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'media_info', 
'COLUMN', N'fengmian')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'就是小封面'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'media_info'
, @level2type = 'COLUMN', @level2name = N'fengmian'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'就是小封面'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'media_info'
, @level2type = 'COLUMN', @level2name = N'fengmian'
GO

-- ----------------------------
-- Records of media_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[media_info] ON
GO
INSERT INTO [dbo].[media_info] ([media_id], [update_time], [status], [haibao], [fengmian], [biaoti], [kandian], [jianjie], [tag], [zongjishu], [bieming], [type_id], [dafengmian], [has_video], [open_opt], [small_opt], [lesson_train]) VALUES (N'181', N'2019-10-10 11:14:43.550', N'0', N'', N'', N'胰十二指肠切除术', null, N'<p><a href="http://www.yiyouku.com.cn/vod/play/638" style="padding: 0px; margin: 0px; color: rgb(50, 111, 133); width: 125px; overflow: hidden; font-family: &quot;Microsoft yahei&quot;, Arial; font-size: 12px; background-color: rgb(237, 237, 237);">胰十二指肠切除术</a><br></p>', N'', null, N'胰十二指肠切除术', N'6', N'', N'0', N'100', null, null)
GO
GO
INSERT INTO [dbo].[media_info] ([media_id], [update_time], [status], [haibao], [fengmian], [biaoti], [kandian], [jianjie], [tag], [zongjishu], [bieming], [type_id], [dafengmian], [has_video], [open_opt], [small_opt], [lesson_train]) VALUES (N'182', N'2019-10-10 11:22:47.117', N'1', N'', N'', N'胰十二指肠切除术', null, N'<p><a href="http://www.yiyouku.com.cn/vod/play/638" style="padding: 0px; margin: 0px; color: rgb(50, 111, 133); width: 125px; overflow: hidden; font-family: &quot;Microsoft yahei&quot;, Arial; font-size: 12px; background-color: rgb(237, 237, 237);">胰十二指肠切除术</a><br></p>', N'', null, N'胰十二指肠切除术', N'6', N'', N'0', N'100', null, null)
GO
GO
INSERT INTO [dbo].[media_info] ([media_id], [update_time], [status], [haibao], [fengmian], [biaoti], [kandian], [jianjie], [tag], [zongjishu], [bieming], [type_id], [dafengmian], [has_video], [open_opt], [small_opt], [lesson_train]) VALUES (N'183', N'2019-10-10 11:23:01.047', N'1', N'', N'', N'胰十二指肠切除术', null, N'<p><a href="http://www.yiyouku.com.cn/vod/play/638" style="padding: 0px; margin: 0px; color: rgb(50, 111, 133); width: 125px; overflow: hidden; font-family: &quot;Microsoft yahei&quot;, Arial; font-size: 12px; background-color: rgb(237, 237, 237);">胰十二指肠切除术</a><br></p>', N'', null, N'胰十二指肠切除术', N'6', N'', N'0', N'98', null, null)
GO
GO
INSERT INTO [dbo].[media_info] ([media_id], [update_time], [status], [haibao], [fengmian], [biaoti], [kandian], [jianjie], [tag], [zongjishu], [bieming], [type_id], [dafengmian], [has_video], [open_opt], [small_opt], [lesson_train]) VALUES (N'184', N'2019-10-10 11:23:09.390', N'1', N'', N'', N'胰十二指肠切除术', null, N'<p><a href="http://www.yiyouku.com.cn/vod/play/638" style="padding: 0px; margin: 0px; color: rgb(50, 111, 133); width: 125px; overflow: hidden; font-family: &quot;Microsoft yahei&quot;, Arial; font-size: 12px; background-color: rgb(237, 237, 237);">胰十二指肠切除术</a><br></p>', N'', null, N'胰十二指肠切除术', N'6', N'', N'0', N'98', null, null)
GO
GO
INSERT INTO [dbo].[media_info] ([media_id], [update_time], [status], [haibao], [fengmian], [biaoti], [kandian], [jianjie], [tag], [zongjishu], [bieming], [type_id], [dafengmian], [has_video], [open_opt], [small_opt], [lesson_train]) VALUES (N'185', N'2019-10-10 11:23:18.670', N'1', N'', N'', N'胰十二指肠切除术', null, N'<p><a href="http://www.yiyouku.com.cn/vod/play/638" style="padding: 0px; margin: 0px; color: rgb(50, 111, 133); width: 125px; overflow: hidden; font-family: &quot;Microsoft yahei&quot;, Arial; font-size: 12px; background-color: rgb(237, 237, 237);">胰十二指肠切除术</a><br></p>', N'', null, N'胰十二指肠切除术', N'6', N'', N'0', N'100', null, null)
GO
GO
INSERT INTO [dbo].[media_info] ([media_id], [update_time], [status], [haibao], [fengmian], [biaoti], [kandian], [jianjie], [tag], [zongjishu], [bieming], [type_id], [dafengmian], [has_video], [open_opt], [small_opt], [lesson_train]) VALUES (N'186', N'2019-10-10 11:23:29.850', N'1', N'', N'', N'胰十二指肠切除术', null, N'<p><a href="http://www.yiyouku.com.cn/vod/play/638" style="padding: 0px; margin: 0px; color: rgb(50, 111, 133); width: 125px; overflow: hidden; font-family: &quot;Microsoft yahei&quot;, Arial; font-size: 12px; background-color: rgb(237, 237, 237);">胰十二指肠切除术</a><br></p>', N'', null, N'胰十二指肠切除术', N'6', N'', N'0', N'98', null, null)
GO
GO
INSERT INTO [dbo].[media_info] ([media_id], [update_time], [status], [haibao], [fengmian], [biaoti], [kandian], [jianjie], [tag], [zongjishu], [bieming], [type_id], [dafengmian], [has_video], [open_opt], [small_opt], [lesson_train]) VALUES (N'187', N'2019-10-10 11:23:37.870', N'1', N'', N'', N'胰十二指肠切除术', null, N'<p><a href="http://www.yiyouku.com.cn/vod/play/638" style="padding: 0px; margin: 0px; color: rgb(50, 111, 133); width: 125px; overflow: hidden; font-family: &quot;Microsoft yahei&quot;, Arial; font-size: 12px; background-color: rgb(237, 237, 237);">胰十二指肠切除术</a><br></p>', N'', null, N'', N'6', N'', N'0', N'98', null, null)
GO
GO
INSERT INTO [dbo].[media_info] ([media_id], [update_time], [status], [haibao], [fengmian], [biaoti], [kandian], [jianjie], [tag], [zongjishu], [bieming], [type_id], [dafengmian], [has_video], [open_opt], [small_opt], [lesson_train]) VALUES (N'188', N'2019-10-10 11:23:45.517', N'1', N'', N'', N'胰十二指肠切除术', null, N'<p><a href="http://www.yiyouku.com.cn/vod/play/638" style="padding: 0px; margin: 0px; color: rgb(50, 111, 133); width: 125px; overflow: hidden; font-family: &quot;Microsoft yahei&quot;, Arial; font-size: 12px; background-color: rgb(237, 237, 237);">胰十二指肠切除术</a><br></p>', N'', null, N'胰十二指肠切除术', N'6', N'', N'0', N'98', null, null)
GO
GO
INSERT INTO [dbo].[media_info] ([media_id], [update_time], [status], [haibao], [fengmian], [biaoti], [kandian], [jianjie], [tag], [zongjishu], [bieming], [type_id], [dafengmian], [has_video], [open_opt], [small_opt], [lesson_train]) VALUES (N'189', N'2019-10-10 11:23:55.677', N'1', N'', N'', N'胰十二指肠切除术', null, N'<p><a href="http://www.yiyouku.com.cn/vod/play/638" style="padding: 0px; margin: 0px; color: rgb(50, 111, 133); width: 125px; overflow: hidden; font-family: &quot;Microsoft yahei&quot;, Arial; font-size: 12px; background-color: rgb(237, 237, 237);">胰十二指肠切除术</a><br></p>', N'', null, N'', N'6', N'', N'0', N'98', null, null)
GO
GO
INSERT INTO [dbo].[media_info] ([media_id], [update_time], [status], [haibao], [fengmian], [biaoti], [kandian], [jianjie], [tag], [zongjishu], [bieming], [type_id], [dafengmian], [has_video], [open_opt], [small_opt], [lesson_train]) VALUES (N'190', N'2019-10-10 11:24:03.490', N'1', N'', N'', N'胰十二指肠切除术', null, N'<p><a href=', N'', null, N'', N'6', N'', N'0', N'98', null, null)
GO
GO
INSERT INTO [dbo].[media_info] ([media_id], [update_time], [status], [haibao], [fengmian], [biaoti], [kandian], [jianjie], [tag], [zongjishu], [bieming], [type_id], [dafengmian], [has_video], [open_opt], [small_opt], [lesson_train]) VALUES (N'191', N'2019-10-10 17:27:20.077', N'1', N'', N'http://192.168.120.66:8081/picture/2019-10-10jn2ap379vi.png', N'胰十二指肠切除术', null, N'<p></p><p><a href=', N'', null, N'', N'6', N'', N'1', N'98', null, null)
GO
GO
SET IDENTITY_INSERT [dbo].[media_info] OFF
GO

-- ----------------------------
-- Table structure for nav_info
-- ----------------------------
DROP TABLE [dbo].[nav_info]
GO
CREATE TABLE [dbo].[nav_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(50) NOT NULL ,
[link] varchar(255) NOT NULL ,
[type] varchar(50) NOT NULL ,
[sort] int NOT NULL ,
[is_index] int NOT NULL ,
[is_use] int NOT NULL ,
[channel_id] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[nav_info]', RESEED, 7)
GO

-- ----------------------------
-- Records of nav_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[nav_info] ON
GO
INSERT INTO [dbo].[nav_info] ([id], [name], [link], [type], [sort], [is_index], [is_use], [channel_id]) VALUES (N'1', N'首页', N'portal/index.action', N'system', N'0', N'1', N'1', null)
GO
GO
INSERT INTO [dbo].[nav_info] ([id], [name], [link], [type], [sort], [is_index], [is_use], [channel_id]) VALUES (N'6', N'直播', N'http://www.baidu.com', N'user', N'1', N'0', N'0', null)
GO
GO
INSERT INTO [dbo].[nav_info] ([id], [name], [link], [type], [sort], [is_index], [is_use], [channel_id]) VALUES (N'7', N'资源中心', N'http://www.baidu.com', N'user', N'2', N'0', N'0', null)
GO
GO
SET IDENTITY_INSERT [dbo].[nav_info] OFF
GO

-- ----------------------------
-- Table structure for player_info
-- ----------------------------
DROP TABLE [dbo].[player_info]
GO
CREATE TABLE [dbo].[player_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(50) NOT NULL ,
[content] varchar(1000) NULL ,
[sort] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[player_info]', RESEED, 14)
GO

-- ----------------------------
-- Records of player_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[player_info] ON
GO
INSERT INTO [dbo].[player_info] ([id], [name], [content], [sort]) VALUES (N'14', N'视频服务', N'{url}', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[player_info] OFF
GO

-- ----------------------------
-- Table structure for qiniu_info
-- ----------------------------
DROP TABLE [dbo].[qiniu_info]
GO
CREATE TABLE [dbo].[qiniu_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[type] varchar(50) NOT NULL ,
[ak] varchar(100) NULL ,
[sk] varchar(100) NULL ,
[bucket] varchar(50) NULL ,
[width] int NULL ,
[height] int NULL ,
[compress] int NULL ,
[name] varchar(50) NULL ,
[domain] varchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[qiniu_info]', RESEED, 12)
GO

-- ----------------------------
-- Records of qiniu_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[qiniu_info] ON
GO
INSERT INTO [dbo].[qiniu_info] ([id], [type], [ak], [sk], [bucket], [width], [height], [compress], [name], [domain]) VALUES (N'1', N'haibao', N'', N'', N'', N'400', N'600', N'0', N'海报', N'')
GO
GO
INSERT INTO [dbo].[qiniu_info] ([id], [type], [ak], [sk], [bucket], [width], [height], [compress], [name], [domain]) VALUES (N'2', N'fengmian', N'', N'', N'', N'320', N'180', N'0', N'小封面', N'')
GO
GO
INSERT INTO [dbo].[qiniu_info] ([id], [type], [ak], [sk], [bucket], [width], [height], [compress], [name], [domain]) VALUES (N'7', N'content', N'', N'', N'', N'0', N'0', N'0', N'照片', N'')
GO
GO
INSERT INTO [dbo].[qiniu_info] ([id], [type], [ak], [sk], [bucket], [width], [height], [compress], [name], [domain]) VALUES (N'10', N'touxiang', N'', N'', N'', N'200', N'200', N'0', N'头像', N'')
GO
GO
INSERT INTO [dbo].[qiniu_info] ([id], [type], [ak], [sk], [bucket], [width], [height], [compress], [name], [domain]) VALUES (N'11', N'dafengmian', N'', N'', N'', N'492', N'319', N'0', N'大封面', N'')
GO
GO
SET IDENTITY_INSERT [dbo].[qiniu_info] OFF
GO

-- ----------------------------
-- Table structure for reply_info
-- ----------------------------
DROP TABLE [dbo].[reply_info]
GO
CREATE TABLE [dbo].[reply_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[comment_id] int NOT NULL ,
[user_id] int NOT NULL ,
[login_name] varchar(50) NOT NULL ,
[to_user_id] int NOT NULL ,
[to_login_name] varchar(50) NOT NULL ,
[update_time] datetime NOT NULL ,
[content] varchar(500) NOT NULL ,
[video_id] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[reply_info]', RESEED, 23)
GO

-- ----------------------------
-- Records of reply_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[reply_info] ON
GO
SET IDENTITY_INSERT [dbo].[reply_info] OFF
GO

-- ----------------------------
-- Table structure for seo_info
-- ----------------------------
DROP TABLE [dbo].[seo_info]
GO
CREATE TABLE [dbo].[seo_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[title] varchar(200) NULL ,
[keywords] varchar(200) NULL ,
[description] varchar(500) NULL ,
[type] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[seo_info]', RESEED, 4)
GO

-- ----------------------------
-- Records of seo_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[seo_info] ON
GO
INSERT INTO [dbo].[seo_info] ([id], [title], [keywords], [description], [type]) VALUES (N'1', N'', N'', N'', N'index')
GO
GO
INSERT INTO [dbo].[seo_info] ([id], [title], [keywords], [description], [type]) VALUES (N'2', N'', N'', N'', N'list')
GO
GO
INSERT INTO [dbo].[seo_info] ([id], [title], [keywords], [description], [type]) VALUES (N'3', N'', N'', null, N'play')
GO
GO
INSERT INTO [dbo].[seo_info] ([id], [title], [keywords], [description], [type]) VALUES (N'4', N'', N'', null, N'profile')
GO
GO
SET IDENTITY_INSERT [dbo].[seo_info] OFF
GO

-- ----------------------------
-- Table structure for slide_info
-- ----------------------------
DROP TABLE [dbo].[slide_info]
GO
CREATE TABLE [dbo].[slide_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[api_id] int NOT NULL ,
[title] varchar(100) NULL ,
[summary] varchar(100) NULL ,
[image] varchar(200) NULL ,
[url] varchar(200) NULL ,
[sort] int NOT NULL ,
[thumbnail] varchar(200) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[slide_info]', RESEED, 11)
GO

-- ----------------------------
-- Records of slide_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[slide_info] ON
GO
SET IDENTITY_INSERT [dbo].[slide_info] OFF
GO

-- ----------------------------
-- Table structure for star_info
-- ----------------------------
DROP TABLE [dbo].[star_info]
GO
CREATE TABLE [dbo].[star_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(50) NOT NULL ,
[alias] varchar(50) NULL ,
[sex] varchar(50) NOT NULL ,
[region] varchar(50) NULL ,
[blood] varchar(50) NULL ,
[birthday] varchar(50) NULL ,
[constellation] varchar(50) NULL ,
[occupation] varchar(50) NULL ,
[image] varchar(100) NULL ,
[introduction] varchar(2000) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[star_info]', RESEED, 3)
GO

-- ----------------------------
-- Records of star_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[star_info] ON
GO
SET IDENTITY_INSERT [dbo].[star_info] OFF
GO

-- ----------------------------
-- Table structure for tag_info
-- ----------------------------
DROP TABLE [dbo].[tag_info]
GO
CREATE TABLE [dbo].[tag_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(50) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tag_info]', RESEED, 17)
GO

-- ----------------------------
-- Records of tag_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tag_info] ON
GO
SET IDENTITY_INSERT [dbo].[tag_info] OFF
GO

-- ----------------------------
-- Table structure for template_info
-- ----------------------------
DROP TABLE [dbo].[template_info]
GO
CREATE TABLE [dbo].[template_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[type] varchar(50) NOT NULL ,
[name] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[template_info]', RESEED, 2)
GO

-- ----------------------------
-- Records of template_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[template_info] ON
GO
INSERT INTO [dbo].[template_info] ([id], [type], [name]) VALUES (N'1', N'pc', N'default')
GO
GO
INSERT INTO [dbo].[template_info] ([id], [type], [name]) VALUES (N'2', N'm', N'default')
GO
GO
SET IDENTITY_INSERT [dbo].[template_info] OFF
GO

-- ----------------------------
-- Table structure for type_field
-- ----------------------------
DROP TABLE [dbo].[type_field]
GO
CREATE TABLE [dbo].[type_field] (
[id] int NOT NULL IDENTITY(1,1) ,
[type_id] int NOT NULL ,
[field_id] int NOT NULL ,
[is_screen] int NOT NULL ,
[sort] int NOT NULL ,
[is_required] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[type_field]', RESEED, 528)
GO

-- ----------------------------
-- Records of type_field
-- ----------------------------
SET IDENTITY_INSERT [dbo].[type_field] ON
GO
INSERT INTO [dbo].[type_field] ([id], [type_id], [field_id], [is_screen], [sort], [is_required]) VALUES (N'524', N'6', N'54', N'0', N'1', N'1')
GO
GO
INSERT INTO [dbo].[type_field] ([id], [type_id], [field_id], [is_screen], [sort], [is_required]) VALUES (N'527', N'7', N'55', N'0', N'1', N'1')
GO
GO
INSERT INTO [dbo].[type_field] ([id], [type_id], [field_id], [is_screen], [sort], [is_required]) VALUES (N'528', N'8', N'56', N'0', N'1', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[type_field] OFF
GO

-- ----------------------------
-- Table structure for type_info
-- ----------------------------
DROP TABLE [dbo].[type_info]
GO
CREATE TABLE [dbo].[type_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(50) NOT NULL ,
[sort] int NOT NULL ,
[profile_template] varchar(50) NULL ,
[play_template] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[type_info]', RESEED, 8)
GO

-- ----------------------------
-- Records of type_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[type_info] ON
GO
INSERT INTO [dbo].[type_info] ([id], [name], [sort], [profile_template], [play_template]) VALUES (N'6', N'开放手术', N'1', N'movie', N'movie')
GO
GO
INSERT INTO [dbo].[type_info] ([id], [name], [sort], [profile_template], [play_template]) VALUES (N'7', N'微创手术', N'2', N'movie', N'movie')
GO
GO
INSERT INTO [dbo].[type_info] ([id], [name], [sort], [profile_template], [play_template]) VALUES (N'8', N'全科医生培训', N'3', N'movie', N'movie')
GO
GO
SET IDENTITY_INSERT [dbo].[type_info] OFF
GO

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE [dbo].[user_info]
GO
CREATE TABLE [dbo].[user_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[login_name] varchar(50) NOT NULL ,
[pass_word] varchar(50) NOT NULL ,
[email] varchar(50) NOT NULL ,
[register_time] datetime NOT NULL ,
[register_ip] varchar(50) NULL ,
[last_login_time] datetime NOT NULL ,
[last_login_ip] varchar(50) NULL ,
[status] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[user_info]', RESEED, 96)
GO

-- ----------------------------
-- Records of user_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[user_info] ON
GO
INSERT INTO [dbo].[user_info] ([id], [login_name], [pass_word], [email], [register_time], [register_ip], [last_login_time], [last_login_ip], [status]) VALUES (N'1', N'admin', N'96e79218965eb72c92a549dd5a330112', N'123456@qq.com', N'2018-03-07 16:16:00.000', N'hidden', N'2018-03-07 16:16:00.000', N'hidden', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[user_info] OFF
GO

-- ----------------------------
-- Table structure for user_profile_info
-- ----------------------------
DROP TABLE [dbo].[user_profile_info]
GO
CREATE TABLE [dbo].[user_profile_info] (
[id] int NOT NULL IDENTITY(1,1) ,
[user_id] int NOT NULL ,
[group_id] int NOT NULL ,
[avatar] varchar(100) NULL ,
[sign_personal] varchar(255) NULL ,
[point] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[user_profile_info]', RESEED, 89)
GO

-- ----------------------------
-- Records of user_profile_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[user_profile_info] ON
GO
INSERT INTO [dbo].[user_profile_info] ([id], [user_id], [group_id], [avatar], [sign_personal], [point]) VALUES (N'1', N'1', N'1', N'', N'', N'0')
GO
GO
SET IDENTITY_INSERT [dbo].[user_profile_info] OFF
GO

-- ----------------------------
-- Table structure for video_info
-- ----------------------------
DROP TABLE [dbo].[video_info]
GO
CREATE TABLE [dbo].[video_info] (
[video_id] int NOT NULL IDENTITY(1,1) ,
[media_id] int NOT NULL ,
[num] varchar(50) NULL ,
[title] varchar(200) NULL ,
[image] varchar(100) NULL ,
[url] varchar(200) NULL ,
[view_count] int NOT NULL ,
[player_id] int NULL ,
[sort] int NULL ,
[status] int NOT NULL ,
[remark] varchar(1000) NULL ,
[power] int NULL ,
[point] int NULL ,
[update_time] datetime NULL ,
[view_count_day] int NULL ,
[view_count_week] int NULL ,
[view_count_month] int NULL ,
[view_count_year] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[video_info]', RESEED, 3288)
GO

-- ----------------------------
-- Records of video_info
-- ----------------------------
SET IDENTITY_INSERT [dbo].[video_info] ON
GO
INSERT INTO [dbo].[video_info] ([video_id], [media_id], [num], [title], [image], [url], [view_count], [player_id], [sort], [status], [remark], [power], [point], [update_time], [view_count_day], [view_count_week], [view_count_month], [view_count_year]) VALUES (N'3288', N'191', null, null, null, N'http://192.168.120.66:8081/video/2019-10-102h0wjoh87s.psd', N'1', N'14', N'1', N'1', null, null, null, N'2019-10-10 17:27:20.000', N'0', N'0', N'0', N'0')
GO
GO
SET IDENTITY_INSERT [dbo].[video_info] OFF
GO

-- ----------------------------
-- Table structure for web_info
-- ----------------------------
DROP TABLE [dbo].[web_info]
GO
CREATE TABLE [dbo].[web_info] (
[name] varchar(255) NULL ,
[domain] varchar(50) NULL ,
[email] varchar(50) NULL ,
[record_number] varchar(50) NULL ,
[statistical_code] varchar(1000) NULL ,
[id] int NOT NULL 
)


GO

-- ----------------------------
-- Records of web_info
-- ----------------------------
INSERT INTO [dbo].[web_info] ([name], [domain], [email], [record_number], [statistical_code], [id]) VALUES (null, null, null, null, null, N'1')
GO
GO

-- ----------------------------
-- Indexes structure for table activate_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table activate_info
-- ----------------------------
ALTER TABLE [dbo].[activate_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table api_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table api_info
-- ----------------------------
ALTER TABLE [dbo].[api_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table channel_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table channel_info
-- ----------------------------
ALTER TABLE [dbo].[channel_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table collection_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table collection_info
-- ----------------------------
ALTER TABLE [dbo].[collection_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table comment_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table comment_info
-- ----------------------------
ALTER TABLE [dbo].[comment_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table email_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table email_info
-- ----------------------------
ALTER TABLE [dbo].[email_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table field_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table field_info
-- ----------------------------
ALTER TABLE [dbo].[field_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table field_profile_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table field_profile_info
-- ----------------------------
ALTER TABLE [dbo].[field_profile_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table group_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table group_info
-- ----------------------------
ALTER TABLE [dbo].[group_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table history_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table history_info
-- ----------------------------
ALTER TABLE [dbo].[history_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table media_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table media_info
-- ----------------------------
ALTER TABLE [dbo].[media_info] ADD PRIMARY KEY ([media_id])
GO

-- ----------------------------
-- Indexes structure for table nav_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table nav_info
-- ----------------------------
ALTER TABLE [dbo].[nav_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table player_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table player_info
-- ----------------------------
ALTER TABLE [dbo].[player_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table qiniu_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table qiniu_info
-- ----------------------------
ALTER TABLE [dbo].[qiniu_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table reply_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table reply_info
-- ----------------------------
ALTER TABLE [dbo].[reply_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table seo_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table seo_info
-- ----------------------------
ALTER TABLE [dbo].[seo_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table slide_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table slide_info
-- ----------------------------
ALTER TABLE [dbo].[slide_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table star_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table star_info
-- ----------------------------
ALTER TABLE [dbo].[star_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table tag_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tag_info
-- ----------------------------
ALTER TABLE [dbo].[tag_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table template_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table template_info
-- ----------------------------
ALTER TABLE [dbo].[template_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table type_field
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table type_field
-- ----------------------------
ALTER TABLE [dbo].[type_field] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table type_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table type_info
-- ----------------------------
ALTER TABLE [dbo].[type_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table user_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table user_info
-- ----------------------------
ALTER TABLE [dbo].[user_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table user_profile_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table user_profile_info
-- ----------------------------
ALTER TABLE [dbo].[user_profile_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table video_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table video_info
-- ----------------------------
ALTER TABLE [dbo].[video_info] ADD PRIMARY KEY ([video_id])
GO

-- ----------------------------
-- Indexes structure for table web_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table web_info
-- ----------------------------
ALTER TABLE [dbo].[web_info] ADD PRIMARY KEY ([id])
GO

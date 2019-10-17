package cn.shirdon.liao.dao.star_info;

import cn.shirdon.liao.view.StarInfo;

import java.util.List;

public interface IStarInfoDAO {

	/**
	 * 查询明星列表
	 */
	List<StarInfo> list();

	/**
	 * 查询单个明星的信息
	 * @param id
	 * @return
	 */
	StarInfo selectById(String id);

	/**
	 * 插入一条明星数据
	 * @param starInfo
	 */
	int insert(StarInfo starInfo);
	
	/**
	 * 更新一条明星数据
	 * @param starInfo
	 */
	int update(StarInfo starInfo);

}
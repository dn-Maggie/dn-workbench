package com.dongnao.workbench.student.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.student.model.KouBeiStudent;
import com.dongnao.workbench.student.model.MarketStudent;
import com.dongnao.workbench.student.model.Promotionalinfo;

/**
 * 描述：录入学员信息模块service接口，提供controller操作所需方法
 *
 * @author fan.yang
 * @version 1.0 2016-05-01
 */
public interface MarketStudentService  {

	/**
	 * 新增录入学员信息方法
	 * @param marketStudent MarketStudent:实体类
	 */
	public ResultMessage add(MarketStudent marketStudent);
	
	/**
	 * 删除录入学员信息方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找录入学员信息实体方法
	 * @param key String：实体主键
	 * @return marketStudent MarketStudent 实体对象
	 */
	public MarketStudent getByPrimaryKey(String key);
	
	public Promotionalinfo getPIByPrimaryKey(String key);
	
	public KouBeiStudent getKBByPrimaryKey(String key);
	
	/**
	 * 根据条件查找录入学员信息列表方法
	 * @param marketStudent MarketStudent 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<MarketStudent> listByCondition(MarketStudent marketStudent);
	
	public List<Promotionalinfo> listPromotionalInfo(Promotionalinfo promotionalinfo);
	
	public List<KouBeiStudent> listKouBeiStudent(KouBeiStudent kouBeiStudent);
	
	/**
	 * 修改录入学员信息方法
	 * @param marketStudent MarketStudent 实体对象
	 */	
	public ResultMessage update(MarketStudent marketStudent);
	
	public ResultMessage updateProInfoIsBuy(Promotionalinfo promotionalinfo);
	
	public ResultMessage updatePromotionalInfo(Promotionalinfo promotionalinfo);
	
	public ResultMessage updateKouBeiStudent(KouBeiStudent kouBeiStudent);
	
	public MarketStudent getMarkStuCount(String month);
	
	public ResultMessage addPromotionalInfo(Promotionalinfo promotionalinfo);
	
	public ResultMessage addKouBeiStudent(KouBeiStudent kouBeiStudent);
	
	/**
	 * 获取录入信息统计
	 * @param marketStudent MarketStudent 实体对象
	 */	
	public List<MarketStudent> getMarketStatistic(MarketStudent ms);
}
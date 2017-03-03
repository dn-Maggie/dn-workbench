package com.dongnao.workbench.account.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.Utils;
import com.dongnao.workbench.school.model.Employee;
import com.dongnao.workbench.school.service.EmployeeService;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.account.model.AccountSubject;
import com.dongnao.workbench.account.model.Accounting;
import com.dongnao.workbench.account.model.FixedAsset;
import com.dongnao.workbench.account.service.AccountSubjectService;
import com.dongnao.workbench.account.service.FixedAssetService;
import com.dongnao.workbench.basic.model.Org;
import com.dongnao.workbench.basic.service.OrgService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：固定资产信息模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2016-08-12
 */
 
@Controller
@RequestMapping("fixedAsset")
public class FixedAssetController{
         @Resource
         private FixedAssetService fixedAssetService;
         @Resource
     	 private OrgService orgService;
         @Resource
      	 private EmployeeService employeeService;	
         @Resource
      	 private AccountSubjectService accountSubjectService;
    /**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddFixedAsset")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView(
				"WEB-INF/jsp/account/fixedAsset/addFixedAsset");
		
		Org orgEntity = new Org();
		orgEntity.setOrgClass(3);
 		List<Org> org= orgService.listByCondition(orgEntity);
 		mv.addObject("org", org);
 		
 		AccountSubject entity = new AccountSubject();
 		entity.setParentId(6);
 		List<AccountSubject> zjSubjectList = accountSubjectService.listByCondition(entity);
 		mv.addObject("zjSubjectList", zjSubjectList);
 		mv.addObject("emp", employeeService.listByCondition(null));
 		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowFixedAsset")
	public ModelAndView toShow(String key){
		FixedAsset entity = fixedAssetService.getByPrimaryKey(key);
		Map<String,String> fixedAsset = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/account/fixedAsset/showFixedAsset","fixedAsset",fixedAsset );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param fixedAsset FixedAsset:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addFixedAsset")
	public void add(FixedAsset fixedAsset,HttpServletRequest request,HttpServletResponse response){
	fixedAsset.setId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,fixedAssetService.add(fixedAsset));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteFixedAsset")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			fixedAssetService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListFixedAsset")
	public ModelAndView toList(){
		return new ModelAndView("WEB-INF/jsp/account/fixedAsset/listFixedAsset");
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param fixedAsset FixedAsset：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listFixedAsset")
	public void listByCondition(FixedAsset fixedAsset,HttpServletRequest request,
			HttpServletResponse response, Page page){
		fixedAsset.setPage(page);	
		List<FixedAsset> list = fixedAssetService.listByCondition(fixedAsset);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditFixedAsset")
	public ModelAndView toEdit(String key){
		ModelAndView mv = new ModelAndView(
				"WEB-INF/jsp/account/fixedAsset/editFixedAsset");
		FixedAsset entity = fixedAssetService.getByPrimaryKey(key);
		Map<String,String> fixedAsset = FormatEntity.getObjectValue(entity);
		
		Org orgEntity = new Org();
		orgEntity.setOrgClass(3);
 		mv.addObject("org", orgService.listByCondition(orgEntity));
 		
 		AccountSubject entitysub = new AccountSubject();
 		entitysub.setParentId(6);
 		mv.addObject("zjSubjectList", accountSubjectService.listByCondition(entitysub));
		mv.addObject("fixedAsset",fixedAsset);
		mv.addObject("emp", employeeService.listByCondition(null));
		return mv;
	}
	
	/**
	 * 修改方法
	 * @param fixedAsset FixedAsset：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateFixedAsset")
	public void update(FixedAsset fixedAsset,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,fixedAssetService.update(fixedAsset));	
	}
	
}
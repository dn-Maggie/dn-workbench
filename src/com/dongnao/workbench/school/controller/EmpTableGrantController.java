package com.dongnao.workbench.school.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongnao.workbench.basic.model.UserInfo;
import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.Utils;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.school.model.EmpAbsence;
import com.dongnao.workbench.school.model.EmpTableGrant;
import com.dongnao.workbench.school.model.Employee;
import com.dongnao.workbench.school.service.EmpTableGrantService;
import com.dongnao.workbench.school.service.EmployeeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：员工晚餐补助申请表模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-01-08
 */
 
@Controller
@RequestMapping("empTableGrant")
public class EmpTableGrantController{
         @Resource
	private EmpTableGrantService empTableGrantService;
     	@Resource
      	private EmployeeService employeeService;	
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddEmpTableGrant")
	public ModelAndView toAdd(HttpServletRequest request){
 		ModelAndView mv = new ModelAndView("WEB-INF/jsp/school/empTableGrant/addEmpTableGrant");
		mv.addObject("user", employeeService.getByPrimaryKey(Utils.getLoginUserInfoId(request)));
		mv.addObject("emp", employeeService.listByCondition(new Employee()));
		return mv;
 	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowEmpTableGrant")
	public ModelAndView toShow(String key){
		EmpTableGrant entity = empTableGrantService.getByPrimaryKey(key);
		Map<String,String> empTableGrant = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/school/empTableGrant/showEmpTableGrant","empTableGrant",empTableGrant );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param empTableGrant EmpTableGrant:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addEmpTableGrant")
	public void add(EmpTableGrant empTableGrant,HttpServletRequest request,HttpServletResponse response){
	empTableGrant.setId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,empTableGrantService.add(empTableGrant));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteEmpTableGrant")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			empTableGrantService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListEmpTableGrant")
	public ModelAndView toList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/school/empTableGrant/listEmpTableGrant");
		String userRole = Utils.getLoginUserInfo(request).getRoleId();
		Pattern deptLeaderRole = Pattern.compile("fcbb3b89-6aa8-428e-86e4-05f2ff8631da");
		Pattern headLeaderRole = Pattern.compile("cce57309-c36a-4b2b-8596-4bc3ea008e88");
		Pattern commonRole = Pattern.compile("3bf41c9b-5af1-46fd-9142-7d075c79e17a");
		Matcher deptLeader = deptLeaderRole.matcher(userRole);
		Matcher headLeader = headLeaderRole.matcher(userRole);
		Matcher common = commonRole.matcher(userRole);
		if(deptLeader.find()){
			mv.addObject("deptLeader",true);
		}else if(headLeader.find()){
			mv.addObject("headLeader",true);
		}else if(common.find()){
			mv.addObject("common",true);
		}
		mv.addObject("user",employeeService.getByPrimaryKey(Utils.getLoginUserInfoId(request)));
		if(!Utils.isSuperAdmin(request)){
			 mv.addObject("isNotAdmin", true);
		}
		return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param empTableGrant EmpTableGrant：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listEmpTableGrant")
	public void listByCondition(EmpTableGrant empTableGrant,HttpServletRequest request,
			HttpServletResponse response, Page page){
		empTableGrant.setPage(page);	
		List<EmpTableGrant> list = empTableGrantService.listByCondition(empTableGrant);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditEmpTableGrant")
	public ModelAndView toEdit(String key,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/school/empTableGrant/editEmpTableGrant");
		mv.addObject("empTableGrant", FormatEntity.getObjectValue(empTableGrantService.getByPrimaryKey(key)));
		mv.addObject("user", employeeService.getByPrimaryKey(Utils.getLoginUserInfoId(request)));
		mv.addObject("emp", employeeService.listByCondition(new Employee()));
		return mv ;
	}
	
	/**
	 * 修改方法
	 * @param empTableGrant EmpTableGrant：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateEmpTableGrant")
	public void update(EmpTableGrant empTableGrant,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,empTableGrantService.update(empTableGrant));	
	}
	/**
	 * 审核方法
	 */
	@RequestMapping("/auditEmpTableGrant")
	public void auditEmpTableGrant(String key,HttpServletRequest request,HttpServletResponse response){
		UserInfo user=Utils.getLoginUserInfo(request);
		String checkId = user.getId();
		Map<String, String> map = new HashMap<String, String>();
		Calendar calendar = Calendar.getInstance();
		
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			EmpTableGrant entity = empTableGrantService.getByPrimaryKey(str[i]);
			String flag = entity.getCheckId();
			if(flag==null){
				entity.setCheckId(checkId);
				entity.setCheckDate(calendar.getTime());
				empTableGrantService.update(entity);
			}else{
				continue;
			}
		}
		map.put("msg", "审核成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
}
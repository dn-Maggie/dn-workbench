package com.dongnao.workbench.school.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongnao.workbench.basic.model.Org;
import com.dongnao.workbench.basic.service.OrgService;
import com.dongnao.workbench.common.excel.ExcelExpUtils;
import com.dongnao.workbench.common.excel.ExpParamBean;
import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.Utils;
import com.dongnao.workbench.course.model.Course;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.school.model.EmpPerformance;
import com.dongnao.workbench.school.model.Employee;
import com.dongnao.workbench.school.model.Standard;
import com.dongnao.workbench.school.service.EmpPerformanceService;
import com.dongnao.workbench.school.service.EmployeeService;
import com.dongnao.workbench.school.service.StandardService;
import com.dongnao.workbench.vipStudent.model.VipStudent;
import com.dongnao.workbench.vipStudent.service.VipStudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：员工绩效信息表模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2016-07-24
 */
 
@Controller
@RequestMapping("empPerformance")
public class EmpPerformanceController{
         @Resource
         private EmpPerformanceService empPerformanceService;
         @Resource
     	 private StandardService standardService;
         @Resource
     	 private EmployeeService employeeService;
         @Resource
         private OrgService orgService;
         @Resource
     	 private VipStudentService vipStudentService;
 	/**
 	* 进入新增退款、补款业绩页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddEmpPerformance")
	public ModelAndView toAdd(){
 		ModelAndView mv = new ModelAndView(
 				"WEB-INF/jsp/school/empPerformance/addEmpPerformance");
 		
 		List<Standard> standard= standardService.getAllResourceId();
 		mv.addObject("standard", standard);
 		
 		List<Standard> followers= standardService.getAllFollowerId();
 		mv.addObject("followers", followers);

 		List<Employee> tutor= employeeService.listByCondition(null);
 		mv.addObject("tutor", tutor);
		return mv;
	}
	
 	/**
 	* 进入补录页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddEmp")
	public ModelAndView toAddEmp(){
 		ModelAndView mv = new ModelAndView(
 				"WEB-INF/jsp/school/empPerformance/addNewEmp");
 		
 		List<Standard> standard= standardService.getAllResourceId();
 		mv.addObject("standard", standard);
 		
 		List<Standard> followers= standardService.getAllFollowerId();
 		mv.addObject("followers", followers);

 		List<Employee> tutor= employeeService.listByCondition(null);
 		mv.addObject("tutor", tutor);
		return mv;
	}
 	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowEmpPerformance")
	public ModelAndView toShow(String key){
		Map<String,Object> model = new HashMap<String,Object>();
		
		EmpPerformance entity = empPerformanceService.getByPrimaryKey(key);
		Map<String,String> empPerformance = FormatEntity.getObjectValue(entity);
		
		String stuid = entity.getStuId();
		VipStudent vipStudent = vipStudentService.getByPrimaryKey(stuid);
		
		model.put("empPerformance", empPerformance);
		model.put("vipStudent", vipStudent);
		return new ModelAndView("WEB-INF/jsp/school/empPerformance/showEmpPerformance",model);
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param empPerformance EmpPerformance:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addEmpPerformance")
	public void add(EmpPerformance empPerformance,HttpServletRequest request,HttpServletResponse response){
	empPerformance.setId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,empPerformanceService.add(empPerformance));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteEmpPerformance")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			empPerformanceService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 根据学生Id删除
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteEmpPerformanceByStuId")
	public void deleteByStuId(EmpPerformance empPerformance,HttpServletResponse response){
		empPerformanceService.deleteByStuId(empPerformance);
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListEmpPerformance")
	public ModelAndView toList(){
		Map<String,Object> model = new HashMap<String,Object>();
		
		Org org = new Org();
		org.setParentOrgId("1");
		model.put("org",orgService.listByCondition(org));
		model.put("followers", standardService.getAllFollowerId());
		
		return new ModelAndView("WEB-INF/jsp/school/empPerformance/listEmpPerformance",model);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toSelectStudent")
	public ModelAndView toSelect(String type){
		Map<String,Object> model = new HashMap<String,Object>();
		if(("addNewEmp").equals(type)){
			return new ModelAndView("WEB-INF/jsp/school/empPerformance/selectOldVipinfo",model);
		}else{
			return new ModelAndView("WEB-INF/jsp/school/empPerformance/selectStudent",model);
		}
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param empPerformance EmpPerformance：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listEmpPerformance")
	public void listByCondition(EmpPerformance empPerformance,HttpServletRequest request,
			HttpServletResponse response, Page page){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		empPerformance.setPage(page);	
		List<EmpPerformance> list = empPerformanceService.listByCondition(empPerformance);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 根据员工统计方法
	 * @param empPerformance EmpPerformance：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listByEmployee")
	public void listByEmployee(EmpPerformance empPerformance,HttpServletRequest request,
			HttpServletResponse response, Page page){
		empPerformance.setPage(page);	
		List<EmpPerformance> list = empPerformanceService.listByEmployee(empPerformance);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditEmpPerformance")
	public ModelAndView toEdit(String key){
		ModelAndView mv = new ModelAndView(
				"WEB-INF/jsp/school/empPerformance/editEmpPerformance");
		
		EmpPerformance empPerformance = empPerformanceService.getByPrimaryKey(key);
		
		mv.addObject("empPerformance", empPerformance);
		
		List<Employee> tutor= employeeService.listByCondition(null);
 		mv.addObject("tutor", tutor);
		
 		List<Standard> followers= standardService.getAllFollowerId();
 		mv.addObject("followers", followers);
 		
 		List<Standard> standard= standardService.getAllResourceId();
 		mv.addObject("standard", standard);
 		
 		String stuid = empPerformance.getStuId();
		VipStudent vipStudent = vipStudentService.getByPrimaryKey(stuid);
		mv.addObject("vipStudent", vipStudent);
 		
		return mv;
		
		
	}
	
	/**
	 * 修改方法
	 * @param empPerformance EmpPerformance：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateEmpPerformance")
	public void update(EmpPerformance empPerformance,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,empPerformanceService.update(empPerformance));	
	}
	
 	/**
	 * 根据学生来源改变参与岗位选项
	 */
	@RequestMapping("/getPositionList")
	public void getPositionList(String parentId, String subId ,HttpServletResponse response){
		Standard s=new Standard();
 		s.setParentId(parentId);
 		s.setSubId(subId);
 		List<Standard>  list= standardService.listByCondition(s);
		Map<String, List> map = new HashMap<String, List>();
		map.put("followers", list);
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入财务清算页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toSettleEmpPerformance")
	public ModelAndView toSettle(String key){
		ModelAndView mv = new ModelAndView(
				"WEB-INF/jsp/school/empPerformance/assetSettlement");
		
		EmpPerformance entity = empPerformanceService.getByPrimaryKey(key);
		Map<String,String> empPerformance = FormatEntity.getObjectValue(entity);
		mv.addObject("empPerformance", empPerformance);
		
		List<Employee> tutor= employeeService.listByCondition(null);
 		mv.addObject("tutor", tutor);
		
 		List<Standard> followers= standardService.getAllFollowerId();
 		mv.addObject("followers", followers);
 		
		return mv;
	}
	
	/**
	 * 批量清算方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/settleAllEmpPerformance")
	public void settleAllEmpPerformance(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			empPerformanceService.settleByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	
	@RequestMapping("/exportExcel")
	public void exportExcel(EmpPerformance empPerformance, ExpParamBean epb,
			HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {		
		int expType = Integer.parseInt(request.getParameter("expType"));
		if (expType == 1) {
			empPerformance.setPage(page);
		}
		List<EmpPerformance> list = empPerformanceService.listByCondition(empPerformance);
		ExcelExpUtils.exportListToExcel(list, response, epb.getFieldlist(),"业绩分配信息列表", "业绩分配信息列表");
	}
	
}
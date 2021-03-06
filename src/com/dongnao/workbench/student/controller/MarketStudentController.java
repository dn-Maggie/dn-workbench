package com.dongnao.workbench.student.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dongnao.workbench.account.model.AccountFinance;
import com.dongnao.workbench.account.service.AccountFinanceService;
import com.dongnao.workbench.basic.model.Course;
import com.dongnao.workbench.basic.model.Subject;
import com.dongnao.workbench.basic.model.UserInfo;
import com.dongnao.workbench.basic.service.CourseService;
import com.dongnao.workbench.basic.service.SubjectService;
import com.dongnao.workbench.basic.service.UserInfoService;
import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.common.util.Utils;
import com.dongnao.workbench.school.model.Employee;
import com.dongnao.workbench.school.model.Standard;
import com.dongnao.workbench.school.service.EmployeeService;
import com.dongnao.workbench.school.service.StandardService;
import com.dongnao.workbench.student.model.KouBeiStudent;
import com.dongnao.workbench.student.model.MarketStudent;
import com.dongnao.workbench.student.model.Promotionalinfo;
import com.dongnao.workbench.student.model.VipStudent;
import com.dongnao.workbench.student.service.MarketStudentService;
import com.dongnao.workbench.student.service.VipStudentService;


/**
 * 描述：录入学员信息模块controller类，负责页面分发与跳转
 * 
 * @author fan.yang
 * @version 1.0 2016-05-01
 */
 
@Controller
@RequestMapping("marketStudent")
public class MarketStudentController{
         @Resource
         private MarketStudentService marketStudentService;
         @Resource
     	private CourseService courseService;
         @Resource
      	private SubjectService subjectService;
         @Resource
        private VipStudentService vipStudentService;
         @Resource
     	private UserInfoService userInfoService;
     	@Resource
    	private StandardService standardService;
     	@Resource
    	private EmployeeService employeeService;
     	@Resource
    	private AccountFinanceService accountFinanceService;
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddMarketStudent")
	public ModelAndView toAdd(){
 		ModelAndView mv = new ModelAndView(
 				"WEB-INF/jsp/student/marketStudent/addMarketStudent");
 		
 		Map<String,List> er = new HashMap<String, List>();
 		List<Subject> list = subjectService.listByCondition(new Subject());
 		List<Course> list2 =new ArrayList<Course>();
 		if(list!=null && list.size()>0){
 			Course c=new Course();
 	 		c.setSubjectId(list.get(0).getId());
 	 		list2=courseService.listByCondition(c);
 		}
 		er.put("subject", list);
 		er.put("course", list2);
 		mv.addObject("er", er);
 		
 		List<Standard> standard= standardService.getAllResourceId();
 		mv.addObject("standard", standard);
		return mv;
	}
 	/*添加推广信息*/
 	@RequestMapping("/toAddPromotionalInfo")
	public ModelAndView toAddPromotionalInfo(){
 		ModelAndView mv = new ModelAndView("WEB-INF/jsp/student/marketStudent/addPromotionalInfo");
 		Map<String,List> er = new HashMap<String, List>();
 		List<Subject> list = subjectService.listByCondition(new Subject());
 		List<Course> list2 =new ArrayList<Course>();
 		if(list!=null && list.size()>0){
 			Course c=new Course();
 	 		c.setSubjectId(list.get(0).getId());
 	 		list2=courseService.listByCondition(c);
 		}
 		er.put("subject", list);
 		er.put("course", list2);
 		mv.addObject("er", er);
 		
 		List<Standard> standard= standardService.getAllResourceId();
 		mv.addObject("standard", standard);
		return mv;
	}
 	/**
 	 * 添加口碑学员信息
 	 * */
 	@RequestMapping("/toAddKouBeiStudent")
	public ModelAndView toAddKouBeiStudent(){
 		ModelAndView mv = new ModelAndView("WEB-INF/jsp/student/marketStudent/addKouBeiStudent");
 		Map<String,List> er = new HashMap<String, List>();
 		List<Subject> list = subjectService.listByCondition(new Subject());
 		List<Course> list2 =new ArrayList<Course>();
 		if(list!=null && list.size()>0){
 			Course c=new Course();
 	 		c.setSubjectId(list.get(0).getId());
 	 		list2=courseService.listByCondition(c);
 		}
 		er.put("subject", list);
 		er.put("course", list2);
 		mv.addObject("er", er);
 		
 		List<Standard> standard= standardService.getAllResourceId();
 		mv.addObject("standard", standard);
		return mv;
	}
 	
 	/**
	 * 获取录入信息
	 */
	@RequestMapping("/getMarketStatistic")
	public void getGetMarketStatistic(MarketStudent ms,HttpServletRequest request,HttpServletResponse response){
		Map<Object, Object> model = new HashMap<Object, Object>();
		model.put("curr", marketStudentService.getMarketStatistic(ms));
		AjaxUtils.sendAjaxForMap(response, model);
	}
	
 	/**
	 * 根据学科id改变课程列表
	 */
	@RequestMapping("/getCourseList")
	public void getCourseList(String key,HttpServletResponse response){
		Course c=new Course();
 		c.setSubjectId(key);
 		List<Course>  list=courseService.listByCondition(c);
		Map<String, List> map = new HashMap<String, List>();
		map.put("course", list);
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 根据录入管理员改变录入人列表
	 */
	@RequestMapping("/getEnterUser")
	public void getEnterUser(String createdby,HttpServletResponse response){
		UserInfo user = new UserInfo();
 		user.setCreatedby(createdby);
 		List<UserInfo> userlist = userInfoService.listByCondition(user);
		Map<String, List> map = new HashMap<String, List>();
		map.put("userlist", userlist);
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowMarketStudent")
	public ModelAndView toShow(String key){
		MarketStudent entity = marketStudentService.getByPrimaryKey(key);
		Map<String,String> marketStudent = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/student/marketStudent/showMarketStudent","marketStudent",marketStudent);
	}
	
	@RequestMapping("/toShowPromotionalInfo")
	public ModelAndView toShowPromotionalInfo(String key){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/student/marketStudent/showPromotionalinfo");
		mv.addObject("subjectList", subjectService.listByCondition(new Subject()));
		Promotionalinfo promotionalInfo = marketStudentService.getPIByPrimaryKey(key);
		Map<String,String> proinfo = FormatEntity.getObjectValue(promotionalInfo);
		mv.addObject("pi", proinfo);
		UserInfo user = new UserInfo();
 		user.setId(promotionalInfo.getEntry_emp());
 		mv.addObject("user", userInfoService.listByCondition(user).get(0).getFullName());
		return mv; 
	}
	/**
	 * 进入跟踪页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toGenZongMarketStudent")
	public ModelAndView toGenZong(String key){
		
		return new ModelAndView("WEB-INF/jsp/student/marketStudent/genZongMarketStudent","stuid",key );
	}
	/**
	 * 进入报名页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toBaoMinMarketStudent")
	public ModelAndView toBaoMin(String key){
		MarketStudent entity = marketStudentService.getByPrimaryKey(key);
		Map<String,List> er = new HashMap<String, List>();
 		List<Subject> list = subjectService.listByCondition(new Subject());
 		List<Course> list2 =new ArrayList<Course>();
 		Course c=new Course();
		c.setSubjectId(entity.getSubjectId());
		list2=courseService.listByCondition(c);
 		er.put("xueke", list);
 		er.put("kechen", list2);
		
		Map<String,String> marketStudent = FormatEntity.getObjectValue(entity);
		Map<String,Object>  map=new HashMap<String, Object>();
		map.put("marketStudent", marketStudent);
		map.put("er", er);
		List<UserInfo> userlist=userInfoService.listByCondition(new UserInfo());
		map.put("userlist", userlist);
		
		Employee emp = new Employee();
		emp.setPosition("讲师");
		List<Employee> teacher= employeeService.listByCondition(emp);
		map.put("teacher", teacher);
		
		List<Standard> standard= standardService.getAllResourceId();
		map.put("standard", standard);
		
		List<Employee> tutor= employeeService.listByCondition(new Employee());
		map.put("tutor", tutor);
 		
		AccountFinance accountFlow = accountFinanceService.getByPrimaryKey("67250e52-e356-44a7-bb0e-f073360fb732");
		map.put("accountFlow", accountFlow);
		
 		return new ModelAndView("WEB-INF/jsp/student/marketStudent/BaoMinMarketStudent",map );
	}
	
	@RequestMapping("/proinfoPagtoBM")
	public ModelAndView proinfoPagtoBM(String key){
		Promotionalinfo entity = marketStudentService.getPIByPrimaryKey(key);
		Map<String,List> er = new HashMap<String, List>();
 		List<Subject> list = subjectService.listByCondition(new Subject());
 		List<Course> list2 =new ArrayList<Course>();
 		Course c=new Course();
		c.setSubjectId(entity.getSubjectid());
		list2=courseService.listByCondition(c);
 		er.put("xueke", list);
 		er.put("kechen", list2);
		
		Map<String,String> marketStudent = FormatEntity.getObjectValue(entity);
		Map<String,Object>  map=new HashMap<String, Object>();
		map.put("marketStudent", marketStudent);
		map.put("er", er);
		List<UserInfo> userlist=userInfoService.listByCondition(new UserInfo());
		map.put("userlist", userlist);
		
		Employee emp = new Employee();
		emp.setPosition("讲师");
		List<Employee> teacher= employeeService.listByCondition(emp);
		map.put("teacher", teacher);
		
		List<Standard> standard= standardService.getAllResourceId();
		map.put("standard", standard);
		
		List<Employee> tutor= employeeService.listByCondition(new Employee());
		map.put("tutor", tutor);
		AccountFinance accountFlow = accountFinanceService.getByPrimaryKey("67250e52-e356-44a7-bb0e-f073360fb732");
		map.put("accountFlow", accountFlow);
 		return new ModelAndView("WEB-INF/jsp/student/marketStudent/BaoMinProInfo",map );
	}
	
	@RequestMapping("/kouBeiPagtoBM")
	public ModelAndView kouBeiPagtoBM(String key){
		KouBeiStudent entity = marketStudentService.getKBByPrimaryKey(key);
		Map<String,List> er = new HashMap<String, List>();
 		List<Subject> list = subjectService.listByCondition(new Subject());
 		List<Course> list2 =new ArrayList<Course>();
 		Course c=new Course();
		c.setSubjectId(entity.getSubjectid());
		list2=courseService.listByCondition(c);
 		er.put("xueke", list);
 		er.put("kechen", list2);
		
		Map<String,String> marketStudent = FormatEntity.getObjectValue(entity);
		Map<String,Object>  map=new HashMap<String, Object>();
		map.put("marketStudent", marketStudent);
		map.put("er", er);
		List<UserInfo> userlist=userInfoService.listByCondition(new UserInfo());
		map.put("userlist", userlist);
		
		Employee emp = new Employee();
		emp.setPosition("讲师");
		List<Employee> teacher= employeeService.listByCondition(emp);
		map.put("teacher", teacher);
		
		List<Standard> standard= standardService.getAllResourceId();
		map.put("standard", standard);
		
		List<Employee> tutor= employeeService.listByCondition(new Employee());
		map.put("tutor", tutor);
		AccountFinance accountFlow = accountFinanceService.getByPrimaryKey("67250e52-e356-44a7-bb0e-f073360fb732");
		map.put("accountFlow", accountFlow);
 		return new ModelAndView("WEB-INF/jsp/student/marketStudent/BaoMinProInfo",map );
	}
	/**
	 * 报名
	 * @param response HttpServletResponse
	 * @param marketStudent MarketStudent:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/baomin")
	public void baomin(VipStudent vipstudent,HttpServletRequest request,HttpServletResponse response){
		vipstudent.setEnterEmp(Utils.getLoginUserInfoId(request));
		vipstudent.setId(Utils.generateUniqueID());
		marketStudentService.deleteByKey(request.getParameter("stuid"));
		AjaxUtils.sendAjaxForObjectStr(
				response,vipStudentService.add(vipstudent));	
	}
	
	@RequestMapping("/proInfobaomin")
	public void proInfobaomin(VipStudent vipstudent,HttpServletRequest request,HttpServletResponse response){
		vipstudent.setEnterEmp(Utils.getLoginUserInfoId(request));
		vipstudent.setId(Utils.generateUniqueID());
		Promotionalinfo promotionalinfo = new Promotionalinfo();
		promotionalinfo.setId(request.getParameter("piid"));
		promotionalinfo.setIs_buy("是");
		marketStudentService.updateProInfoIsBuy(promotionalinfo);//更改学员状态为已报名
		AjaxUtils.sendAjaxForObjectStr(response,vipStudentService.add(vipstudent));	
	}
	

	@RequestMapping("/AddPromotionalInfo")
	public void AddPromotionalInfo(Promotionalinfo promotionalinfo,HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserInfo user=Utils.getLoginUserInfo(request);
		Promotionalinfo pi = new Promotionalinfo();
		pi.setQq(promotionalinfo.getQq());
		pi.setCourse(promotionalinfo.getCourse());
		if(marketStudentService.listPromotionalInfo(pi).size()>0){
			AjaxUtils.sendAjaxForObjectStr(response,"{}");
		}else{
			promotionalinfo.setId(Utils.generateUniqueID());
			promotionalinfo.setEntry_emp(user.getFullName());		
			promotionalinfo.setEntry_time(new Date());
			AjaxUtils.sendAjaxForObjectStr(response,marketStudentService.addPromotionalInfo(promotionalinfo));
		}
	}
	
	@RequestMapping("/AddKouBeiStudent")
	public void AddKouBeiStudent(KouBeiStudent kouBeiStudent,HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserInfo user=Utils.getLoginUserInfo(request);
		KouBeiStudent ko = new KouBeiStudent();
		ko.setQq(kouBeiStudent.getQq());
		ko.setCourseid(kouBeiStudent.getCourseid());
		if(marketStudentService.listKouBeiStudent(ko).size()>0){
			AjaxUtils.sendAjaxForObjectStr(response,"{}");
		}else{
			kouBeiStudent.setId(Utils.generateUniqueID());
			kouBeiStudent.setEntry_emp(user.getFullName());		
			kouBeiStudent.setTime(new Date());
			AjaxUtils.sendAjaxForObjectStr(response,marketStudentService.addKouBeiStudent(kouBeiStudent));
		}
	}
	
	@RequestMapping("/addMarketStudent")
	public void add(MarketStudent marketStudent,HttpServletRequest request,HttpServletResponse response) throws IOException{
		UserInfo user=Utils.getLoginUserInfo(request);
		MarketStudent mark = new MarketStudent();
		mark.setQq(marketStudent.getQq());
		mark.setSubjectId(marketStudent.getSubjectId());
		if(marketStudentService.listByCondition(mark).size()>0){
			AjaxUtils.sendAjaxForObjectStr(response,"{}");
		}else{
			marketStudent.setUserId(user.getId());		
			marketStudent.setId(Utils.generateUniqueID());
			AjaxUtils.sendAjaxForObjectStr(response,marketStudentService.add(marketStudent));
		}
	}
	
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteMarketStudent")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			marketStudentService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/*进入推广信息录入页面*/
	@RequestMapping("/toPromotionalInfo")
	public ModelAndView toPromotionalInfo(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/student/marketStudent/promotionalInfo");
		Course c=new Course();
		List<Course> couList=courseService.listByCondition(c);
 		mv.addObject("couList",couList);
 		/*Employee emp = new Employee();
 		List<Employee> emplist = employeeService.listByCondition(emp);
 		for(int i=0;i<emplist.size();i++){
 			Employee ep = emplist.get(i);
 			if(ep.getCurrState().equals('3'))
 			emplist.remove(i);
 		}
		mv.addObject("emplist", emplist);*/
 		List<Employee> tutor= employeeService.listByCondition(new Employee());
 		for(int i =0;i<tutor.size();i++){
 			if(tutor.get(i).getCurrState().equals("3"))
 				tutor.remove(i);
 		}
 		mv.addObject("tutor", tutor);
		return mv;
	}
	
	/*进入口碑学员信息页面*/
	@RequestMapping("/toKouBeiStudent")
	public ModelAndView toKouBeiStudent(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/student/marketStudent/kouBeiStudent");
		Course c=new Course();
		List<Course> couList=courseService.listByCondition(c);
 		mv.addObject("couList",couList);
 		List<Employee> tutor= employeeService.listByCondition(new Employee());
 		for(int i =0;i<tutor.size();i++){
 			if(tutor.get(i).getCurrState().equals("3"))
 				tutor.remove(i);
 		}
 		mv.addObject("tutor", tutor);
		return mv;
	}
	
	/*查询推广信息列表数据*/
	@RequestMapping("/listKouBeiStudent")
	public void listKouBeiStudent(KouBeiStudent kouBeiStudent,HttpServletRequest request,HttpServletResponse response, Page page){
		kouBeiStudent.setPage(page);	
		List<KouBeiStudent> list = marketStudentService.listKouBeiStudent(kouBeiStudent);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/*查询推广信息列表数据*/
	@RequestMapping("/listPromotionalInfo")
	public void listPromotionalInfo(Promotionalinfo promotionalinfo,HttpServletRequest request,
			HttpServletResponse response, Page page){
		promotionalinfo.setPage(page);	
		List<Promotionalinfo> list = marketStudentService.listPromotionalInfo(promotionalinfo);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListMarketStudent")
	public ModelAndView toList(String term){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/student/marketStudent/listMarketStudent");
		Calendar calendar = Calendar.getInstance();
		
		Map<String,List> er = new HashMap<String, List>();
 		List<Subject> list = subjectService.listByCondition(new Subject());
 		er.put("subject", list);
 		
 		mv.addObject("er", er);

		//所有兼职管理员
 		UserInfo useradmin = new UserInfo();
 		useradmin.setRoleId("dc3dfb2e-5e70-4525-9739-beef0856f15c");
 		List<UserInfo> useradminlist = userInfoService.listByCondition(useradmin);
 		mv.addObject("useradmin", useradminlist);
 		
		//所有兼职班主任
 		UserInfo user = new UserInfo();
 		user.setOrgId("4");
 		List<UserInfo> userlist = userInfoService.listByCondition(user);
 		mv.addObject("user", userlist);
		
 		if(term!=null){
 			switch (term) {
			case "month":
				mv.addObject("condition", term);
				mv.addObject("currDate", calendar.get(Calendar.YEAR)+"-"+(calendar.get(Calendar.MONTH)+1)+"-01");
				break;
			case "year":
				mv.addObject("condition", term);
				mv.addObject("currDate", calendar.get(Calendar.YEAR)+"-01-01");
				break;
			default:
				break;
			}
		}
		return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param marketStudent MarketStudent：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listMarketStudent")
	public void listByCondition(MarketStudent marketStudent,HttpServletRequest request,
			HttpServletResponse response, Page page){
		marketStudent.setPage(page);	
		List<MarketStudent> list = marketStudentService.listByCondition(marketStudent);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
		
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditMarketStudent")
	public ModelAndView toEdit(String key){
		MarketStudent entity = marketStudentService.getByPrimaryKey(key);
		
		Map<String,List> er = new HashMap<String, List>();
 		List<Subject> list = subjectService.listByCondition(new Subject());
 		List<Course> list2 =new ArrayList<Course>();
 		
 		Course c=new Course();
		c.setSubjectId(entity.getSubjectId());
		
		list2=courseService.listByCondition(c);
 		er.put("xueke", list);
 		er.put("kechen", list2);
		
		Map<String,String> marketStudent = FormatEntity.getObjectValue(entity);
		
		Map<String,Object>  map=new HashMap<String, Object>();
		
		map.put("marketStudent", marketStudent);
		map.put("er", er);
		
		return new ModelAndView("WEB-INF/jsp/student/marketStudent/editMarketStudent",map );
	}
	
	@RequestMapping("/toEditPromotionalInfo")
	public ModelAndView toEditPromotionalInfo(String key){
		Promotionalinfo entity = marketStudentService.getPIByPrimaryKey(key);
		Map<String,List> er = new HashMap<String, List>();
 		List<Subject> list = subjectService.listByCondition(new Subject());
 		List<Course> list2 =new ArrayList<Course>();
 		Course c=new Course();
		c.setSubjectId(entity.getSubjectid());
		list2=courseService.listByCondition(c);
 		er.put("xueke", list);
 		er.put("kechen", list2);
		Map<String,String> Promotionalinfo = FormatEntity.getObjectValue(entity);
		Map<String,Object>  map=new HashMap<String, Object>();
		map.put("promotionalinfo", Promotionalinfo);
		map.put("er", er);
		return new ModelAndView("WEB-INF/jsp/student/marketStudent/editPromotionalInfo",map );
	}
	
	@RequestMapping("/toEditKouBeiStudent")
	public ModelAndView toEditKouBeiStudent(String key){
		KouBeiStudent entity = marketStudentService.getKBByPrimaryKey(key);
		Map<String,List> er = new HashMap<String, List>();
 		List<Subject> list = subjectService.listByCondition(new Subject());
 		Course c=new Course();
		c.setSubjectId(entity.getSubjectid());
		List<Course> list2=courseService.listByCondition(c);
 		er.put("xueke", list);
 		er.put("kechen", list2);
		Map<String,String> kouBeiStudent = FormatEntity.getObjectValue(entity);
		Map<String,Object>  map=new HashMap<String, Object>();
		map.put("kouBeiStudent", kouBeiStudent);
		map.put("er", er);
		return new ModelAndView("WEB-INF/jsp/student/marketStudent/editKouBeiStudent",map);
	}
	
	
	/**
	 * 修改方法
	 * @param marketStudent MarketStudent：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updatePromotionalInfo")
	public void updatePromotionalInfo(Promotionalinfo promotionalinfo,HttpServletRequest request,HttpServletResponse response)throws IOException{
		UserInfo user=Utils.getLoginUserInfo(request);
		Promotionalinfo pi = marketStudentService.getPIByPrimaryKey(promotionalinfo.getId());
		if(!pi.getEntry_emp().equals(user.getFullName())){
			AjaxUtils.sendAjaxForObjectStr(response,AjaxUtils.getFailureMessage("只能修改自己录入的意向信息！"));
		}else{
			AjaxUtils.sendAjaxForObjectStr(response,marketStudentService.updatePromotionalInfo(promotionalinfo));	
		}	
	}	
	
	@RequestMapping("/updateKouBeiStudent")
	public void updateKouBeiStudent(KouBeiStudent kouBeiStudent,HttpServletRequest request,HttpServletResponse response)throws IOException{
		UserInfo user=Utils.getLoginUserInfo(request);
		KouBeiStudent pi = marketStudentService.getKBByPrimaryKey(kouBeiStudent.getId());
		if(!pi.getEntry_emp().equals(user.getFullName())){
			AjaxUtils.sendAjaxForObjectStr(response,AjaxUtils.getFailureMessage("只能修改自己录入的口碑学员信息！"));
		}else{
			AjaxUtils.sendAjaxForObjectStr(response,marketStudentService.updateKouBeiStudent(kouBeiStudent));	
		}	
	}
	
	@RequestMapping("/updateMarketStudent")
	public void update(MarketStudent marketStudent,HttpServletRequest request,HttpServletResponse response)throws IOException{
		UserInfo user=Utils.getLoginUserInfo(request);
		marketStudent.setUserId(user.getId());		
		AjaxUtils.sendAjaxForObjectStr(response,marketStudentService.update(marketStudent));	
	}
	
	/**
	 * 进入兼职班主任可查看列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListAMarketStudent")
	public ModelAndView toListA(HttpServletRequest request){
		ModelAndView mv = new ModelAndView(
				"WEB-INF/jsp/student/marketStudent/listAMarketStudent");
		UserInfo userInfo=Utils.getLoginUserInfo(request);
		if(userInfo.getRoleId().equals("dc3dfb2e-5e70-4525-9739-beef0856f15c")){
			mv.addObject("isAdmin", true);
			//发展的兼职班主任
	 		UserInfo user = new UserInfo();
	 		user.setCreatedby(userInfo.getId());
	 		List<UserInfo> userlist = userInfoService.listByCondition(user);
	 		mv.addObject("user", userlist);
	 		mv.addObject("createdby", Utils.getLoginUserInfo(request).getCreatedby());
		}
 		mv.addObject("userInfo", userInfo);
		return mv;
	}
	
	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddAMarketStudent")
	public ModelAndView toAddA(){
 		ModelAndView mv = new ModelAndView(
 				"WEB-INF/jsp/student/marketStudent/addAMarketStudent");
 		Map<String,List> er = new HashMap<String, List>();
 		List<Subject> list = subjectService.listByCondition(new Subject());
 		List<Course> list2 =new ArrayList<Course>();
 		if(list!=null && list.size()>0){
 			Course c=new Course();
 	 		c.setSubjectId(list.get(0).getId());
 	 		list2=courseService.listByCondition(c);
 		}
 		er.put("subject", list);
 		er.put("course", list2);
 		mv.addObject("er", er); 		
		return mv;
	}
}
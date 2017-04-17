package com.dongnao.workbench.school.controller;


import org.springframework.beans.factory.annotation.Autowired;

import com.dongnao.workbench.accountflow.dao.AccountFlowMapper;
import com.dongnao.workbench.accountflow.service.AccountFlowService;
import com.dongnao.workbench.common.bean.ReportQuerycondition;
import com.dongnao.workbench.subject.model.Subject;
import com.dongnao.workbench.subject.service.SubjectService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SpringQtz {

	@Autowired
	SubjectService subjectService;
	@Autowired
	AccountFlowService accountFlowService;
	@Autowired
	AccountFlowMapper accountFlowMapper;

	/**
	 * 定时更新成本业绩临时表
	 */	
	protected void execute() {
		//System.out.println(accountFlowMapper);
		ReportQuerycondition rqc = new ReportQuerycondition();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Date date = new Date();
		String nowyear = sdf.format(date);
		rqc.setYear(nowyear);
		int a =accountFlowMapper.timedupdatecostprofitdelete(rqc);
		//System.out.println("已删除数据行数："+a);
		List<ReportQuerycondition> rqclistr = new ArrayList<ReportQuerycondition>();
		List<ReportQuerycondition> rqclistc = new ArrayList<ReportQuerycondition>();
		List<Subject> Deptlist = subjectService.listByCondition(new Subject());
		for (int i = 0; i < Deptlist.size(); i++) {
			ReportQuerycondition rqcr = new ReportQuerycondition();
			ReportQuerycondition rqcc = new ReportQuerycondition();
			rqcr.setYear(nowyear);
			rqcc.setYear(nowyear);
			rqcr.setDeptname(Deptlist.get(i).getName());
			rqcc.setDeptname(Deptlist.get(i).getName());
			rqcr.setClasstype("achieve");
			rqcc.setClasstype("cost");
			rqclistr.add(rqcr);
			rqclistc.add(rqcc);
		}
		System.out.println("--------------1-------------");
		accountFlowMapper.timedupdatecostprofitr(rqclistr);
		accountFlowMapper.timedupdatecostprofitc(rqclistc);
		System.out.println("--------------2-------------");
		System.out.println("");
	}
}
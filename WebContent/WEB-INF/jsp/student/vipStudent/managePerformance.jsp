<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
</head>
<body>
	<form id="vipStudentFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_id" name="id" type="text" value="${vipStudent.id}"/>
		<table class="table">
			<tr style="text-indent: 4em"><td colspan="4"><i class="icon_bg icon_plan"></i> 学生基本信息</td></tr>
			<tr>
				<td class="inputLabelTd">学员姓名：</td>
				<td class="inputTd">
					<input id="edit_name" name="name" type="text" class="text" value="${vipStudent.name}" readonly/>
				</td>
				<td class="inputLabelTd">年龄：</td>
				<td class="inputTd">
					<input id="edit_age" name="age" type="text" class="text" value="${vipStudent.age}" readonly/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">手机号码：</td>
				<td class="inputTd">
					<input id="edit_phone" name="phone" type="text" class="text" value="${vipStudent.phone}"readonly/>
				</td>
				<td class="inputLabelTd">QQ：</td>
				<td class="inputTd">
					<input id="edit_qq" name="qq" type="text" class="text" value="${vipStudent.qq}" readonly/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">QQ昵称：</td>
				<td class="inputTd">
					<input id="edit_qqNick" name="qqNick" type="text" class="text" value="${vipStudent.qqNick}" readonly/>
				</td>
				<td class="inputLabelTd">能否上课：</td>
				<td class="inputTd">
					<label class="radio"><input type="radio" name="isGoclass" id="optionsRadios1" value="1" <c:if test='${vipStudent.isGoclass==1}'>checked</c:if>>是</label>
					<label class="radio"><input type="radio" name="isGoclass" id="optionsRadios2" value="0" <c:if test='${vipStudent.isGoclass==0}'>checked</c:if>>否</label>				
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">报名学科：</td>
				<td class="inputTd">
					<select onchange="courseChange(this.value);"  style="float:left" class="input_select" name="subjectId" id="edit_subjectId" disabled="disabled">
						<c:forEach var="mr" items="${er.subject}">
							<option value="${mr.id}" <c:if test="${vipStudent.subjectId==mr.id}">selected</c:if> > <c:out value="${mr.name}"></c:out> </option>
			             </c:forEach>
			       	</select>
				</td>
				<td class="inputLabelTd">报名课程：</td>
				<td class="inputTd">
					<input type="hidden" name="courseId" id="edit_courseId" value="${vipStudent.courseId}" />	
					<input class="text" name="courseName" id="edit_courseName" value="${vipStudent.courseName}" readonly/>	
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">听课讲师：</td>
				<td class="inputTd">
					<input id="edit_teacherId" name="teacherId" type="text" class="text" value="${vipStudent.teacherId}" readonly/>	
				</td>
				<td class="inputLabelTd">班主任：</td>
				<td class="inputTd">
					<input id="edit_tutorId" name="tutorId" type="text" class="text" value="${vipStudent.tutorId}" readonly/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">备注：</td>
				<td class="inputTd">
					<input id="edit_notes" name="notes" type="text" class="text" value="${vipStudent.notes}"/>
				</td>
				<td class="inputLabelTd">报名时间：</td>
				<td class="inputTd">
					<div class="time_bg">
						<input type="text" class="search_time150 valid" name="joinTime" id="edit_joinTime" value="${vipStudent.joinTime}" disabled="disabled"><!-- 时间选择控件-->
						<i class="search_time_ico2"></i>
					</div>
				</td>
			</tr>
			<tr style="text-indent: 4em"><td colspan="4"><i class="icon_bg icon_plan"></i> 学生付款信息</td></tr>
			<tr>
				<td class="inputLabelTd">应缴学费：</td>
				<td class="inputTd">
					<input id="edit_oldshouldPay" type="hidden" value="${vipStudent.shouldPay}"/>
					<input id="edit_shouldPay" name="shouldPay" type="number" class="text" value="${vipStudent.shouldPay}" readonly/>
				</td>
				<td class="inputLabelTd">实缴学费：</td>
				<td class="inputTd">
					<input id="edit_actualPay" name="actualPay" type="number" class="text" value="${vipStudent.actualPay}" readonly/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">欠缴学费：</td>
				<td class="inputTd">
					<input id="edit_owePay" name="owePay" type="text" class="text" value="${vipStudent.owePay}" readonly />
				</td>
				<td class="inputLabelTd">付款方姓名：</td>
				<td class="inputTd">
					<input id="edit_payerName" name="payerName" type="text" class="text" value="${vipStudent.payerName}" readonly/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">付款账号：</td>
				<td class="inputTd">
					<input id="edit_payAccount" name="payAccount" type="text" class="text" value="${vipStudent.payAccount}" readonly/>
				</td>
				<td class="inputLabelTd">付款方式：</td>
				<td class="inputTd">
					<select class="input_select" name="payType" id="edit_payType" disabled="disabled">
						<option value="支付宝" <c:if test="${vipStudent.payType=='支付宝'}">selected</c:if>>支付宝</option>
						<option value="网银支付" <c:if test="${vipStudent.payType=='网银支付'}">selected</c:if>>网银支付</option>
						<option value="微信支付" <c:if test="${vipStudent.payType=='微信支付'}">selected</c:if>>微信支付</option>
						<option value="银行卡支付" <c:if test="${vipStudent.payType=='银行卡支付'}">selected</c:if>>银行卡支付</option>
						<option value="财付通" <c:if test="${vipStudent.payType=='财付通'}">selected</c:if>>财付通</option>
						<option value="腾讯课堂" <c:if test="${vipStudent.payType=='腾讯课堂'}">selected</c:if>>腾讯课堂</option>
						<option value="分期付款" <c:if test="${vipStudent.payType=='分期付款'}">selected</c:if>>分期付款</option>
					</select>				
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">到款账号：</td>
				<td class="inputTd">
					<input id="edit_receiveAccount" name="receiveAccount" type="text" class="text" value="${vipStudent.receiveAccount}" readonly/>
				</td>
				<td class="inputLabelTd">交易号或流水号：</td>
				<td class="inputTd">
					<input id="edit_serialNo" name="serialNo" type="text" class="text" value="${vipStudent.serialNo}" readonly/>
				</td>
			</tr>
			<tr style="text-indent: 4em">
				<td colspan="4">
					<i class="icon_bg icon_plan"></i> 学生来源信息
					<input type="hidden" id="isCount" value="${vipStudent.isCount}"/>
					<input type="hidden" id="followerType" value="${vipStudent.followerType}"/>
					<input type="hidden" id="followerPosition" value="${vipStudent.followerPosition}"/>
					<input type="hidden" id="followerId" value="${vipStudent.followerId}"/>
					<input type="hidden" id="followerName" value="${vipStudent.followerName}"/>
					<input type="hidden" id="followerRate" value="${vipStudent.followerRate}"/>
				</td>
			</tr>
			<tr>
			 	<td class="inputLabelTd"><span class="required">*</span>分配金额：</td>
				<td class="inputTd" >
					<input id="edit_perMoney" name="perMoney" type="text" class="text" value="${vipStudent.actualPay}" onchange="maxMoney(this.value)"/>
				</td>
				<td class="inputLabelTd"><span class="required">*</span>分配时间：</td>
				<td class="inputTd" >
					<div class="time_bg">
						<input type="text" class="search_time150 valid" name="perDate" id="edit_perDate"><!-- 时间选择控件-->
						<i class="search_time_ico2"></i>
					</div>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd"><span class="required">*</span>流量来源：</td>
				<td class="inputTd">
					<select onchange="subChange(this.value);" class="input_select" name="comSource" id="edit_comSource" ><option value="">--请选择--</option>
						<c:forEach var="standard" items="${standard}">
							<option value="${standard.parentId}" <c:if test="${vipStudent.comSource==standard.parentId}">selected</c:if>> <c:out value="${standard.parentName}"></c:out> </option>
			             </c:forEach>
					</select>
				</td>
			 	<td class="inputLabelTd">来源分类：</td>
				<td class="inputTd">
					<select onchange="changeFollower()" class="input_select" name="sourceSubclass" id="edit_sourceSubclass" >
			     		 <c:forEach var="subResource" items="${subResource}">
							<option value="${subResource.subId}" <c:if test="${vipStudent.sourceSubclass==subResource.subId}">selected</c:if>> <c:out value="${subResource.subName}"></c:out> </option>
			             </c:forEach>
			        </select>
				</td>
			</tr>
			<tr name="addEnable" class="addEnable">
				<td class="inputLabelTd">转化人类型：</td>
				<td class="inputTd">
					<select class="input_select" name="followerType" id="edit_followerType" onchange="getRate(this)"><option value="">--请选择--</option>
						<option value="0">无</option>
						<c:forEach var="followers" items="${followers}">
							<option value="${followers.positionId}" <c:if test="${vipStudent.followerType==followers.positionId}">selected</c:if>> <c:out value="${followers.position}"></c:out> </option>
			             </c:forEach>
					</select>
				</td>
				<td class="inputLabelTd">转化人：</td>
				<td class="inputTd">
					<input id="edit_followerId" name="followerId" type="hidden" class="text"/>
					<input id="edit_followerName" name="followerName" type="text" class="text followerName" style="width:59px" list="employeeList"  onchange="getEmpIDByName(this,this.value);"/>
					<datalist id="employeeList">
						<c:forEach var="tutor" items="${tutor}">
							<option did="${tutor.id}" value="${tutor.nickName}" label="${tutor.name}"></option>
			             </c:forEach>
					</datalist>
					配比率：
					<input type="text" id="rate" class="text" name="rate" style="width:40px"/>
					<input type="hidden" id="newRate"  name="newRate"/>
					<i style="display: inline-block;cursor:pointer;position: relative;top:5px;" class="icon_bg icon_add" onclick="addFollowMess()"> </i>
					<i style="display: inline-block;cursor:pointer;position: relative;top:5px;" class="icon_bg icon_del" onclick="delFollowMess(this)"> </i>
				</td>
			</tr>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input id="submit" type="button" class="ti_bottom" value="确定分配"/>
					<input id="cancel" type="button" class="ti_bottom" value="取消" onclick="window.parent.closeManage();"/>
				</td>
			</tr>
		</table>
        </div>
	</form>
 <script type="text/javascript">
 /*定义全局变量，存储以下变量：
 *followerTypes：转化人类型ID 
 *followerPositions：转化人类型名
 *followerIds：转化人ID 
 *followerNames：转化人名称
 *followerRates：总业绩比例
 */
 var followerTypes = [];
 var followerIds = [];
 var followerNames = [];
 var followerPositions = [];
 var followerRates = [];
 var i = 0;
 var currStatus = "";
$(function() {
	//已经分好业绩的情况，分离多个转化对象
	if($("#isCount").val()=='已分配业绩'){
		var folPositions=$("#followerPosition").val().split(",");
		var folTypes=$("#followerType").val().split(",");
		var folIds =$("#followerId").val().split(",");
		var folNames =$("#followerName").val().split(",");	
		var folRates =$("#followerRate").val().split(",");	
			for(var i=0;i<folNames.length;i++){
				var $addEnable = $(".addEnable:last");
				var $clone = $addEnable.clone(true);
				$addEnable.after($clone); 
				$clone.find("select[name='followerType']").find("option[value='"+folTypes[i]+"']").attr("selected",true);
				$clone.find("select[name='followerType']").find("option:selected").text(folPositions[i]);
				$clone.find("#edit_followerId").val(folIds[i]);
				$clone.find(".followerName").val(folNames[i]);
				$clone.find("#rate").val(folRates[i]);
				$clone.find("#newRate").val(getNewRate(folTypes[i], $("#edit_comSource").find("option:selected").val(), $("#edit_sourceSubclass").find("option:selected").val()!=undefined?$("#edit_sourceSubclass").find("option:selected").val():0));
			}
			$(".addEnable:first").remove();
	}
 	//subChange($('#edit_comSource').val());
	$("#edit_perDate").val(new Date().format('yyyy-MM-dd'));
		
	//绑定提交按钮click事件
	$("#submit").click(function() {
		$("#submit").prop('disabled', true).css({'cursor':'not-allowed'});
		showMessage("正在处理，请稍后...");
		if(!biz.validate("valid",$('#vipStudentFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		
		//计算总业务比例
		var rates = 0;
		$("tr[name='addEnable']").each(function(i){
			var rate = $(this).find("#rate").val();
			rates =  Number(rates) + Number(rate);
		});
		$('#edit_owePay').val()>0?currStatus = "分期付款":currStatus = "已付全款";

		//总业务比例小于1，开始分配个人业绩
		if(rates>1){
			showMessage("业绩比例分配不可大于1！");
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
		}else{
			if($("#isCount").val()=='未分配业绩'){
				//计算分配业绩
				countPerformance();
				updateVipStudent();
			}else{
				var tempDatea = $("#edit_joinTime").val().split("-");
				var tempDateb = $("#edit_perDate").val().split("-");
				if(""+tempDatea[0]+tempDatea[1]==""+tempDateb[0]+tempDateb[1]){
					//如果是同一个月下的业绩，则删除旧业绩分配情况
					deletePerformance();
				}
				//重新计算分配业绩
				countPerformance();
				updateVipStudent();
			}
		}
	});
	
	new biz.datepicker({
		id : "#edit_joinTime",
		maxDate:'#F{$dp.$D(\'edit_joinTime\',{d:0});}',
		dateFmt:'yyyy-MM-dd HH:mm:ss'
	});
	
	new biz.datepicker({
		id : "#edit_perDate",
		maxDate:'#F{$dp.$D(\'edit_perDate\',{d:0});}',
		dateFmt:'yyyy-MM-dd'
	});
	
	
	/*编辑表单数据验证*/
	new biz.validate({
		id:"#vipStudentFormEdit",
		rules:{
			"subjectId" : {required : true},
			"comSource" :{required : true},
			"rate" : {required : true},
			"perMoney" : {required : true},
			"perDate" : {required : true},
		}
	}); 
});
//控制最大分配金额
function maxMoney(val){
	if(Number(val)>Number($("#edit_actualPay").val())){
		showWarn("分配金额不能大于实缴金额");
	}
}
//流量分类显示控制
function subChange(val){
	switch (val) {
	case "1":
	case "5":
		$('#edit_sourceSubclass option').remove();
		$('#edit_sourceSubclass').append('<option value="1">未体验公开课报名</option>'+
				
				'<option value="2">体验公开课后报名</option>');
		break;
	default:
		$('#edit_sourceSubclass option').remove();
		$('#edit_sourceSubclass').append('<option value="0">无</option>');
		break;
	}
}
//根据来源分类改变参与岗位
function changeFollower(){
	var par =$("#edit_comSource").find("option:selected").val();
	var sub =$("#edit_sourceSubclass").find("option:selected").val();
	$ .ajax({
		url: "<m:url value='/empPerformance/getPositionList.do'/>?parentId="+par+"&subId="+sub,
		cache:false,
		dataType:"json",
		success: function(data, textStatus, jqXHR){
			$('#edit_followerType option').remove();
			for(var i in data.followers){
				if(data.followers[i].id){
					$('#edit_followerType').append('<option value="'+data.followers[i].positionId+'">'+data.followers[i].position+' </option>');
					rate = data.followers[i].rate;
				}
			}
			if(!data.followers[0]){
				$('#edit_followerType').append('<option value="">--请选择--</option>');
			}
			getRate($('#edit_followerType'));
		}
	});
}


//深克隆(添加多个转化人事件)
function addFollowMess(){
	var $addEnable = $(".addEnable:last");
	var $clone = $addEnable.clone(true);
	$clone.find("input").val("");
	$addEnable.after($clone); 
	var index = $clone.index();
	$clone.find(".followerName").attr("id","followerName"+$clone.index());
};
//删除多个转化人事件
function delFollowMess(Object){
	if($(".addEnable").size()>1)
	{$(Object).parents('.addEnable').remove();}
	else return;
};
/*自动搜寻转化人 自动完成(Autocomplete) 根据用户输入值进行搜索和过滤,让用户快速找到并从预设值列表中选择*/
function getEmpIDByName(obj,value) {
	var did = $("#employeeList").find("option[value="+value+"]").attr('did');
	$(obj).parents('.addEnable').find("#edit_followerId").val(did);
}

//获取转化人所占业绩比例
function getRate(Object){
	var parentId =$("#edit_comSource").find("option:selected").val();
	var subId =$("#edit_sourceSubclass").val();
	var positionId = $(Object).parents('.addEnable').find("#edit_followerType").val();
	if (parentId && subId && positionId) {
		$.ajax({
					url : "<m:url value='/standard/getRate.do'/>?parentId="
							+ parentId+"&subId="+subId+"&positionId="+positionId,
					cache : false,
					async : false,
					success : function(data, textStatus, jqXHR) {
						if(data!=null){
							data = JSON.parse(data);
							$(Object).parents('.addEnable').find("#rate").val(data.rate);
							$(Object).parents('.addEnable').find("#newRate").val(data.newRate);
						}else{
							$(Object).parents('.addEnable').find("#rate").val(0);
							$(Object).parents('.addEnable').find("#newRate").val(0);
						}
					}
				});
	};
}

//修改学生数据(插入业绩)
function updateVipStudent(){
	$("tr[name='addEnable']").each(function(i){
		var rate = $(this).find("#rate").val();
		var followerType = $(this).find("select[name='followerType']").find("option:selected").val();
		var followerPosition = $(this).find("select[name='followerType']").find("option:selected").text();
		var employeeId = $(this).find("#edit_followerId").val();
		var employeeName = $(this).find(".followerName").val();
		//全局变量改变
		followerIds.push(employeeId);
		followerIds.join(",");
		followerPositions.push(followerPosition);
		followerPositions.join(",");
		followerTypes.push(followerType);
		followerTypes.join(",");
		followerNames.push(employeeName);
		followerNames.join(",");
		followerRates.push(rate);
		followerRates.join(",");
	});
	
	var isCount = "已分配业绩";
	var comSource = $("#edit_comSource").val();
	var sourceSubclass = $("#edit_sourceSubclass").val();
	var paramDatas = {
			id:$("#edit_id").val(),
			isCount:isCount,
			comSource:comSource,
			sourceSubclass:sourceSubclass,
			followerType:followerTypes.toString(),
			followerPosition:followerPositions.toString(),
			followerId:followerIds.toString(),
			followerName:followerNames.toString(),
			followerRate:followerRates.toString(),
				};
	$.ajax({
		   type: "post",
		   url: "<m:url value='/vipStudent/updateEmpPerform.do'/>",
		   data: paramDatas,
		   cache: false,
		   async : false,
		   dataType:"json",
		   success:function(d){
			 //返回结果提示
				$.ajax({
				   type: "get",
				   url: "<m:url value='/empPerformance/listEmpPerformance.do'/>",
				   data: {
					   stuId:$("#edit_id").val(),
					   createDate:$("#edit_perDate").val()
					   },
				   cache: false,
				   dataType:"json",
				   success:function(response){
					   var names = [];
					   names.push("<table border='1' cellspacing='50%' cellpadding='80' ><thead><tr><th>创建时间</th><th>昵称</th><th>转化类型</th><th>分配金额</th></tr>")
					   for(var i = 0;i<response.rows.length;i++){
						   names.push("<tr><td>"+response.rows[i].createDate+"</td><td>"+response.rows[i].nickName+"</td><td>"+response.rows[i].position+"</td><td>"+response.rows[i].performance+"</td></tr>");
					   }
					   names.push("</table>");
					   names.join("");
					   showMessage(
						 "已成功分配，该笔订单共有 <span style='color:red;font-weight:bold' >"+response.rows.length+"</span>条业绩记录：<br/>"+
						 names,
						 "","", 
					  	 function(){
						    window.parent.closeManage();
				     		window.parent.doSearch();
					   });
				   }
				});
		   }
		});
}
//计算分配业绩
function countPerformance(){
	var stuId = $("#edit_id").val();
	var shouldPay = $("#edit_shouldPay").val();
	var actualPay = $("#edit_perMoney").val();
	var isPass="未清算";
	$("tr[name='addEnable']").each(function(i){
			//var newRate = $(this).find("#newRate").val();
			var rate = $(this).find("#rate").val();
			var followerType = $(this).find("select[name='followerType']").find("option:selected").val();
			var followerPosition = $(this).find("select[name='followerType']").find("option:selected").text();
			var employeeId = $(this).find("#edit_followerId").val();
			var performance = parseFloat($("#edit_perMoney").val())*parseFloat(rate);
			var note = $("#edit_courseName").val()+"-"+$("#edit_perMoney").val()+"*"+rate;
			var comSource = $("#edit_comSource").val();
			var sourceSubclass = $("#edit_sourceSubclass").val();
			//改成获取隐藏的new rate,根据参与岗位人数进行比例分配
			var newRate = getNewRateByPosition($(this),followerType,comSource,sourceSubclass);
			
			
			var paramDatas = {
					employeeId:employeeId,
					shouldPay:shouldPay,
					actualPay:actualPay,
					performance:performance,
					createDate:$("#edit_perDate").val(),
					note:note,
					position:followerPosition,
					isPass:isPass,
					stuId:stuId,
					newRate:newRate
					};
			$.ajax({
				   type: "post",
				   async:false,
				   url: "<m:url value='/empPerformance/addEmpPerformance.do'/>",
				   data: paramDatas,
				   cache: false,
				   dataType:"json",
				   success:function(response){
				   }
				});
		});
}
function getNewRate(foltype,comSource,sub){
	var newRate = 0;
	 $.ajax({
		 url : "<m:url value='/standard/getRate.do'/>?parentId="
				+ comSource+"&subId="+sub+"&positionId="+foltype,
		cache : false,
		async : false,
		success:function(response){
			if(response!=null){
				newRate = JSON.parse(response).newRate;
			}else{
				newRate = 0;
			}
			 
		},
		error:function(){
			 showError("获取比例出错", 3000);
		}
	 });
	return newRate;
}
//多个相同角色
function getNewRateByPosition(obj,foltype,comSource,sub){
	var newRate = 0;
	var num = 0;
	var followerType = $(obj).find("select[name='followerType']").find("option:selected").val();
	$("select[name='followerType']").each(function(i){
		if(followerType == $(this).find("option:selected").val()){num++};
	})
	 $.ajax({
		 url : "<m:url value='/standard/getRate.do'/>?parentId="
				+ comSource+"&subId="+sub+"&positionId="+foltype,
		cache : false,
		async : false,
		success:function(response){
			if(response!=null){
				newRate = (JSON.parse(response).newRate)/num;
			}else{
				newRate = 0;
			}
		},
		error:function(){
			 showError("获取比例出错", 3000);
		}
	 });
	return newRate;
}


function deletePerformance(){
	var stuId = $("#edit_id").val();
	var perDate = $("#edit_perDate").val();
	var paramDatas = {stuId:stuId,createDate:perDate};
		$.ajax({
			   type: "post",
			   url: "<m:url value='/empPerformance/deleteEmpPerformanceByStuId.do'/>",
			   data: paramDatas,
			   cache: false,
			   async : false,
			   dataType:"json",
			   success:function(response){
			   }
			});	
}
</script>
</body>
</html>

<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html  >
<html>
<head>
<%@ include file="../../common/header.jsp"%>
</head>
  
<body>

<div id="editDialog">
	<form id="marketStudentFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_id" name="id" type="text" value="${marketStudent.id}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd"><span class="required">*</span>QQ号码：</td>
				<td class="inputTd">
					<input id="edit_qq" name="qq" type="text" class="text" value="${marketStudent.qq}"/>
				</td>
				<td class="inputLabelTd">意向学科：</td>
				<td class="inputTd">
					<select onchange="xuekeChange(this.value);" style="float:left" class="input_select" name="subjectId" id="edit_subjectId">
						<c:forEach var="mr" items="${er.subject}">
							<option value="${mr.id}"> <c:out value="${mr.name}"></c:out> </option>
			             </c:forEach>
			        </select>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">意向课程：</td>
				<td class="inputTd" >
					<select style="float:left" class="input_select" name="courseId" id="edit_courseId">
					<c:forEach var="mr" items="${er.course}">
							<option value="${mr.id}" > <c:out value="${mr.name}"></c:out> </option>
			             </c:forEach>
					</select>
				</td>
				<td class="inputLabelTd">意向级别：</td>
				<td class="inputTd">
					<select style="float:left" class="input_select" name="desire" id="edit_desire" mainid="actType">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</td>
			</tr>
			<tr>	
				<td class="inputLabelTd">备注：</td>
				<td class="inputTd">
					<input id="edit_notes" name="notes" type="text" class="text" value="${marketStudent.notes}"/>
					<input id="edit_time" name="time" type="hidden" value="${marketStudent.time}"/>
				</td>
				<td class="inputLabelTd">上传图片：</td>
				<td class="inputTd">
					<input id="fileData" name="fileUrl" type="hidden">
					<input id="file" type="file" class="text"/>
				</td>
			</tr>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input id="submit" type="button" class="ti_bottom" value="保存"/>
				</td>
			</tr>
		</table>
    </div>
	</form>
</div>
<script type="text/javascript">
var createDate = new Date().format('yyyy-MM-dd hh:mm:ss'); //获取今日时间
$(function() {
	
	subChange($("#edit_comSource").val());
	$("#edit_time").val(createDate);
	
	//绑定提交按钮click事件
	$("#submit").click(function() {
		$("#submit").prop('disabled', true).css({'cursor':'not-allowed'});
		showMessage("正在处理，请稍后...");
		if(!biz.validate("valid",$('#marketStudentFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		
		var options = {
				url : "<m:url value='/marketStudent/addMarketStudent.do'/>",
				type : "post",
					dataType:"json",
					success : function(d) {
						if(d.status){
							showMessage(d.message,"","",function(){
								window.parent.closeAdd();
					     		window.parent.doSearch();
							});
						}else{
							showMessage("插入数据失败，请检查该数据是否已存在");
						}
					}
			};
		
		//验证图片
		var fileName = $("#file").val();
		if(fileName.length>1){  
			var extname = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase();  
			var imgname = fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);  
			if(extname!= "jpeg"&&extname!= "jpg"&&extname!= "gif"&&extname!= "png"){  
				 showWarn("格式不正确,支持的图片格式为：JPEG、JPG、GIF、PNG！");  
		         return false;  
		        }  
			var file = $("#file").get(0).files; 
			var size = file[0].size;
			if(size>2097152){  
				  showWarn("所选择的图片太大，图片大小最多支持2M!"); 
		          return false;  
		     }  			
			// 创建一个FileReader对象
			var reader = new FileReader();
			// 绑定load事件
			reader.onload = function(e) {
				$("#fileData").val(e.target.result);
				$('#marketStudentFormEdit').ajaxSubmit(options);// 将options传给ajaxForm
			}
			// 读取File对象的数据
			reader.readAsDataURL($("#file").get(0).files[0]);
	      }
			else{
			// 将options传给ajaxForm
			$('#marketStudentFormEdit').ajaxSubmit(options);}
	});
	
	/*编辑表单数据验证*/
	new biz.validate({
		id:"#marketStudentFormEdit",
		rules:{
			"qq" : {required : true,number:true,rangelength:[5,11],digits:true },
		}
	}); 
 
});
function xuekeChange(val){
	$ .ajax({
		url: "<m:url value='/marketStudent/getCourseList.do'/>?key="+val,
		cache:false,
		dataType:"json",
		success: function(data, textStatus, jqXHR){
			$('#edit_courseId option').remove();
			for(var i in data.course){
				if(data.course[i].id){
					$('#edit_courseId').append('<option value="'+data.course[i].id+'">'+data.course[i].name+' </option>');
				}
			}
			if(!data.course[0]){
				$('#edit_courseId').append('<option value="">--请选择--</option>');
			}
		}
	});
}
//流量分类显示控制
function subChange(val){
	switch (val) {
	case "1":
		$('#edit_sourceSubclass option').remove();
		$('#edit_sourceSubclass').append('<option value="1">未体验公开课报名</option><option value="2">体验公开课后报名</option>');
		break;
	default:
		$('#edit_sourceSubclass option').remove();
		$('#edit_sourceSubclass').append('<option value="0">无</option>');
		break;
	}
}
</script>

</body>
</html>

﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dongnao.workbench.common.util.Utils"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
	<div class="navbar navbar-default" id="navbar">
	<script type="text/javascript">
		try{ace.settings.check('navbar','fixed')}catch(e){}
	</script>
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							&nbsp;&nbsp;&nbsp;<img alt="动脑学院办公协同管理系统" src="<%=request.getContextPath()%>/styles/images/header_logo.png">
							&nbsp;&nbsp;<img title="为天地立心、为生民立命、为往圣继绝学、为万世开太平"  src="<%=request.getContextPath()%>/styles/images/header_string.png">
						</small>
					</a><!-- /.brand -->
					<a href="#" style="float:right"></a>
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-search"></i>
								<input type="text" name="stu_qq" id="stu_qq" list="stuQQList"  oninput="searchStuByQQ()" placeholder="搜索学员QQ" />	
								<datalist id="stuQQList">
								</datalist>
							</a>
							<script type="text/javascript">
							 	baseUrl="<%=request.getContextPath() %>";
								function searchStuByQQ(){
									var paramDatas = {
										qq:$("#stu_qq").val(),
									};
									if($("#stu_qq").val().length>3){
										$.ajax({
											   type: "post",
											   url: baseUrl+"/vipStudent/listStuByCondition.do",
											   data: paramDatas,
											   cache: false,
											   dataType:"json",
											   success:function(response){
												   $('#stuQQList option').remove();
													for(var i in response){
														if(response[i].name){
															$('#stuQQList').append('<option value="'+response[i].name+'">'+response[i].qq+'</option>');
														}
													}
										   		}
										});
									}
								}
							</script>
						</li>
						
						<li class="purple">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-tasks"></i>
								<span class="badge badge-important">4</span>
							</a>

							<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-ok"></i>
									还有4个任务完成
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">软件更新</span>
											<span class="pull-right">65%</span>
										</div>

										<div class="progress progress-mini ">
											<div style="width:65%" class="progress-bar "></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">硬件更新</span>
											<span class="pull-right">35%</span>
										</div>

										<div class="progress progress-mini ">
											<div style="width:35%" class="progress-bar progress-bar-danger"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">单元测试</span>
											<span class="pull-right">15%</span>
										</div>

										<div class="progress progress-mini ">
											<div style="width:15%" class="progress-bar progress-bar-warning"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">错误修复</span>
											<span class="pull-right">90%</span>
										</div>

										<div class="progress progress-mini progress-striped active">
											<div style="width:90%" class="progress-bar progress-bar-success"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										查看任务详情
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="green">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-bell-alt icon-animated-bell"></i>
								<span class="badge badge-grey">8</span>
							</a>

							<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-warning-sign"></i>
									8条通知
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-pink icon-comment"></i>
												新闻评论
											</span>
											<span class="pull-right badge badge-info">+12</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<i class="btn btn-xs btn-primary icon-user"></i>
										切换为编辑登录..
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
												新订单
											</span>
											<span class="pull-right badge badge-success">+8</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-info icon-twitter"></i>
												粉丝
											</span>
											<span class="pull-right badge badge-info">+11</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										查看所有通知
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>
					
						<!-- 
							<li class="system-name" style="color:#fff;font-size:24px;margin-right:50px;">
								动脑学院办公协同管理系统
							</li> 
						-->
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="<%=request.getContextPath() %>/styles/images/logo_face.png"  />
								<span class="user-info">
									<small style="margin-bottom: 2px">欢迎登陆</small>
									<small><%=Utils.getLoginUserInfo(request).getFullName()%></small>
								</span>
								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="javascript:;" id="setPwdBtn"><i class="icon-cog"></i>修改密码</a>
								</li>

								<li>
									<span id="userid" style="display: none"><%=Utils.getLoginUserInfo(request).getFullName()%></span>
									<a href="javascript:;" id="userMessBtn" ><i class="icon-user"></i>个人资料</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="logout.do">
										<i class="icon-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>
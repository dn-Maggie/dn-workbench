<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns:w="urn:schemas-microsoft-com:office:word"
	xmlns="http://www.w3.org/TR/REC-html40">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="m" uri="/WEB-INF/tld/spring.tld"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/styles/skin/default/components/jqgrid/jquery.jqgrid.css"/>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/excelExport.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/styles/index.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/lib/biz.jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/lib/biz-html5.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/lib/biz-ie.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/lib/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/i18n/i18n_zh.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/lib/biz.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.nicescroll.js"></script>
<script title="js模板控件" type="text/javascript" src="<%=request.getContextPath() %>/js/doT.min.js"></script>
<!-- 自定义js -->
<script title="表格列耐热格式" type="text/javascript" src="<%=request.getContextPath() %>/js/GridColModelForMatter.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bizLib/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bizLib/jquery.form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bizLib/jquery.contextmenu.r2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/tiledCombobox.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bizLib/placeholder.js"></script>

<script src="<%=request.getContextPath() %>/js/gameco/jquery.collapse.js"></script>	
<script src="<%=request.getContextPath() %>/modulejs/common.js"></script>	

<!-- 新添加的js -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/statistic/helium.js"></script>
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 14">
<meta name=Originator content="Microsoft Word 14">
<title></title>
<style>
@font-face{
font-family:"Times New Roman";
}

@font-face{
font-family:"宋体";
}

@font-face{
font-family:"Calibri";
}

@font-face{
font-family:"Wingdings";
}

@font-face{
font-family:"微软雅黑";
}

@font-face{
font-family:"仿宋";
}

p.MsoNormal{
mso-style-name:正文;
mso-style-parent:"";
margin:0pt;
margin-bottom:.0001pt;
mso-pagination:none;
text-align:justify;
text-justify:inter-ideograph;
font-family:'Times New Roman';
font-size:10.5000pt;
mso-font-kerning:1.0000pt;
}

span.10{
font-family:Calibri;
}

span.15{
font-family:Calibri;
font-size:9.0000pt;
}

span.16{
font-family:Calibri;
font-size:9.0000pt;
}

p.MsoHeader{
mso-style-name:页眉;
mso-style-noshow:yes;
margin:0pt;
margin-bottom:.0001pt;
border-bottom:1.0000pt solid windowtext;
mso-border-bottom-alt:0.7500pt solid windowtext;
padding:0pt 0pt 1pt 0pt ;
layout-grid-mode:char;
mso-pagination:none;
text-align:center;
font-family:'Times New Roman';
font-size:9.0000pt;
mso-font-kerning:1.0000pt;
}

p.MsoFooter{
mso-style-name:页脚;
mso-style-noshow:yes;
margin:0pt;
margin-bottom:.0001pt;
layout-grid-mode:char;
mso-pagination:none;
text-align:left;
font-family:'Times New Roman';
font-size:9.0000pt;
mso-font-kerning:1.0000pt;
}

span.msoIns{
mso-style-type:export-only;
mso-style-name:"";
text-decoration:underline;
text-underline:single;
color:blue;
}

span.msoDel{
mso-style-type:export-only;
mso-style-name:"";
text-decoration:line-through;
color:red;
}

table.MsoNormalTable{
mso-style-name:普通表格;
mso-style-parent:"";
mso-style-noshow:yes;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt;
mso-para-margin:0pt;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-family:'Times New Roman';
font-size:10.0000pt;
mso-ansi-language:#0400;
mso-fareast-language:#0400;
mso-bidi-language:#0400;
}
@page{mso-page-border-surround-header:no;
	mso-page-border-surround-footer:no;}@page Section0{
margin-top:72.0000pt;
margin-bottom:72.0000pt;
margin-left:90.0000pt;
margin-right:90.0000pt;
size:595.3000pt 841.9000pt;
layout-grid:15.6000pt;
}
div.Section0{page:Section0;}
</style>
</head>
<body style="tab-interval:21pt;text-justify-trim:punctuation;" ><!--StartFragment-->
    <div class="Section0" style="layout-grid:15.6000pt;">
        <p class=MsoNormal align=center style="text-align:center;"><span
                style="mso-spacerun:'yes';font-family:微软雅黑;font-size:16.0000pt;mso-font-kerning:1.0000pt;"><font
                face="微软雅黑">动脑学院客服转化基本工资考核表</font></span><span
                style="mso-spacerun:'yes';font-family:微软雅黑;font-size:16.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
        </p>
        <form id="form" >
        <table class=MsoNormalTable align=center
               style="border-collapse:collapse;width:439.9000pt;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;">
            <tr style="height:22.8500pt;">
                <td width=92 valign=center
                    style="width:69.2500pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid windowtext;mso-border-left-alt:0.5000pt solid windowtext;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:1.0000pt solid windowtext;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><b><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;">员工姓名</span></b><b><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></b>
                    </p>
                </td>
                <td width=119 valign=center
                    style="width:89.7500pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:1.0000pt solid windowtext;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><b><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p></span></b>
                        <span style="color:red;">${empCheck.empName}</span>
							<input name="empName" type="hidden" value="${empCheck.empName}">
							<input name="checkStanderd" type="hidden" value="${empCheck.checkStanderd}">
							<input name="checkMonth" type="hidden" value="${empCheck.checkMonth}">
                    </p>
                </td>
                <td width=181 valign=top
                    style="width:135.7500pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:1.0000pt solid windowtext;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:200%;"><b><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;">考核月份</span></b><b><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></b>
                    </p>
                </td>
                <td width=181 valign=top colspan=2
                    style="width:135.7500pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:1.0000pt solid windowtext;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><b><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p></span></b>
                            <label style="color: orangered">${empCheck.checkMonth}</label>
                    </p>
                </td>
            </tr>
            <tr style="height:24.8000pt;">
                <td width=92 valign=center
                    style="width:69.0000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid windowtext;mso-border-left-alt:0.5000pt solid windowtext;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><b><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;">考核项</span></b><b><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></b>
                    </p>
                </td>
                <td width=170 valign=center
                    style="width:127.6000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><b><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;">基准标准</span></b><b><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></b>
                    </p>
                </td>
                <td width=236 valign=top colspan=2
                    style="width:177.2000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:200%;"><b><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;">加减分条件</span></b><b><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></b>
                    </p>
                </td>
                <td width=88 valign=top
                    style="width:66.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:200%;"><b><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;">得分</span></b><b><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:14.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></b>
                    </p>
                </td>
            </tr>
            <tr style="height:21.6000pt;">
                <td width=92 valign=center rowspan=2
                    style="width:69.0000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid windowtext;mso-border-left-alt:0.5000pt solid windowtext;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">工作纪律</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=170 valign=center rowspan=2
                    style="width:127.6000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">基准分15分。标准：遵守公司各项规章制度</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=236 valign=center colspan=2
                    style="width:177.2000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">加：全勤等</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=88 valign=center rowspan=2
                    style="width:66.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal style="text-align:left;"><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p></span>
                        						<select id="core1" name="core1" onchange="corechange()">
							<c:forEach var="intNum" items="${arr}">
								<option value="<c:out value="${intNum}"/>" 
								<c:if test="${intNum == '15' }">selected</c:if>>   <c:out value="${intNum}" /></option>
							</c:forEach>
						</select>
                    </p>
                </td>
            </tr>
            <tr style="height:49.0000pt;">
                <td width=236 valign=center colspan=2
                    style="width:177.2000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">减：工作时间玩手机、看视频等做与工作无关的事；迟到、早退、旷工等</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
            </tr>
            <tr style="height:39.7500pt;">
                <td width=92 valign=center rowspan=2
                    style="width:69.0000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid windowtext;mso-border-left-alt:0.5000pt solid windowtext;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">工作态度</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=170 valign=center rowspan=2
                    style="width:127.6000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">基准分15分。标准：工作态度良好</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=236 valign=center colspan=2
                    style="width:177.2000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">加：平时主动加班；节假日主动值班并未调休；帮助部门负责人积极处理部门工作</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=88 valign=center rowspan=2
                    style="width:66.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal style="text-align:left;"><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p></span>
					<select id="core2" name="core2" onchange="corechange()">
							<c:forEach var="intNum" items="${arr}">
								<option value="<c:out value="${intNum}"/>" <c:if test="${intNum == '15' }">selected</c:if>>   
								<c:out value="${intNum}" /></option>
							</c:forEach>
						</select>
                    </p>
                </td>
            </tr>
            <tr style="height:30.5500pt;">
                <td width=236 valign=center colspan=2
                    style="width:177.2000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">减：不服从管理、工作态度消极、主观原因不积极转化学生、态度恶劣等</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
            </tr>
            <tr style="height:22.8000pt;">
                <td width=92 valign=center rowspan=2
                    style="width:69.0000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid windowtext;mso-border-left-alt:0.5000pt solid windowtext;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">工作水平</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=170 valign=center rowspan=2
                    style="width:127.6000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">基准分20分。标准：符合客服岗位基本工作水平</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=236 valign=center colspan=2
                    style="width:177.2000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">加：积极分享岗位工作心得；帮助同事一起进步；积极在课堂配合；积极参与公司或部门推广活动策划；创新工作方法</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=88 valign=center rowspan=2
                    style="width:66.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal style="text-align:left;"><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p></span>
					<select id="core3" name="core3" onchange="corechange()">
							<c:forEach var="intNum" items="${arr}">
								<option value="<c:out value="${intNum}"/>" <c:if test="${intNum == '20' }">selected</c:if>>   
								<c:out value="${intNum}" /></option>
							</c:forEach>
						</select>
                    </p>
                </td>
            </tr>
            <tr style="height:23.2500pt;">
                <td width=236 valign=center colspan=2
                    style="width:177.2000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">减：不能自主解决工作中遇到的问题；与报名咨询学员沟通不当引起学生投诉；浪费资源</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
            </tr>
            <tr style="height:37.5000pt;">
                <td width=92 valign=center rowspan=2
                    style="width:69.0000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid windowtext;mso-border-left-alt:0.5000pt solid windowtext;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">业绩</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=170 valign=center rowspan=2
                    style="width:127.6000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">基准分15分。标准：新报名的业绩达到本部门新报名业绩的百分之50%</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=236 valign=center colspan=2
                    style="width:177.2000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal style="line-height:114%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">加：此项因有绩效提成作为计算标准，故此考核体系不做加分</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=88 valign=center rowspan=2
                    style="width:66.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal style="text-align:left;"><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p></span>
					<select id="core4" name="core4" onchange="corechange()">
							<c:forEach var="intNum" items="${arr}">
								<option value="<c:out value="${intNum}"/>" <c:if test="${intNum == '15' }">selected</c:if>>   
								<c:out value="${intNum}" /></option>
							</c:forEach>
						</select>
                    </p>
                </td>
            </tr>
            <tr style="height:24.5000pt;">
                <td width=236 valign=center colspan=2
                    style="width:177.2000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">减：低于本部门新报名业绩的百分之50%</span><b><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></b>
                    </p>
                </td>
            </tr>
            <tr style="height:36.7500pt;">
                <td width=92 valign=center rowspan=2
                    style="width:69.0000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid windowtext;mso-border-left-alt:0.5000pt solid windowtext;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">回访工作</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=170 valign=center rowspan=2
                    style="width:127.6000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal style="line-height:114%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">基准分15分。标准：按质按量完成每月回访任务</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=236 valign=center colspan=2
                    style="width:177.2000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal style="line-height:114%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">加：回访按质按量完成，并通过回访帮助学生解决了问题</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=88 valign=center rowspan=2
                    style="width:66.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:none;;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal style="text-align:left;line-height:114%;"><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p></span>
					<select id="core5" name="core5" onchange="corechange()">
							<c:forEach var="intNum" items="${arr}">
								<option value="<c:out value="${intNum}"/>" <c:if test="${intNum == '15' }">selected</c:if>>   
								<c:out value="${intNum}" /></option>
							</c:forEach>
						</select>
                    </p>
                </td>
            </tr>
            <tr style="height:18.3500pt;">
                <td width=236 valign=center colspan=2
                    style="width:177.2000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal style="line-height:114%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">减：未完成回访任务</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
            </tr>
            <tr style="height:42.2500pt;">
                <td width=92 valign=center
                    style="width:69.0000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid windowtext;mso-border-left-alt:0.5000pt solid windowtext;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">附加贡献</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=170 valign=center
                    style="width:127.6000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">加分项。参与助教外其他工作</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=236 valign=center colspan=2
                    style="width:177.2000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">主持；对公司有突出贡献；工作有突出成绩等</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=88 valign=center
                    style="width:66.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal style="text-align:left;"><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p></span>
					<select id="core6" name="core6" onchange="corechange()">
								<option value="0" >0</option>
								<option value="1" >1</option>
								<option value="2" >2</option>
								<option value="3" >3</option>
								<option value="4" >4</option>
								<option value="5" >5</option>
								<option value="6" >6</option>
								<option value="7" >7</option>
								<option value="8" >8</option>
								<option value="9" >9</option>
								<option value="10" >10</option>
						</select>
                    </p>
                </td>
            </tr>
            <tr style="height:37.1000pt;">
                <td width=92 valign=center
                    style="width:69.0000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid windowtext;mso-border-left-alt:0.5000pt solid windowtext;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:200%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">总分</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=494 valign=top colspan=4
                    style="width:370.9000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;"><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p></span>
					<input id="totalcore" name="totalcore" readonly="true" value="80" style="border:0px;"/>
                    </p>
                </td>
            </tr>
            <tr style="height:37.1000pt;">
                <td width=92 valign=center
                    style="width:69.0000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid windowtext;mso-border-left-alt:0.5000pt solid windowtext;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">签字确认</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=494 valign=top colspan=4
                    style="width:370.9000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal style="text-align:left;"><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p></span>
                    </p>
                </td>
            </tr>
            <tr style="height:18.8500pt;">
                <td width=92 valign=center
                    style="width:69.0000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid windowtext;mso-border-left-alt:0.5000pt solid windowtext;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal align=center style="text-align:center;line-height:114%;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">说明</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                <td width=494 valign=top colspan=4
                    style="width:370.9000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:none;;mso-border-left-alt:none;;border-right:1.0000pt solid windowtext;mso-border-right-alt:0.5000pt solid windowtext;border-top:none;;mso-border-top-alt:0.5000pt solid windowtext;border-bottom:1.0000pt solid windowtext;mso-border-bottom-alt:0.5000pt solid windowtext;">
                    <p class=MsoNormal style="text-indent:6.0000pt;mso-char-indent-count:0.5000;text-align:left;"><span
                            style="mso-spacerun:'yes';font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;">80分为基本工资线超过或低于80分每1分加减15元，分数不设上下限，工资加减上下限为300元。试用期员工考核结果仅作为能否转正的依据。各项适用加减分的情况由岗位负责人根据部门整体分值分配加减。</span><span
                            style="font-family:仿宋;color:rgb(0,0,0);font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
            </tr>
            <tr style="height:18.8500pt;"></tr>
            <tr align="center">
                <td colspan=5>
                    <input type="button" value="提交" style="width: 70px;" onclick="ajaxUpload()">
                </td>
            </tr>
            
        </table>
        <p class=MsoNormal><span
                style="mso-spacerun:'yes';font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;"><o:p>&nbsp;</o:p></span>
        </p>
    </div><!--EndFragment--></body>
<script type="text/javascript">

function corechange(){
	var sum = parseInt($("#core1").val())+parseInt($("#core2").val())+parseInt($("#core3").val())+parseInt($("#core4").val())+parseInt($("#core5").val())+parseInt($("#core6").val());
	$("#totalcore").val(sum);
}

function ajaxUpload(){
 		var options = {
				url : "<m:url value='/empCheck/checkproducehtml.do'/>",
				type : "post",
				dataType:"text",
				success :function(d) {
						window.parent.closeCheck();
				}
			};
			$('#form').ajaxSubmit(options);
 	}

</script>
</html>
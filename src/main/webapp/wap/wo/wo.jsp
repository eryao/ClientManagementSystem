<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 强制  高速模式 渲染网页    -->
<meta name=”renderer” content=”webkit”>
<meta http-equiv=”X-UA-Compatible” content=”IE=Edge,chrome=1″ >

<!--添加  jq  支持加载-->
<script	src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 加入移动布局 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
<!-- 加入移动布局 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--添加  本地 mui  支持-->
<script src="${pageContext.request.contextPath}/static/mui/js/mui.min.js"></script>
<link href="${pageContext.request.contextPath}/static/mui/css/mui.css" rel="stylesheet"/>
<!--添加  本地  mui  支持-->

<!--添加layer移动  弹出窗口的 插件支持-->
<script src="${pageContext.request.contextPath}/static/layer_mobile/layer.js"></script>
<!--添加layer移动  弹出窗口的 插件支持-->

<!--修改mui head-bar 变成绿色   -->
<link href="${pageContext.request.contextPath}/static/common/base/alert_mui_bar.css" rel="stylesheet"/>
<!--修改mui head-bar 变成绿色   -->

<!--添加  js api-->
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<!--添加  js api-->


<!--添加  微信分享js 自己扩展的  -->
<script src="${pageContext.request.contextPath}/static/weixin_js/weixin_share.js"></script>
<!--添加  微信分享js 自己扩展的  -->
<title>个人中心</title>

<style type="text/css">
</style>

</head>
<script type="text/javascript" charset="utf-8">
var share_url;//分享连接
var share_img_url;//分享图标
var share_title= "个人中心-${config.domain_title}";//分享标题
var share_desc = "个人中心";//分享摘要


	mui.init();
//这里需要 添加输入 框的监听  如果有焦点了。把下面菜单 隐藏
$(function() {
	$("#wo").addClass("active");
	getClientInfo();
	
	//分享连接
	var host = document.domain; 
	share_url = window.location.href;
	share_img_url = 'http://'+host+'${config.wx_share_img}';
	weixin_share();
	//分享连接
	
});

//从缓存的openid取用户资料
function getClientInfo(){
	$.get("/wap/client/info", function(result){
		if(result.success){
			$("#name").html(result.name);
			$("#phone").html(result.phone);
			$("#address").html(result.address);
			$("#headimg").attr("src",result.img); 
		}else{
		}
	},'json');
}

function client_set(){
	layer.open({
	    type: 2
	    ,content: '转向-设置资料'
	    ,shadeClose:false
	});
	window.location.href='/wap/client/set'
}

</script>
<body>
<header id="header" class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left "><span style="font-size: 16px; line-height: 20px; height: 20px;">返回</span></a>
	<h1 class="mui-title">个人中心</h1>
</header>

<div class="mui-content">
	
	
	<div style=" padding-bottom:10px; padding:10px;  background-color: white;margin-top: 16px; position:relative; margin-bottom:20px;">
		<div style="display: flex;display: -webkit-flex;">
			<div style="width: 60px; text-align: center;">
				<img id="headimg" style="width: 100%;" src="/static/images/base/default_head_img.jpg">
			</div>
			
			<div style="flex:1;-webkit-flex:1; padding-left: 10px;">
				<div id="name">未填</div>
				<div style="font-size: 14px; color: #737373;  ">电话:<span id="phone">未填</span></div>
				<div style="font-size: 14px; color: #737373;   ">地址:<span id="address">未填</span></div>
			</div>
		</div>
		
		
		<div style="position: absolute; right: 5px; bottom:20px;">
			<span onclick="client_set()" style="    text-shadow: 10px -14px 47px #DAC6C6; line-height:44px; font-weight:bold; display: inline-block; padding-left: 10px; padding-right: 10px; font-size: 14px; color: black; ">修改资料</span>
		</div>
	</div>
	
	<div style="border-top: 1px solid #c8c7cc; margin-bottom:10px; background-color: white; ">
		<div style="border-bottom:1px solid #c8c7cc; display: flex;display: -webkit-flex;">
			<div style="flex:1;-webkit-flex:1; font-size:15px; color: #333;padding-left: 15px;  line-height: 40px;">
				我的订单
			</div>
			<div style="flex:1;-webkit-flex:1; font-size:13px; line-height: 40px;color: #777; text-align: right;padding-right: 15px;">
				查看全部订单
			</div>
		</div>
		
		
		<div style="border-bottom:1px solid #c8c7cc; display: flex;display: -webkit-flex;">
			
			<div onclick="window.location.href='/wap/dingdan/my?state=9'"  style="flex:1;-webkit-flex:1; padding: 10px 0px 10px 10px; ">
				<div style="border-right: 1px solid #929292;  text-align: center;" >
					<div style="margin-bottom: 9px;">
						<img style="width: 27px;" src="/static/images/wo/已完成.png" />
					</div>
					<div style="color: #5A5A5A; font-size: 14px;">全部</div>
				</div>
			</div>
			
			<div onclick="window.location.href='/wap/dingdan/my?state=0'"  style="flex:1;-webkit-flex:1; padding: 10px 0px 10px 10px; ">
				<div style="border-right: 1px solid #929292; text-align: center;" >
					<div style="margin-bottom: 6px;">
						<img style="width: 30px;" src="/static/images/wo/待付款 .png" />
					</div>
					<div style="color: #5A5A5A; font-size: 14px;">待付款</div>
				</div>
			</div>
			
			<div onclick="window.location.href='/wap/dingdan/my?state=1'" style="flex:1;-webkit-flex:1; padding: 10px 0px 10px 10px; ">
				<div style="border-right: 1px solid #929292; text-align: center;" >
					<div style="margin-bottom: 6px;">
						<img style="width: 30px;" src="/static/images/wo/已付款.png" />
					</div>
					<div style="color: #5A5A5A; font-size: 14px;">已付款</div>
				</div>
			</div>
			
			<div onclick="window.location.href='/wap/dingdan/my?state=3'" style="flex:1;-webkit-flex:1; padding:10px 0px 10px 10px; ">
				<div style="border-right: 1px solid #929292; text-align: center;" >
					<div style="margin-bottom: 6px;">
						<img style="width: 30px;" src="/static/images/wo/关闭.png" />
					</div>
					<div style="color: #5A5A5A; font-size: 14px;">已取消</div>
				</div>
			</div>
			
			
		</div>
	</div>
	
	
</div>

<!-- 底部菜单 -->
<jsp:include page="/wap/common/fixed_btm.jsp"/>
</body>
</html>
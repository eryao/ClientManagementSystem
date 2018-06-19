<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!--添加添加底部菜单 css-->
<link href="${pageContext.request.contextPath}/static/common/base/fixed_btm.css" rel="stylesheet"/>

<style>
.shop_car_num{
	padding:0px 2px 0px 2px;
	position: absolute; 
	bottom: 38px; 
	left: 64%; 
	border-radius: 20%;
	background-color: rgb(202, 38, 29); 
	color: rgb(255, 255, 255);
	line-height: 14px; 
	text-align: center; 
	display: block; 
	font-size: 10px;
}
</style>

<script>
var openid = '${openid}' ;
var appid  ;
//替换APPID  REDIRECT_URI
var oauth2_url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_base&state=1#wechat_redirect';

//这里需要 添加输入 框的监听  如果有焦点了。把下面菜单 隐藏
$(function() {
	
	var inputs = $(":text");
	var textarea = $("textarea");
	textarea.focus(function() {
		//失去焦点  隐藏 下面的菜单
		$(".footer").hide();
	});
	textarea.blur(function() {
		//失去焦点  显示下面的菜单
		$(".footer").show();
	});
	inputs.focus(function() {
		//失去焦点  隐藏 下面的菜单
		$(".footer").hide();
	});
	inputs.blur(function() {
		//失去焦点  显示下面的菜单
		$(".footer").show();
	});
	load_shop_cart_total();
	getAppId();
	//checkOpenid(); 放到getappid函数里面
});


function getAppId(){
	$.get("/weixin/appid", function(result){
		appid = result;
		console.log("appid:"+appid);
		checkOpenid();
	});
}

//检测openid
function checkOpenid(){
	
	if(!openid){
		console.log('没有openid');
		//跳转登陆页面  把此页面记录缓存 
		console.log(location.href);
		window.sessionStorage.setItem("jumpURL",location.href);
		
		//取得当前域名 没有带http://   
		var host = document.domain; 
		console.log(host);
		//跳转微信登陆页面
		//  /weixin/oauth2
		////替换APPID  REDIRECT_URI
		oauth2_url =oauth2_url.replace("APPID", appid);
		oauth2_url =oauth2_url.replace("REDIRECT_URI", "http://"+host+"/weixin/oauth2");
		
		console.log(oauth2_url);
		window.location=oauth2_url;
		
	}
}

function load_shop_cart_total(){
	$.post("/shopcart/getTotal", {}, function(result) {
		$(".shop_car_num").html(result.total);
	}, 'json');
}

</script>

<!-- 底部菜单 -->

<div class="footer">
	<ul>
		<li id="home" onclick="window.location.href='/index.html'">首页</li>
		<li id="category">分类</li>
		<li onclick="window.location.href='/wap/shopcart/index.html'"   id="shop">购物车
			<div class="shop_car_num">-1</div>
		</li>
		<li onclick="window.location.href='/wap/wo/index'" id="wo">我的</li>
	</ul>
</div>

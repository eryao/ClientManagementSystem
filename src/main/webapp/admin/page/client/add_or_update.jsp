<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL -->

${config.headStr}

${config.layuiStr}


<!-- 加入移动布局 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no" />
<!-- 加入移动布局 -->

<!--添加  vue.js 支持加载-->
<script src="${pageContext.request.contextPath}/static/vue/vue.min.js"></script>
<!--添加  vue.js 支持加载-->

<script>
$(function(){
	if("${client.clientTypeId}"!=""){
		$("#clientTypeId").val('${client.clientTypeId}');
	}
	if("${client.sex}"!=""){
		$("#sex").val('${client.sex}');
	}
});
	
	var save_url = '${save_url}';
	
	function save() {
		//loading
		var index = layer.load(1, {
			shade : [ 0.1, '#fff' ]
			//0.1透明度的白色背景
		});
		
		$.post(save_url, {
			name : app.name,carno : app.carno,
			sex : app.sex,
			phone : app.phone,
			address:app.address,
			balance:app.balance,
			remark:app.remark,
			clientTypeId:$("#clientTypeId").val(),sex:$("#sex").val()
		}, function(result) {
			if (result.success) {
				//调用 父窗口的  关闭所有窗口 并且刷新 页面
				window.parent.closeDlg(result.msg);
			} else {
				layer.closeAll();
				layer.msg(result.msg);
			}
		}, 'json');
	}
</script>
<style>
html, body {
}

.layui-form-item {
	margin-bottom: 3px;
}
</style>
</head>
<body id="app">
	
	<div style="padding: 10px;">
		<form class="layui-form layui-form-pane">
			
			
		 <div class="layui-form-item">
		    <label class="layui-form-label">客户类型</label>
		    <div class="layui-input-block">
		      <select name="interest" id="clientTypeId" lay-filter="aihao"  >
		        	<c:forEach var="clientType" items="${clientTypeList}" varStatus="status">
		        		<c:if test="${status.index==0}">
							<option value="${clientType.id}" selected="">${clientType.name}</option>
						</c:if>
						
						
						<c:if test="${status.index!=0}">
							<option value="${clientType.id}">${clientType.name}</option>
						</c:if>
		        		
		        	</c:forEach>
		      </select>
		    </div>
		  </div>
		  
		  <div class="layui-form-item">
				<label class="layui-form-label">卡号</label>
				<div class="layui-input-block">
					<input type="text"   autocomplete="off" v-model="carno"
						value="${client.carno }" placeholder="请输入 卡号" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-block">
					<input type="text"   autocomplete="off" v-model="name"
						value="${client.name }" placeholder="请输入姓名" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
			    <label class="layui-form-label">性别</label>
			    <div class="layui-input-block">
			      <select name="interest" id="sex" lay-filter="aihao"  >
			        	<option value="2" selected="">女</option>
			        	<option value="1">男</option>
			      </select>
			    </div>
			  </div>
				
			<div class="layui-form-item">
				<label class="layui-form-label">电话</label>
				<div class="layui-input-block">
					<input type="text"   autocomplete="off" v-model="phone"
						value="${client.phone }" placeholder="请输入电话" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">地址</label>
				<div class="layui-input-block">
					<input type="text" id="address" autocomplete="off" v-model="address"
						value="${client.address }" placeholder="请输入地址" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">备注</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入备注" class="layui-textarea" id="remark" v-model="remark">${client.remark }</textarea>
				</div>
			</div>

		</form>
		<div class="site-demo-button" style="margin-top: 20px;">
			<button id="save" onclick="save()"
				class="layui-btn site-demo-layedit" data-type="content">${btn_text }</button>
		</div>
	</div>


<script>
layui.use([ 'laydate', 'laypage', 'layer', 'table', 'carousel',
			'upload', 'element' ], function() {
		var laydate = layui.laydate //日期
		, laypage = layui.laypage //分页
		layer = layui.layer //弹层
		, table = layui.table //表格
		, carousel = layui.carousel //轮播
		, upload = layui.upload //上传
		,form = layui.form
		, element = layui.element; //元素操作
		
		
		
});
</script>

<script>
var app = new Vue({
	el : '#app',
	data : {
	}
});
</script>

</body>
</html>
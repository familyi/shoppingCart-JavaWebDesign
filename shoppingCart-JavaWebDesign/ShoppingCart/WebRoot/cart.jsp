<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="styles/reset.css">
	<link rel="stylesheet" href="styles/main.css">
	<script type="text/javascript" src="scripts/cart.js"></script>
	<script type="text/javascript" src="scripts/checkAmount.js"></script>
  </head>
  
  <body>
<s:include value="header.jsp"/>

	<div class="bill-main wrap">
		<div class="bill-info">
			<div class="title">
				<ul>
				<li class="bill-select bill-select-all fl "><input type="checkbox" name="" id="All">全选</li>
				<li class="bill-pic fl">商品图片</li>
				<li class="bill-details fl">商品名称</li>
				<li class="bill-Sprice fl">单价</li>
				<li class="bill-num fl">数量</li>
				<li class="bill-amount fl">库存</li>
				<li class="bill-Aprice fl">总价</li>
				<li class="bill-delete fl">操作</li>
			</ul>
			</div>
				
			<s:iterator value="goodsList" id="goods">
	<form action="CartManagerMod.action" method="post">
	 
			<div class="buyer-info-content pay-way">
			<ul class="clearfix">
				<li class="bill-select fl"><div id="select"><input type="checkbox" class="select" name="select"></div></li>
				<li class="bill-pic fl"><img src="<s:property value="picURL"/>" alt="pic"></li>
				<li class="bill-details fl"><s:property value="name"/></li>
				<li class="bill-Sprice fl"><s:property value="price"/></li>
				<li class="bill-num fl">
					<div class="num-box ">
						<a class="reduce btn" id="reduce">-</a>
						  
						<input type="text" name="num" value="<s:property value="num"/>"  id="amount" class="hiddenText" onkeyup='this.value=this.value.replace(/\D/gi,"")'>
						
						<a class="add btn" id="add">+</a>	
						<span id="overAmount" class="overAmount">购买数量超过库存</span>
					</div>
					
				</li>
				<li class="bill-amount fl" id="maxAmount"><s:property value="amount"/></li>	
				<li class="bill-Aprice fl"><fmt:formatNumber value="${num*price}" pattern="#0.00" /></li>
				<li class="bill-delete fl">
					<span class="de"><s:a href="CartManagerDele.action?pid=%{#goods.pid}">删除</s:a></span>
					<input type="hidden" name="pid" value="<s:property value="pid"/>">
					<span id="modified"><input type="submit" value="修改"></span>			
				</li>
			</ul>
			</div>
	
	</form>
	</s:iterator>
		</div>
	
	
	</div>
	
	<!--结算条-->
	<div class="buybar">
		<div class="ok fl">
			<a href="showGoods.action" class="return">&gt;&gt;返回继续购物</a>
		</div>
		<form action="" method="post">
			<s:iterator value="goodsList" id="goods">
				<input type="hidden" name="pid" value="<s:property value="pid"/>">
			 	<input type="hidden" name="num" <s:property value="num"/>>
			</s:iterator>
		<div class="ok fr"><input type="submit" value="结算" class="okBtn"></div>
		
		</form>
		<div class="fr totalPrice">合计：<span class="price" id="totalPrice">￥200</span></div>
	</div>
	  
  </body>
</html>

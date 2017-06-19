<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品详情页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" href="styles/reset.css">
	<link rel="stylesheet" href="styles/main.css">
	<script type="text/javascript" src="scripts/checkAmount.js"></script>
  </head>
  
<body>
<s:include value="header.jsp"/>

	<div class="bg-grey">
		<div class="pro-detalis wrap ">
			<div class="details-content clearfix bg-w">
				<div class="details-left fl">
					<div class="top-pic"><img src="<s:property value="picURL"/>  " alt="detail-big"></div>
				</div>
				<div class="details-right fl">
					<h1><s:property value="name"/>
					</h1>
					<div class="price"><h6>价格</h6><b>￥<i><s:property value="price"/>  </i></b></div>
					<div class="buyer-info">
					<form action="DetailsAdd.action" method="post" onsubmit="return check();">
						<div class="place info clearfix">		
						<div class="num info clearfix">
							<div class="fl"><h6>数量</h6></div>
							<div class="select-item fl num-select">
								<div class="num-box">
									<a class="reduce" id="reduce">-</a><input type="text" value="1" name="num" class="num-txt" id="amount" onkeyup='this.value=this.value.replace(/\D/gi,"")'><a  class="add" id="add">+</a>
								</div><span>库存<i id="maxAmount"><s:property value="amount"/>  </i>件</span>
							</div>
						</div>
					</div>
					<div class="buy-bottom">
						<p class="buyed-info"><span id="overAmount" class="overAmount">购买数量超过库存</span></p>
						<input type="hidden" name="pid" value="<s:property value="pid"/>">
						<span class="btn"><i></i><input type="submit" value="加入购物车" class="add"></span>
						<span class="btn"><i></i><input type="button" value="立即购买" class="add"></span>
						<span><a href="showGoods.action" class="return">&gt;&gt;返回继续购物</a></span>
					</div>
					</form>
				</div>
			</div>
		</div>
		<div class="wrap clearfix details-main">
			<div class="rightpart  bg-w">
				<div class="title right-title">
					<div class="title right-title">
						<ul class="product-tab clearfix">
							<li class="product-introduce active"><span></span>产品介绍</li>
							<li class="product-comment "><span></span>产品评价<i>(10988)</i></li>
						</ul>
					</div>
				</div>
			
				<div class="content clearfix">
					<s:property value="note"/> 
				</div>
				
			</div>
		</div>
	</div>
	
</div>
	

</body>
</html>

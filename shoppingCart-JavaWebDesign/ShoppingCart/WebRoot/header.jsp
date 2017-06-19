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
    
    <title></title>
    
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
 
 <div class="header">
	 <div class="top">
		<div class="wrap">
			<div class="top-left fl"><a href="#" class="online">当前在线人数:${application.onlineCount }</a></div>
			<div class="top-right fr">欢迎<strong>&nbsp;<s:property value="#session.name"/>&nbsp;</strong>来到商城！
			<a href="userInfo.action?username=<s:property value="#session.username"/>">进入后台</a>
			<a href="logout.action">[注销]</a></div>
			
		</div>
	</div> 
		<!-- top end -->
		<div class="logobar">
			<div class="wrap">
				<div class="logo fl"><a href="showGoods.action" class="home">首页home</a></div>
				<div class="search fl" id="search">
					<form action="showGoods.action" method="post">
						<input type="text" class="search-txt" name="keyWord">
						<input type="submit" class="search-btn" value="搜索">
					</form>
				</div>
				<div class="shopcar fl">
					<a href="CartManagerShow.action" class="car">购物车</a><span class="num">0</span>
				</div>
			</div>		
		</div>
		<!-- logobar end -->
		<div class="navbar">
			<div class="wrap clearfix">
				<div class="shop-menu ">
				<h3 class="">全部商品分类<i class="tri"></i></h3>
				</div>
				
				<ul class="nav fl">
					<li><a href="#" class="active">服装</a></li>
					<li><a href="#">鞋子</a></li>
					<li><a href="#">家居用品</a></li>
					<li><a href="#">电子用品</a></li>
					<li><a href="#">图书文具</a></li>
					<li><a href="#">珠宝首饰</a></li>
				</ul>	
			</div>
		</div>
	</div>	

		

</body>
</html>
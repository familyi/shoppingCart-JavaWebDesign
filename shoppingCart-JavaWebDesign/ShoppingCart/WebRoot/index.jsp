<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>   
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>   
<head>   
<title> 商城首页 </title>   
<link rel=stylesheet href="css/login.css" type="text/css">   

<link rel="stylesheet" href="styles/reset.css">
	<link rel="stylesheet" href="styles/main.css">
</head>   
<body>   

<s:include value="header.jsp"/>
<div id="main">
<!-- 显示商品 -->
 <s:iterator value="goodsList" id="good">
 	<div class="item">
 		<div class="pic"><img src="<s:property value="picURL"/>"></div>
 		<div>
 			<span class="price">￥<s:property value="price"/></span>
 			<span class="count fr">浏览次数:<s:property value="count"/></span>
 		</div>
 		<div class="bookname"><s:property value="name"/></div>
 		<p class="about"><s:a href="details.action?pid=%{#good.pid}">查看详情</s:a></p>
 	</div>
 	
 </s:iterator>
 <!-- 分页 -->
 	 <!-- 首页 -->
 	 <s:url id="url_first" value="showGoods.action">
         <s:param name="pageNow" value="1"></s:param>
     </s:url>
     <!-- 上一页 -->
     <s:if test="pageNow>1">
	     <s:url id="url_pre" value="showGoods.action">
	         <s:param name="pageNow" value="pageNow-1"></s:param>
	     </s:url>
	 </s:if>
	 <!-- 下一页 -->
	  <s:if test="pageNow<pageCount">
	     <s:url id="url_next" value="showGoods.action">
	         <s:param name="pageNow" value="pageNow+1"></s:param>
	     </s:url> 
     </s:if>  
     <!-- 尾页 -->
	     <s:url id="url_last" value="showGoods.action">
	         <s:param name="pageNow" value="pageCount"></s:param>
	     </s:url> 
	     
  <s:iterator value="goodsList" status="status">     
        <s:url id="url" value="showGoods.action">
            <s:param name="pageNow" value="pageNow"/>
            <s:param name="pageCount" value="pageCount"/>
        </s:url>
  </s:iterator>
  
  <div class="paging">
  	<span class="PNPage"> <s:a href="%{url_first}">首页</s:a></span> 
    <span class="PNPage"> <s:a href="%{url_pre}">上一页</s:a></span>  
    <span class="PNPage"> <s:a href="%{url_next}">下一页</s:a> </span> 
    <span class="PNPage"> <s:a href="%{url_last}">尾页</s:a></span> 
  </div>
  
  </div> 
</body>   
</html>   
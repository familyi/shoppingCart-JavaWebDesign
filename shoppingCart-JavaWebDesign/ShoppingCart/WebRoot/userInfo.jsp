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
    
    <title>用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/reset.css">
	<link rel="stylesheet" type="text/css" href="styles/main.css">
	

  </head>
  
  <body>
	<s:include value="header.jsp"/>
	<s:debug></s:debug>
	<div class="bill-main wrap">
		<div class="bill-info">
			<div class="title">基本信息</div>
			<div class="buyer-info-content user-info-content">
				<div class="pic">
					 <img src="${pageContext.request.contextPath}/<s:property value="'images/'+imageFileName"/>">
    			</div>
				<div class="upload">
					<form action="${pageContext.request.contextPath}/upload.action" enctype="multipart/form-data" method="post">
	           			 <input type="file" name="image" class="uploadText">
	                	<input type="submit" value="上传" />
	        		</form>
	        		 <s:fielderror />
        		</div>
              
				<p><span class="label">姓名：</span> <s:property value="name"/> <s:property value="user.name"/></p>
				<p>
					<span class="label">手机：</span>
					<s:property value="telephone"/>
				</p>
				<p>
					<span class="label">详细地址：</span>
					 <s:property value="address"/>
				</p>
				<p><span class="label">邮编：</span>
				<s:property value="zipcode"/></p>
				 
			</div>

		</div>
		

	</div>
	
  </body>
</html>

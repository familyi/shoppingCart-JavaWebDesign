<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>   
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>   
<head>   
<title> 登录页面 </title>   
<meta charset="utf-8">
<link rel="stylesheet" href="styles/reset.css">
<link rel="stylesheet" href="styles/main.css">
 <script type="text/javascript" src="scripts/checkUser.js"></script>
</head>   
<body>  
 <div class="header">
		<div class="top">
			<div class="wrap">
				<div class="top-left fl"><a href="#" class="online">当前在线人数:${application.onlineCount }</a></div>
				<div class="top-right fr">欢迎来到商城！<a href="login.jsp">[登录]</a><a href="register.jsp">[免费注册]</a></div>
				
			</div>
		</div> 
		<!-- top end -->
		<div class="logobar">
			<div class="wrap">
				<div class="logo fl"></div>
			</div>		
		</div>
		<!-- logobar end -->
	</div>
	<div class="login-main">
		<div class="login-page">
			<form action="login.action" method="post">
				<p>用户名</p>
				<div class="text loginMargin"><input type="text" name="username" class="text-input" onblur="checkUser(this.value);"><span class="name"></span><br>
            	<span id="idMsg"></span>
				</div>
				<p>密码</p>
				<div class="text"><input type="password" name="password" class="text-input" onblur="checkPass(this.value);"><span class="password"></span><br>
				 <span id="passMsg"></span><br>
				</div>
				<p class="login-type">
					<input type="checkbox" class="checkbox">
					<span>一周内自动登录</span>
			
				</p>
				<p><input type="submit" value="登陆" class="login-btn" id="login"></p>
			</form> 
		</div>	
		<div><a href="register.jsp"><input type="button" value="免费注册&gt;&gt;" class="register"></a></div>
		
	</div>


</body>   
</html>   
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
    <title>注册</title>
    <script type="text/javascript" src="scripts/checkUser.js"></script>
	<link rel="stylesheet" href="styles/reset.css">
	<link rel="stylesheet" href="styles/main.css">
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
	<div class="register-main">
		<div class="register-page ">
		  <form action="register.action" method="post" onsubmit="return checkForm();">
			<div class="item clearfix">
				<div class="fl title">
					<i>*</i><span>帐户名：</span>
				</div>
				<div class="fl text">
				<input type="text" name="username" placeholder="用户名" class="text-input" onblur="checkUserid(this.value);"><span class="name "></span> 
				<span id="idMsg" class="msg"></span>
				</div>
			</div>
			<div class="item clearfix">
				<div class="fl title">
					<i>*</i><span>请设置密码：</span>
				</div>
				<div class="fl text">
				<input type="password" name="password"  id="pass" class="text-input" onblur="checkPass(this.value);"><span class="password"></span>
				<span id="passMsg" class="msg"></span>
				</div>
			</div>
			<div class="item clearfix">
				<div class="fl title">
					<i>*</i><span>请确认密码：</span>
				</div>
				<div class="fl text">
					<input type="password"  class="text-input" id="confirmPass" onblur="confirm(this.value);"><span class="password"></span>
					<span id="confirmPassMsg" class="msg"></span>
				</div>
			</div>
			<div class="item clearfix">
				<div class="fl title">
					<i>*</i><span>姓名：</span>
				</div>
				<div class="fl text">
					<input type="text" name="name" class="text-input">
				</div>
			</div>
			<div class="item clearfix">
				<div class="fl title">
					<i>*</i><span>地址：</span>
				</div>
				<div class="fl text">
					<input type="text" name="address" class="text-input"><span id="addressMsg" class="msg"></span>
				</div>
			</div>
			<div class="item clearfix">
				<div class="fl title">
					<i>*</i><span>手机：</span>
				</div>
				<div class="fl text">
					<input type="text" placeholder="11位数字" name="tele" class="text-input"  onblur="checkTel(this.value);"><br>
					<span id="telMsg" class="msg"></span>	
				</div>
			</div>
			<div class="item clearfix">
				<div class="fl title">
					<i>*</i><span>邮编：</span>
				</div>
				<div class="fl text">
				<input type="text" placeholder="6位数字" name="zipcode" class="text-input" onblur="checkCode(this.value);"><br>
				<span id="codeMsg" class="msg"></span>			
				</div>
			</div>
			<div class="read clearfix">
				<div class="fl title"></div>
				<div class="fl r">	
				<input type="checkbox" checked="checked"/>我已阅读并同意《用户注册协议》
				</div>
			</div>
			<p class="submit"><input type="submit" value="提交" class="login-btn"></p>
		</form>
		</div>	
		
	
	</div>
    </body>
</html>
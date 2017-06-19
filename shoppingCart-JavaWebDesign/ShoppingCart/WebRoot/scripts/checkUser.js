//注册--数据库检验用户名是否可用
	var xmlHttp;
	var flag=false;
	function createXMLHttp(){
		if(window.XMLHttpRequest){
			xmlHttp=new XMLHttpRequest();
		}else{
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	function checkUserid(username){
		if(checkUser(username)){
			createXMLHttp();
			xmlHttp.open("POST","CheckUser.action?username="+username);
			xmlHttp.onreadystatechange=checkUseridCallback;
			xmlHttp.send(null);
			document.getElementById("idMsg").innerHTML="checking...";
		}
		
	}
	function checkUseridCallback(){
		if(xmlHttp.readyState==4){
			if(xmlHttp.status==200){
				var text=xmlHttp.responseText;
				if(text=="error"){
					flag=false;
					document.getElementById("idMsg").innerHTML="错误！该用户名已存在！";
				}else{
					flag=true;
					document.getElementById("idMsg").innerHTML="该用户名可用";
				}
			}
		}
	}

//用户名--字母、数字、下划线组成，字母开头，4-16位。
	function checkUser(s){
	 
	 re = /^[a-zA-z]\w{3,15}$/;
	    if(re.test(s)){
	    	flag=true;
	    	document.getElementById("idMsg").innerHTML="";
	    }else{
	    	isLogin=false;
	    	flag=false;
	    	document.getElementById("idMsg").innerHTML="应由字母开头,4-16位字母、数字、下划线组成";
	    }  
	    return flag;
	}
//密码--4~16个字符
	function checkPass(s){		 
		 re = /[a-zA-Z0-9]{4,16}/;
		    if(re.test(s)){
		    	flag=true;
		    	document.getElementById("passMsg").innerHTML="";
		    }else{
		    	flag=false;
		    	document.getElementById("passMsg").innerHTML="密码应由4~16个字符组成";
		    }
		}
	
//确认密码
	function confirm(s){
		var pass=document.getElementById("pass").value;
		    if(pass==s){
		    	flag=true;
		    	document.getElementById("confirmPassMsg").innerHTML="";
		    }else{
		    	flag=false;
		    	document.getElementById("confirmPassMsg").innerHTML="两次输入密码不一致";
		    }
		}
//电话
	function checkTel(s){
		var re =/^1\d{10}$/;
		if (re.test(s)) {
		        flag=true;
		        document.getElementById("telMsg").innerHTML="";
		    }else{
		    	flag=false;
		    	document.getElementById("telMsg").innerHTML="手机号码格式不正确！";
		    }
		}
//邮编
	function checkCode(s){
		var re =/^[1-9][0-9]{5}$/;
		if (re.test(s)) {
		        flag=true;
		        document.getElementById("codeMsg").innerHTML="";
		    }else{
		    	flag=false;
		    	document.getElementById("codeMsg").innerHTML="邮编格式不正确！";
		    }
		}
//注册提交
	function checkRegister(){
		if(flag){
			alert("注册成功！返回登录界面登录");
		}
		return flag;
	}
//登录提交
	function checkLogin(){
		return flag;
	}
	


window.onload=function(){
var reduce=document.getElementById("reduce");//减
var add=document.getElementById("add");//加
var amount=document.getElementById("amount");//购物车文本框数量
var maxAmount=document.getElementById("maxAmount");//最大库存
var overAmount=document.getElementById("overAmount");//错误标签
add.onclick=function(){
	var num=parseInt(maxAmount.innerHTML);
	console.log("max:"+num);
	if(amount.value<num){
		amount.value = parseInt(amount.value) + 1;
	};
	
};
reduce.onclick=function(){
	if(amount.value>1)
		amount.value = parseInt(amount.value) - 1;
	};

amount.onblur=function(){
	var num=parseInt(maxAmount.innerHTML);
	if(amount.value>num){
		overAmount.style.display="block";
	}else{
		overAmount.style.display="";
	}
};
function check(){
	var flag=false;
	if(amount.value>num){
		overAmount.style.display="block";
		flag=false;
		console.log(flag);
		return flag;
	}else{
		flag=true;
		return flag;
	}
}

};

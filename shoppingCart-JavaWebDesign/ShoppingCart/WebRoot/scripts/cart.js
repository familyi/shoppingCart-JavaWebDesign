window.onload=function(){
//全选
	 var CheckAll=document.getElementById('All');
	   // var UnCheck=document.getElementById('uncheck');
	    var select=document.getElementById('select');
	    var CheckBox=select.getElementsByTagName('input');
	    
	    CheckAll.onclick=function(){
	    	console.log("select"+select);
		    console.log("CheckBox"+CheckBox);
	            for(var i=0;i<CheckBox.length;i++){
	                    CheckBox[i].checked=true;
	                };
	        };
	   /*UnCheck.onclick=function(){
	            for(i=0;i<CheckBox.length;i++){
	                    CheckBox[i].checked=false;
	                };
	        };
*/
	   
//结算按钮变红

//点击修改按钮

//总价

};



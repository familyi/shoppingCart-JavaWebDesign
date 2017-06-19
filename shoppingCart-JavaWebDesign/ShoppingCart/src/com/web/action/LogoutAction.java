package com.web.action;

import com.opensymphony.xwork2.ActionContext;

public class LogoutAction {
	//注销
    public String logout(){
    	ActionContext.getContext().getSession().remove("name");
    	ActionContext.getContext().getSession().remove("username");
    	return "success";
    	}  
    
	public String execute(){   
	    System.out.println("退出系统");   
	    return null;   
	}
}
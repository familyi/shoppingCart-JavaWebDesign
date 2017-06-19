package com.web.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.web.dbc.DatabaseConnection;
import com.web.vo.User;
public class UserInfoAction extends ActionSupport implements ModelDriven<User>{

	private static final long serialVersionUID = 1L;
	private User user=new User();
    private DatabaseConnection dbc = new DatabaseConnection(); 

    //用户信息页
	 public String userInfo(){
		 System.out.print("con"+user.getUsername());
		 String sql = "select mid,password,name,address,telephone,zipcode from member where mid='" + user.getUsername()+"'";
	    	ResultSet rS = dbc.executeQuery(sql);
	    	try {
		    	if (rS.next()) {	    		
		    		user.setUsername(rS.getString(1));
		    		user.setPassword(rS.getString(2));
		    		user.setName(rS.getString(3));
		    		user.setAddress(rS.getString(4));
		    		user.setTelephone(rS.getString(5));
		    		user.setZipcode(rS.getString(6));		
		    		return "success";
		    	}

		    	return "error";
	    	} catch (SQLException e) {
		    	e.printStackTrace();
		    	return "error";
	    	}
	 }
	 
	
	 
    public String execute(){   
	    return null;
	}
   
	public User getModel() {
		return user;
	}

	
}

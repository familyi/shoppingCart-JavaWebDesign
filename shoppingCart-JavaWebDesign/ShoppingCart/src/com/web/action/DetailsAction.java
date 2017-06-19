package com.web.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.web.dbc.DatabaseConnection;
import com.web.vo.Goods;

public class DetailsAction extends ActionSupport implements ModelDriven<Goods>{	
	
	private static final long serialVersionUID = 1L;
	
	private Goods goods=new Goods(); 
    private DatabaseConnection dbc = new DatabaseConnection();
    //增加浏览次数
    public String addCount(){
		 String sql = "UPDATE product SET count = count+1 WHERE pid ='"+goods.getPid()+"'";
	    	int i = dbc.executeUpdate(sql);
	    	if (i > -1) {
	    		return "success";
	    	}
	    	return "error";
	    }
    //显示详情
    public String showDetails(){
    	String sql = "select pid,name,note,price,amount,count,picURL from product where pid='" + goods.getPid() +"'";
    	ResultSet rs = dbc.executeQuery(sql);
    	System.out.println("details"+goods.getPid());
    	try {
	    	if (rs.next()) {
	    		goods.setPid(rs.getInt(1));
	    		goods.setName(rs.getString(2));
	    		goods.setNote(rs.getString(3));
	    		goods.setPrice(rs.getFloat(4));
	    		goods.setAmount(rs.getInt(5));
	    		goods.setCount(rs.getInt(6));
	    		goods.setPicURL(rs.getString(7));
	    	}
    	} catch (SQLException e) {
	    	e.printStackTrace();
    	}
    	addCount();
	 return "success";
    }
    
    //加入购物车
	 public String AddGoods(){
		 String sql = "UPDATE product SET num = num+"+goods.getNum()+" WHERE pid ='"+goods.getPid()+"'";
	    	int i = dbc.executeUpdate(sql);
	    	if (i > -1) {
	    		 System.out.println("add"+goods.getNum());
	    		showDetails();
	    		return "success";
	    	}
	    	return "error";
	    }
	 
	 public String execute() throws Exception {
	 
		 return null;
	 }
		public Goods getModel() {
			return goods;
		} 

}

package com.web.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.web.dbc.DatabaseConnection;
import com.web.vo.Goods;
public class CartManagerAction extends ActionSupport implements ModelDriven<Goods>{
	private static final long serialVersionUID = 1L;
	private Goods goods=new Goods();
	private List<Goods> goodsList;
    private DatabaseConnection dbc = new DatabaseConnection(); 

	 //删除商品
	 public String DeleGoods(){
		 String sql = "UPDATE product SET num = 0 WHERE pid ='"+goods.getPid()+"'";
	    	int i = dbc.executeUpdate(sql);
	    	if (i > -1) {
	    		ShowCart();
	    		return "success";
	    	}
	    	return "error";
	    }
	 //修改商品数量
	 public String ModGoods(){
		 String sql = "UPDATE product SET num = "+goods.getNum()+" WHERE pid ='"+goods.getPid()+"'";
		 int i = dbc.executeUpdate(sql);
	    	if (i > -1) {
	    		ShowCart();
	    		return "success";
	    	}
	    	return "error";
	    }
	 //显示购物车
	 public String ShowCart(){
		 goodsList = new ArrayList<Goods> () ;
		 String sql = "select pid,name,note,price,amount,count,picURL,num from product where num!=0";
		 try {
		 ResultSet rs = dbc.executeQuery(sql);
	    	while (rs.next()) {
	    	       goods = new Goods () ;
	    	       goods.setPid(rs.getInt(1));
	    	       goods.setName(rs.getString(2)); 
	    	       goods.setNote (rs.getString(3));
	    	       goods.setPrice (rs.getFloat(4));
	    	       goods.setAmount (rs.getInt(5));
	    	       goods.setCount (rs.getInt(6));
	    	       goods.setPicURL (rs.getString(7));
	    	       goods.setNum (rs.getInt(8));
	    	       goodsList.add (goods) ;
	    	       
	    	 }
	   } catch(SQLException e) {
		   e.printStackTrace() ;
	   }
	    	return "success";
	    }
	//修改商品数量
		 public String Pay(){
			 String sql = "UPDATE product SET num = num-"+goods.getNum()+" WHERE pid ='"+goods.getPid()+"'";
			 int i = dbc.executeUpdate(sql);
		    	if (i > -1) {
		    		ShowCart();
		    		return "success";
		    	}
		    	return "error";
		    }
	 
    public String execute(){   
	    return null;
	}
   
	public Goods getModel() {
		return goods;
	}
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}

	
}

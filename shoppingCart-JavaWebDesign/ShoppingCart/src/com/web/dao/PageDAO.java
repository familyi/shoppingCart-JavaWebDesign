package com.web.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.web.dbc.*;
import com.web.vo.Goods;

public class PageDAO {
 
 private Goods goods ;
 private DatabaseConnection dbc = new DatabaseConnection();
  //分页查询
  public List<Goods> queryByPage (int pageSize, int pageNow,String keyWord) {
   List<Goods> list = new ArrayList<Goods> () ;
   try {
	       if (dbc.getConnection()!=null && pageSize>0 && pageNow>0) {
     String sql="select pid,name,note,price,amount,count,picURL from product WHERE name LIKE '%"+keyWord
    		 	+"%' order by pid limit "+(pageNow*pageSize-pageSize)+","+pageSize;
     
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
       list.add (goods) ;
      }
     }else if(dbc.getConnection()!=null && pageNow<=0){
    	 
     }
   } catch(SQLException e) {
	   e.printStackTrace() ;
   }
   return list ;
  }
  public int queryPageCount (int pageSize,String keyWord) {
	  int i=0;
	  int pageCount=0;
	   try {
	     if (dbc.getConnection()!=null && pageSize>0 ) {
	     String sql="select pid,name,note,price,amount,count,picURL from product WHERE name LIKE '%"+keyWord+"%'";
	     ResultSet rs = dbc.executeQuery(sql);
		      while (rs.next()) {
		        i++;
		      }
	     
		      if(i%pageSize==0){
		    	  pageCount=i/pageSize;
		     }else{
		    	 pageCount=i/pageSize+1;
		     }
	     }
	   } catch(SQLException e) {
		   e.printStackTrace() ;
	   }
	   return pageCount ;
	  }
}
//显示所有商品
package com.web.action;
import java.util.List;

import com.web.dao.PageDAO;
import com.opensymphony.xwork2.ActionSupport;
import com.web.vo.Goods;
public class ShowGoodsAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private List<Goods> goodsList ;
	 private int pageNow = 1 ; //初始化为1,默认从第一页开始显示
	 private int pageSize = 6 ; //每页显示6条记录
	 private int pageCount= 1;  //页数
	 private String keyWord;
	 private PageDAO pageDAO = new PageDAO () ;
	 
	public String execute() throws Exception {
	  if("null".equals(keyWord)||keyWord==null){
		  keyWord="";
	  }
	  if(pageNow<=1){
		  pageNow=1;
		}
	  
	  pageCount = pageDAO.queryPageCount(pageSize,keyWord) ;
	  
	  if(pageNow>=pageCount){
		  pageNow=pageCount;
		}
	  goodsList = pageDAO.queryByPage(pageSize, pageNow,keyWord) ;
	  return "success";
	 }
	
	 public List<Goods> getGoodsList() {
			return goodsList;
		}
		public void setGoodsList(List<Goods> goodsList) {
			this.goodsList = goodsList;
		}
		public String getKeyWord() {
			return keyWord;
		}
		public void setKeyWord(String keyWord) {
			this.keyWord = keyWord;
		}
		public int getPageNow() {
		  return pageNow;
		 }
		 public void setPageNow(int pageNow) {
		  this.pageNow = pageNow;
		 }
		 public int getPageSize() {
		  return pageSize;
		 }
		 public void setPageSize(int pageSize) {
		  this.pageSize = pageSize;
		 }
		public int getPageCount() {
			return pageCount;
		}
		public void setPageCount(int pageCount) {
			this.pageCount = pageCount;
		}
}

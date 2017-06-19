package com.web.action;
import java.sql.*;
import java.util.List;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.web.dao.PageDAO;
import com.web.dbc.DatabaseConnection;
import com.web.vo.Goods;
import com.web.vo.User;
public class LoginAction extends ActionSupport implements ModelDriven<User>{   
	private static final long serialVersionUID = 1L;
	private int pageNow = 1 ; //初始化为1,默认从第一页开始显示
	private int pageSize = 6 ; //每页显示6条记录
	private String keyWord="";
    private User user=new User();
    private PageDAO pageDAO = new PageDAO () ;
    private List<Goods> goodsList ;
    private DatabaseConnection dbc = new DatabaseConnection();
    public String Login() throws Exception{
    	String sql = "select mid,password,name,address,telephone,zipcode from member where mid='" 
    				+ user.getUsername()+"' and password ='"+user.getPassword()+"'";
    	ResultSet rS = dbc.executeQuery(sql);
    	try {
	    	if (rS.next()) {	    		
	    		user.setName(rS.getString(3));
	    		String name=user.getName();
	    		ActionContext.getContext().getSession().put("name", name);
	    		ActionContext.getContext().getSession().put("username", user.getUsername());
	    		goodsList = pageDAO.queryByPage(pageSize,pageNow,keyWord) ;
	    		return "success";
	    	}
	    	return "error";
    	} catch (SQLException e) {
	    	e.printStackTrace();
	    	return "error";
    	}
    }
    public String register() {
    	String sql = "insert into member(mid,password,name,address,telephone,zipcode) "
    			+ "values('"+user.getUsername()+"','"+user.getPassword()+"','"+user.getName()+"','"
    			+user.getAddress()+"','"+user.getTelephone()+"','"+user.getZipcode()+"')";
    	int i = dbc.executeUpdate(sql);
    	if (i > -1) {
    		 ActionContext.getContext().getSession().put("type", "register");
    		return "success";
    	}
    	return "error";
    	}
	
    
   
	public String execute(){     
	    return null;
	}   
	public void validate(){
	    if(null == user.getUsername() || "".equals(user.getUsername().trim()))
	    {
	        this.addFieldError("username", "username error");
	    }
	    
	    if(null == user.getPassword() || "".equals(user.getPassword().trim()))
	    {
	        this.addFieldError("password", "username error");
	    }
	}
	public User getModel(){
		return user;
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
}   

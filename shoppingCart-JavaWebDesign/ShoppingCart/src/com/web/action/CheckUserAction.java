package com.web.action;
import java.sql.*;
import java.io.PrintWriter;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;  
import com.opensymphony.xwork2.ActionSupport;
import com.web.dbc.DatabaseConnection;

	public class CheckUserAction extends ActionSupport{
		private static final long serialVersionUID = 1L;
		private DatabaseConnection dbc = new DatabaseConnection();
		private String username;
		private String result;
		public String execute() throws Exception{
			String responseText=""; 
			HttpServletRequest request=ServletActionContext.getRequest();  
            username=request.getParameter("username");   
			String sql="SELECT COUNT(mid) FROM member WHERE mid='"+username+"'";
			ResultSet rs = dbc.executeQuery(sql);
				try {
			    	if (rs.next()) {
			    		if(rs.getInt(1)>0){			
			    			responseText="error"; 
							
						}else{
							responseText="success"; 
						}
			    		
			    	}
			    	HttpServletResponse response=ServletActionContext.getResponse();      
		            response.setContentType("text/html;charset=utf-8");   
		            PrintWriter out=response.getWriter();    
		            out.print(responseText);    
		            out.flush();    
		            out.close(); 
		    	} catch (SQLException e) {
			    	e.printStackTrace();
		    	}
				
			  
	            return null;
						
			}
		public String getResult() {
			  return result;
			 }
		}


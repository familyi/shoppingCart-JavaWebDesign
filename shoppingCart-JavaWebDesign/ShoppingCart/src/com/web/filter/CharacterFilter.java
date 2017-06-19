package com.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterFilter implements Filter{
	private String characterEncoding;
	private boolean enabled;
	public void init(FilterConfig config){
		characterEncoding=config.getInitParameter("encoding");
		enabled="true".equalsIgnoreCase(config.getInitParameter("using").trim());
		
	}
	public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain)throws IOException,ServletException{
		if(enabled||characterEncoding !=null){
			request.setCharacterEncoding(characterEncoding);
			response.setCharacterEncoding(characterEncoding);
		}
		response.getWriter().println(request.getParameter("username"));
		chain.doFilter(request, response);		//执行下一个Filter
	}
	public void destroy(){
		characterEncoding=null;		//销毁时清空资源
	}

}

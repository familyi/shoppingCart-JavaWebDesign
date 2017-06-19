package com.web.dbc;
import java.sql.*;
import javax.naming.*;
import javax.servlet.http.HttpServletRequest;
import javax.sql.*;
public class DatabaseConnection {
	Connection con = null;
	Statement stat = null;
	ResultSet rs = null;
	HttpServletRequest request;
	public DatabaseConnection()  {	
		 try {
				Class.forName("org.gjt.mm.mysql.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","");
				stat = con.createStatement();
			} catch (Exception e) {
				// TODO: handle exception
				con = null;
			}
		/*try{

			Context env = (Context)new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/DBpool"); //获取数据源
			con = ds.getConnection(); //获得连接对象conn
			System.out.println("数据库连接成功!");
			}catch (Exception e){
			System.out.println("数据库连接失败！");
			e.printStackTrace();
			}
	 */			
		 
	}

	public ResultSet executeQuery(String sql) {
		try {
			rs = stat.executeQuery(sql);
		} catch (Exception e) {
			// TODO: handle exception
			rs = null;
		}
		return rs;
	}
	
	public int executeUpdate(String sql) {
		try {
			stat.executeUpdate(sql);
			return 0;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
	public Connection getConnection(){
		return con ;
	}
}

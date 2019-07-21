package com.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCTool {
	
	
	static String name;
	static String user;
	static String password;
	static String url;
	static DataSource dataSource = null;
	
	
	
	static 
	{
		dataSource = new ComboPooledDataSource("helloC3P0"); 
	}
	
	public static Connection getConnection() throws Exception
	{
	
		return dataSource.getConnection();
	}
	
//	public static Connection getConnection() throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException, IOException{
//		Connection cnn=null;
//		
//
//			Properties info = new Properties();
//			InputStream in = JDBCTool.class.getClassLoader().getResourceAsStream("db.properties");
//			info.load(in);
//			name = info.getProperty("name");
//			user = info.getProperty("user");
//			password = info.getProperty("password");
//			url = info.getProperty("url");
//			Class.forName(name).newInstance();
//			cnn = DriverManager.getConnection(url, user, password);
//
//		return cnn;	
//	}
	
	public static void beginTransaction(Connection cnn)
	{
		if(cnn!=null)
		{
			try {
				cnn.setAutoCommit(false);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	public static void commit(Connection cnn)
	{
		if(cnn!=null)
		{
			try {
				cnn.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	public static void rollback(Connection cnn)
	{
		if(cnn!=null)
		{
			try {
				cnn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public static void close(ResultSet rs, Statement st,Connection cnn)
	{
		if(rs!=null)
		{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(st!=null)
		{
			try {
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(cnn!=null)
		{
			try {
				cnn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public ResultSet query(String sql) throws IllegalAccessException, ClassNotFoundException, SQLException, Exception
	{
		Connection cnn = null;
		cnn = getConnection();
		Statement st=null;
		ResultSet result=null;
		try {
			st = cnn.createStatement();
			result = st.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	
		}
	
	
}

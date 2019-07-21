package com.dao;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import com.utils.JDBCTool;

public class Dao {
	

	public  void update(String sql, Object ... args){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = JDBCTool.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			for(int i = 0; i < args.length; i++){
				preparedStatement.setObject(i + 1, args[i]);
			}
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCTool.close(null, preparedStatement, connection);
		}
	}
	public <T> T get(Class<T> clazz, String sql, Object... args) 
	{
		Connection cnn =null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		ResultSetMetaData  resultSetMetaData = null;
		
		T entity = null;
		
		try{
		//1.获取连接
		cnn = JDBCTool.getConnection();
		pst = cnn.prepareStatement(sql);
		//2.填充占位符
		for(int i = 0; i < args.length;i++)
		{
			pst.setObject(i+1, args[i]);
		}
		rs = pst.executeQuery();
	    Map<String, Object> values = new HashMap<String, Object>();
		//获得元数据
	    resultSetMetaData = rs.getMetaData();
		if(rs.next())
		{
			//循环列 
			for(int i = 0; i < resultSetMetaData.getColumnCount();i++)
			{
				String columnName = resultSetMetaData.getColumnLabel(i+1);
				Object columnValue = rs.getObject(i+1);
				values.put(columnName, columnValue);
			}
		}
		entity = clazz.newInstance();
		for(Map.Entry<String,Object> entry: values.entrySet())
		{
			String columnName = entry.getKey();
			Object value = entry.getValue();
			BeanUtils.setProperty(entity, columnName, value);
		}
		
	}catch (Exception e)
		{
			e.printStackTrace();
		}finally{
			JDBCTool.close(rs, pst, cnn);
		}
		return entity;
		
	}
	public <T> List<T> getForList(Class<T> clazz, String sql,Object...args) 
	{
		Connection cnn =null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		ResultSetMetaData  resultSetMetaData = null;
		
		T entity = null;
		List<T> list=new ArrayList<T>();
		try{
		//1.获取连接
		cnn = JDBCTool.getConnection();
		pst = cnn.prepareStatement(sql);
		//2.填充占位符
		for(int i = 0; i < args.length;i++)
		{
			pst.setObject(i+1, args[i]);
		}
		rs = pst.executeQuery();
	    Map<String, Object> values = null;
		List<Map<String,Object>> list_map = (List<Map<String, Object>>) new ArrayList<T>();
		resultSetMetaData = rs.getMetaData();
		while(rs.next())
		{
			values = new HashMap<String, Object>();
			for(int i = 0; i < resultSetMetaData.getColumnCount();i++)
			{
				String columnName = resultSetMetaData.getColumnLabel(i+1); //获取列名
				Object columnValue = rs.getObject(i+1);//获取字段值
				values.put(columnName, columnValue);
			}
			list_map.add(values);
		}
		if(list_map.size()> 0)
		{
			for(Map<String,Object> map:list_map){
				entity = clazz.newInstance();
				for(Map.Entry<String,Object> entry: map.entrySet())
				{
					String columnName = entry.getKey();
					Object value = entry.getValue();
					BeanUtils.setProperty(entity, columnName, value);
				}
				list.add(entity);
			}
			
		}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally
		{
			JDBCTool.close(rs, pst, cnn);
		}
		return list;
		
	}
	
	public <V> V getforValue(String sql,Object... args)
	{
		Connection cnn = null;
		PreparedStatement pst=null;
		ResultSet   rs = null;
		try
		{
		cnn = JDBCTool.getConnection();
		pst = cnn.prepareStatement(sql);
		
		for(int i = 0; i< args.length;i++)
		{
			pst.setObject(i+1, args[i]);
		}
	    rs = pst.executeQuery();

	    if(rs.next())
	    {
	    	return (V) rs.getObject(1);
	    }
	}catch(Exception e){
		e.printStackTrace();
	}finally
	{
		JDBCTool.close(rs, pst, cnn);
	}
		return null;

	}

}

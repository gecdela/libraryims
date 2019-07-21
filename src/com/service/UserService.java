package com.service;

import java.util.ArrayList;
import java.util.List;

import com.bean.User;
import com.dao.Dao;

public class UserService {
	
	
	private static  Dao dao = new Dao();
	

	public long login(String username,String password,String per)
	{
		String sql = "select count(*) from user where user_name = ? and password = ? and per = ?";
		long count = dao.getforValue(sql, username,password,per);
		if(count==0)
		{
			return 0;
		}
		return 1;
	}
	public User getUser(String username,String password,String per){
		User  user;
		String sql = "select user_id userid,user_name username,password,per from user where user_name = ? and password = ? and per=?";
		user = dao.get(User.class, sql,username,password,per);
		return user;
	}
	
	public List<User> getUserList()
	{
		List<User> user_list =new ArrayList<>();

		String sql="select user_id userid,user_name username,user_author userauthor,user_price userprice from user";
		user_list = dao.getForList(User.class, sql);
//		System.out.print(user_list);
		return user_list;
	}



	public void updateUser(User user) {
		// TODO Auto-generated method stub
		String sql = "update user set user_name = ?,tel = ?,email = ? where user_id=?";		
		dao.update(sql, user.getUsername(),user.getTel(),user.getEmail());
	}

	public void deleteUser(int userid) {
		// TODO Auto-generated method stub
		String sql = "delete from user where user_id =? ";
		
		dao.update(sql, userid);
		
	}

	public void addUser(User user) {
		// TODO Auto-generated method stub
		
		String sql = "insert into user(user_name,password,per,tel,email,head) values(?,?,?,?,?,?)";
		
		dao.update(sql, user.getUsername(),user.getPassword(),user.getPer(),user.getTel(),user.getEmail(),user.getHead());
	}
	public User getUser(int userid) {
		// TODO Auto-generated method stub
		User  user;
		String sql = "select user_id userid,user_name username,password,per,head,tel,email from user where user_id=?";
		user = dao.get(User.class, sql,userid);
		return user;
	}

}

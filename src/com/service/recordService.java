package com.service;

import java.util.List;

import com.bean.Record;
import com.dao.Dao;

public class recordService {
	static Dao dao = new Dao();
	
	public List<Record> getRecordList()
	{
		String sql="select record_id recordId, user_id userId, book_id bookId, start_date startDate, deadline from record";
		List<Record> record_list = dao.getForList(Record.class, sql);
		return record_list;
		
	}
	public void deleteRecord(int recordid) {
		// TODO Auto-generated method stub
		String sql="delete from record where record_id = ?";
		
		dao.update(sql, recordid);	
	}

	public void addRecord(Record record) {
		// TODO Auto-generated method stub
	String sql="insert into record(user_id,book_id,start_date,deadline) values(?,?,?,?)";
		
		dao.update(sql, record.getUserId(),record.getBookId(),record.getStartDate(),record.getDeadline());	
	}

}

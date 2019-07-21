package com.bean;

import java.util.Date;

public class Record {
	private int recordId;
	private int userId;
	private int bookId;
	private String startDate;
	private String deadline;
	public int getRecordId() {
		return recordId;
	}
	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	@Override
	public String toString() {
		return "Record [recordId=" + recordId + ", userId=" + userId
				+ ", bookId=" + bookId + ", startDate=" + startDate
				+ ", deadline=" + deadline + "]";
	}
	

	
}

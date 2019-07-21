package com.bean;

public class Book {
	private String bookname;
	private String bookprice;
	private String bookauthor;
	private String bookpicture;
	public String getBookpicture() {
		return bookpicture;
	}
	public void setBookpicture(String bookpicture) {
		this.bookpicture = bookpicture;
	}
	private int bookid;
	private int status;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBookprice() {
		return bookprice;
	}
	public void setBookprice(String bookprice) {
		this.bookprice = bookprice;
	}
	public String getBookauthor() {
		return bookauthor;
	}
	public void setBookauthor(String bookauthor) {
		this.bookauthor = bookauthor;
	}

	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Book [bookname=" + bookname + ", bookprice=" + bookprice
				+ ", bookauthor=" + bookauthor + ", bookpicture=" + bookpicture
				+ ", bookid=" + bookid + ", status=" + status + "]";
	}
}

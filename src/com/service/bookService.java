package com.service;

import java.util.ArrayList;
import java.util.List;

import com.bean.Book;
import com.dao.Dao;

public class bookService {

	static Dao dao = new Dao();
	public List<Book> getBookList()
	{
		List<Book> book_list =new ArrayList<>();

		String sql="select book_id bookid,book_name bookname,book_author bookauthor,book_price bookprice,book_pic bookpicture,status from book";
		book_list = dao.getForList(Book.class, sql);
//		System.out.print(book_list);
		return book_list;
	}

	public bookService() {
		// TODO Auto-generated constructor stub
	}

	public void updateBook(Book book) {
		// TODO Auto-generated method stub
		String sql="update book set book_name = ?,book_price = ?, book_author = ? ,book_pic =? ,status = ? where book_id = ?";
		
		dao.update(sql, book.getBookname(),book.getBookprice(),book.getBookauthor(),book.getBookpicture(),book.getStatus(),book.getBookid());
	}

	public void deleteBook(int bookid) {
		// TODO Auto-generated method stub
		String sql="delete from book where book_id = ?";
		
		dao.update(sql, bookid);
		
	}

	public void addBook(Book book) {
		// TODO Auto-generated method stub
		
		String sql="insert into book(book_name,book_author,book_price,book_pic,status) values(?,?,?,?,?)";
		System.out.print(book);
		dao.update(sql, book.getBookname(),book.getBookauthor(),book.getBookprice(),book.getBookpicture(),book.getStatus());
	}
	public Book getBook(int id) {
		String sql="select book_id bookid,book_name bookname,book_author bookauthor,book_price bookprice,book_pic bookpicture,status from book where book_id = ?";
		Book book = dao.get(Book.class, sql, id);
		System.out.println("≤È—Ø£∫"+book);
		return book;
	}
	public long getBookCount()
	{
		String sql="select count(*) from book";
		return dao.getforValue(sql);

	}

	public List<Book> getBookList(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		System.out.println("pageIndex="+pageIndex+"pageSize="+pageSize);
		List<Book> book_list =new ArrayList<>();
		String sql="select book_id bookid,book_name bookname,book_author bookauthor,book_price bookprice,book_pic bookpicture, status from book limit ? , ? ";
		book_list = dao.getForList(Book.class, sql, pageIndex, pageSize);
		System.out.print(book_list);
		return book_list;
	}
	
	

}

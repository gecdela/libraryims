package com.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Book;
import com.bean.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.UserService;
import com.service.bookService;

/**
 * Servlet implementation class bookServlet
 */
@WebServlet("/bookServlet")
public class bookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static bookService service = new bookService();
	static List<Book> book_list =new ArrayList<>();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String methodstr =request.getParameter("method");
		try {
			if(methodstr!=null&&!methodstr.equals(""))
			{
				Method method = getClass().getMethod(methodstr,HttpServletRequest.class,HttpServletResponse.class);
				method.invoke(this, request,response);
				book_list =  service.getBookList();
				request.setAttribute("book_list", book_list);
				System.out.print(book_list);
				request.getServletContext().getRequestDispatcher("/admin/bookManage.jsp").forward(request, response);
			}
			//�Ҳ�������ʱ�����
			else
			{
				book_list =  service.getBookList();
				request.setAttribute("book_list", book_list);
				request.getServletContext().getRequestDispatcher("/admin/bookManage.jsp").forward(request, response);
			}
			} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}
	
	/*
	 * ��ȡ����ͼ��
	 */
	public void all(HttpServletRequest request, HttpServletResponse response)
	{
		book_list =  service.getBookList();
		request.setAttribute("book_list", book_list);
	}
	public void add(HttpServletRequest request, HttpServletResponse response)
	{
		Book book = new Book();
		String bookname = request.getParameter("bookName");
		String bookauthor = request.getParameter("bookAuthor");
		String bookprice = request.getParameter("bookPrice");

		book.setBookname(bookname);
		book.setBookprice(bookprice);
		book.setStatus(1);//�ɽ�
		book.setBookauthor(bookauthor);
		book.setBookpicture("images/yuwen.png");
		service.addBook(book);
		System.out.println("����鼮��"+book);
	}
	/*
	 * ����id��ȡͼ��
	 */
	public void get(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Book book = new Book();
		int bookid=0;
		String bookidString = request.getParameter("bookId");
		if(bookidString!=null&&!bookidString.equals("")) bookid=Integer.parseInt(bookidString);
		book = service.getBook(bookid);
		request.setAttribute("book", book);
		request.getServletContext().getRequestDispatcher("/admin/editBook.jsp").forward(request, response);
		return;
	}
	/*
	 * ����ͼ��
	 */
	public void update(HttpServletRequest request, HttpServletResponse response)
	{
		Book book = new Book();
		int bookid=0;
		String bookidString = request.getParameter("bookId");
		if(bookidString!=null&&!bookidString.equals("")) bookid=Integer.parseInt(bookidString);
		int status=0;
		String bookstatusString = request.getParameter("bookstatus");
		if(bookidString!=null&&!bookidString.equals("")) status=Integer.parseInt(bookstatusString);
		String bookname = request.getParameter("bookName");
		String bookauthor = request.getParameter("bookAuthor");
		String bookprice = request.getParameter("bookPrice");
		book.setBookid(bookid);
		book.setBookname(bookname);
		book.setBookprice(bookprice);
		book.setBookauthor(bookauthor);
		book.setStatus(status);
		service.updateBook(book);
	}
	/*
	 * ɾ��ͼ��
	 */
	public void delete(HttpServletRequest request, HttpServletResponse response)
	{
		bookService service = new  bookService();
		int bookid=0;
		String bookidString = request.getParameter("bookId");
		System.out.println("ɾ���鼮��"+bookid);
		if(bookidString!=null&&!bookidString.equals("")) bookid=Integer.parseInt(bookidString);
		service.deleteBook(bookid);
	}
	
	public void init(HttpServletRequest request, HttpServletResponse response) throws IOException{
		long count = service.getBookCount();
		System.out.println(count);
		response.getWriter().print(count);
	}

	public void listBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			

		String pageIndexStr = request.getParameter("pageIndex");
		String pageSizeStr = request.getParameter("pageSize");
		int pageIndex=0;
		int pageSize=0;
		if(!pageSizeStr.equals("")&&pageSizeStr!=null&&!pageIndexStr.equals("")&&pageIndexStr!=null)
		{
			pageIndex = Integer.parseInt(pageIndexStr);
			System.out.println("pageIndex:"+pageIndex);
			pageSize = Integer.parseInt(pageSizeStr);
			pageIndex = (pageIndex-1)*pageSize;
			System.out.println("��"+((pageIndex/pageSize)+1)+"ҳ");
		}
		List<Book> book_list = service.getBookList();
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(book_list);
		System.out.println(result);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(result);
		
	}

	private bookService bookService() {
		// TODO Auto-generated method stub
		return null;
	}

}

package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Book;
import com.service.bookService;

/**
 * Servlet implementation class bookDetail
 */
@WebServlet("/bookDetail")
public class bookDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String bookIdStr = request.getParameter("bookid");
		int bookid=0;
		if(!bookIdStr.equals("")&&bookIdStr!=null) bookid = Integer.parseInt(bookIdStr);
		bookService service = new bookService();
		Book book = service.getBook(bookid);
		request.setAttribute("book", book);
		//
		request.getRequestDispatcher("/user/bookDetail.jsp").forward(request, response);
	}

}

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
public class UserIndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static bookService service = new bookService();
	static List<Book> book_list =new ArrayList<>();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserIndexServlet() {
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
			}
			} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
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
			System.out.println("ตฺ"+((pageIndex/pageSize)+1)+"าณ");
		}
		List<Book> book_list = service.getBookList(pageIndex,pageSize);
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(book_list);
		System.out.println(result);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(result);
		
	}


}

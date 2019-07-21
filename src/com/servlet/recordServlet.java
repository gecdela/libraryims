package com.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Record;
import com.bean.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.recordService;

/**
 * Servlet implementation class recordServlet
 */
@WebServlet("/recordServlet")
public class recordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	recordService service = new recordService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public recordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String methodstr =request.getParameter("method");
		try {
			if(!methodstr.equals("")&&methodstr!=null)
			{
				Method method = getClass().getMethod(methodstr, HttpServletRequest.class,HttpServletResponse.class);
				method.invoke(this, request,response);
			}
			} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void all(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		List<Record> record_list = service.getRecordList();
		record_list = service.getRecordList();
		System.out.println(record_list);
		ObjectMapper mapper = new ObjectMapper();
		String result_str = mapper.writeValueAsString(record_list);
		response.getWriter().print(result_str);
	}
	public void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		List<Record> record_list = service.getRecordList();
		record_list = service.getRecordList();
		System.out.println(record_list);
		ObjectMapper mapper = new ObjectMapper();
		String result_str = mapper.writeValueAsString(record_list);
		response.getWriter().print(result_str);
	}
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int recordid=0;
		String recordidString = request.getParameter("recordid");
		System.out.println("É¾³ý¼ÇÂ¼£º"+recordid);
		if(recordidString!=null&&!recordidString.equals("")) recordid=Integer.parseInt(recordidString);
		service.deleteRecord(recordid);
	}
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int userid=0;
		int bookid=0;
		Record record = new Record();
		String useridString = request.getParameter("userid");
		String bookidString = request.getParameter("bookid");	
//		String deadline = request.getParameter("deadline");
//		String startDate = request.getParameter("startDate");
//		User user= (User) request.getSession().getAttribute("user");
//		userid = user.getUserid();
		userid = 700033;
	    SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
	    String startDate = fmt.format(new Date());
		record.setBookId(bookid);
		record.setUserId(userid);
		record.setStartDate(startDate);
		record.setDeadline(startDate);
		System.out.println("Ìí¼Ó¼ÇÂ¼£º"+record);
		if(useridString!=null&&!useridString.equals("")) userid=Integer.parseInt(useridString);
		if(bookidString!=null&&!bookidString.equals("")) bookid=Integer.parseInt(bookidString);
		service.addRecord(record);
		response.sendRedirect(request.getServletContext().getContextPath()+"/user/userIndex.jsp");
	}
	

}

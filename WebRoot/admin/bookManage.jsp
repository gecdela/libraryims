<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"rel="stylesheet" />
	<script src="assets/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf8" src="assets/datatable/js/jquery.js"></script>
  </head>
  
  <body>
  <div class="table-responsive">
    <table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<td colspan="7"><a href="admin/addBook.jsp" target="innerFrame"><button type="button" class="btn btn-default"
						id="btn_add" data-toggle="modal" data-target="#addModal">
						<span class="glyphicon glyphicon-plus"></span>新增
					</button></a></td>
			</tr>
			<tr>
				<th>书籍ID</th>
				<th>书籍名</th>
				<th>作者</th>
				<th>价格</th>
				<th>状态</th>
				<th>操作</th>
				<th></th>
						
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${book_list}" var="book">
				<tr>
					<td>${book.getBookid()}</td>
					<td>${book.getBookname()}</td>
					<td>${book.getBookauthor()}</td>
					<td>${book.getBookprice()}</td>
					<c:if test="${book.getStatus()==1}">
					<td class="text-primary"><span class="glyphicon glyphicon-ok"></span>可借</td>	
					</c:if>
					<c:if test="${book.getStatus()==0}">
					<td class="text-warning"><span class="glyphicon glyphicon-remove"></span>已借</td>	
					</c:if>
					<td width="5%"><a href="servlet/bookServlet?method=delete&&bookId=${book.getBookid()}"><button type="button"
							class="btn btn-danger btn-sm" onClick="deleteInfo(this)">
							<span class="glyphicon glyphicon-remove"></span>删除
						</button></a></td>
					<td width="5%"><a href="servlet/bookServlet?method=get&&bookId=${book.getBookid()}" target="innerFrame"><button type="button"
							class="btn btn-primary btn-sm" id="btn_edit"
							onclick="editInfo(this)">
							<span class="glyphicon glyphicon-pencil"></span>编辑
						</button></a></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
  </body>
</html>

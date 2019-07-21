<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
<div class="container">

<div id="container">
<div class="row" style="height:80px;">
</div>
<div class="col-md-5 col-md-offset-4">
   <form class="bs-example bs-example-form" action="servlet/bookServlet?method=update"method="post"role="form">
             <h2 style="text-align:center">编辑图书</h2>
			<input type="hidden" class="form-control" value="${book.getBookid()}"name="bookId" />
						<div class="form-group">
							<div class="row">
								<label for="bookname" class="col-sm-2 control-label">书名</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" value="${book.getBookname() }" id="add_bname"
										name="bookName" placeholder="请输入书名">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<label for="bookauthor" class="col-sm-2 control-label">作者</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" value="${book.getBookauthor() }"
										id="add_bauthor" name="bookAuthor" placeholder="请输入作者">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<label for="price" class="col-sm-2 control-label">价格</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="add_bprice"
										name="bookPrice" value="${book.getBookprice()}"placeholder="请输价格">
								</div>
							</div>
						</div>
							<div class="form-group">
							<div class="row">
								<label for="price" class="col-sm-2 control-label">状态</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="add_bprice"
										name="bookstatus" value="${book.getStatus()}"placeholder="请输价格">
								</div>
							</div>
						</div>
						<div class="form-group">
						<div class="row">
						<div class="col-sm-offset-2 col-sm-4">
							<input type="submit" class="btn btn-default btn-block"">
						</div>
						<div class="col-sm-4">
							<a href="servlet/bookServlet?method=all"><button type="button" class="btn btn-primary btn-block">关闭</button></a>					
						</div>
						</div>
						</div>
					</form>              
       </div>  
    </div>
</div>   
<script src="assets/bootstrap-4.1.3-dist/js/jquery.min.js"></script>
<script src="assets/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
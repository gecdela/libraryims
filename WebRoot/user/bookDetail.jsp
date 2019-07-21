<%@ page language="java" import="java.util.*,com.bean.*,net.sf.json.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List<User> user_list = (List<User>)request.getAttribute("user_list");
JSONArray js= (JSONArray) request.getAttribute("json_array");
String Message="1212"; 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userManage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap-3.3.5--dist/js/bootstrap.min.js"></script>
  </head>
  
  <body>
<h4>借书</h4>

<div class="container">
<div class="row">
<div class="col-md-offset-1 col-md-2">
<img alt="" src="${book.bookpicture }">
</div>
<div class="col-md-offset-1 col-md-6">
<form class="form" action="servlet/recordServlet?method=add"method="post">
<div class="form-group">
<div class="row">
<label for="id" class="col-sm-3">图书编号</label>
<div class="col-sm-6">
<input type="text" class="form-control"value="${book.bookid }" name="bookid"disabled/>
</div>
</div>
</div>

<div class="form-group">
<div class="row">
<label for="id" class="col-sm-3">图书名称</label>
<div class="col-sm-6">
<input type="text" class="form-control"value="${book.bookname }"disabled/>
</div>
</div>
</div>
<div class="form-group">
<div class="row">
<label for="id" class="col-sm-3">图书作者</label>
<div class="col-sm-6">
<input type="text" class="form-control"value="${book.bookauthor }"disabled/>
</div>
</div>
</div>

<div class="form-group">
<div class="row">
<label for="id" class="col-sm-3">图书价格</label>
<div class="col-sm-6">
<input type="text" class="form-control"value="${book.bookprice }"disabled/>
</div>
</div>
</div>

<div class="form-group">
<div class="row">
<label for="id" class="col-sm-3">图书状态</label>
<div class="col-sm-6">
<input type="text" class="form-control"value="可借" disabled/>
</div>
</div>
</div>
<div class="form-group">
<div class="row">
<label for="id" class="col-sm-3">借书时间段</label>
<div class="col-sm-6">
<input type="text" class="form-control" value="2018-09-23---2018-10-23"/>
</div>
</div>
</div>
					<div class="row">
						<div class="col-md-offset-1 col-md-3">
						<input type="submit" class="btn btn-primary btn-block " value="借书"/>
						</div>
							<div class="col-md-3">
								<a href="user/userIndex.jsp"><button type="button" class="btn btn-warning btn-block " value="返回">返回</button></a>
							</div>
						</div>
<!-- <div class="form-group">
<div class="row">
<div class="col-sm-offset-4 col-sm-6">
<button class="btn btn-primary" onClick="returnBack()">确定</button>
<button class="btn btn-warning">取消</button>
</div>
</div>
</div> -->
</form>
</div>
</div>

</div>

<script>
function returnBack()
{
$().ready(function(){
	window.location("/user/userIndex.jsp");
});

}

</script>
</body>
</html>

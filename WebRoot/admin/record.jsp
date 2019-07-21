 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'record.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link type="text/css" rel="stylesheet" href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"/>

    <script type="text/javascript" src="assets/jquery/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="assets/js/jqPaginator.js"></script>
    <script src="assets/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
  </head>
  
  <body>
<div class="container">
<div class="row">
<ul class="breadcrumb">
<li><a>首页</a></li>
<li class="active"><a>借阅管理</a></li>
</ul>
</div>
<div class="row">
  <table class="table table-striped table-bordered table-hover">
  <thead>
  <tr>
  	<th>记录ID</th>
  	<th>用户ID</th>
  	<th>书籍ID</th>
  	<th>起始时间</th> 
  	<th>截止时间</th> 
	<th colspan="2">操作</th>
  </tr>
  </thead>
  <tbody id="plansItemList">
  </tbody>
  </table>
</div>
<div class="row">
<div class="col-md-offset-4">
     <ul class="pagination jq-pagination" id="pagination"> </ul>
     </div>
</div>

<div class="row"></div>
	<!--  删除模态框-->
	<div class="modal" id="deleteModal">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<h4>确定删除该条信息吗？</h4>
					<button type="button" class="close" data-dismiss="modal">x</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-default" onClick="delInfo()">
					<button class="btn btn-primary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
</div>
    
<script type="text/javascript">
init();
$.jqPaginator("#pagination",{
	totalPages:3,
	visiblePages:5,
	currentPage: 1,
	first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
    prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
    next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
    last: '<li class="last"><a href="javascript:void(0);">末页</a></li>',
    page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
    onPageChange:function(num,type){
    	search(num);
    },
});

    function search(num)
    {
		$.ajax({
			url:"servlet/recordServlet?method=all",
			dataType:"json",
			type:"post",
			success:function(data)
			{

				
			}
		});
    }
    function init()
    {
		$.ajax({
			url:"servlet/recordServlet?method=all",
			dataType:"json",
			type:"post",
			success:function(data)
			{
				var str='';
				for(var i = 0; i < data.length;i++)
				{
					str+='<tr><td>'+data[i].recordId+'</td>';
					str+='<td>'+data[i].userId+'</td>';
					str+='<td>'+data[i].bookId+'</td>';
					str+='<td>'+data[i].startDate+'</td>';	
					str+='<td>'+data[i].deadline+'</td>';	
					str+='<td width="5%"><a href="servlet/recordServlet?method=update&&bookId="',
					str+=data[i].recordId+'"><button type="button" class="btn btn-primary btn-sm" id="btn_edit" onclick="editInfo(this)"><span class="glyphicon glyphicon-pencil"></span>编辑</button></a></td>';	
					str+='<td width="5%"><button type="button" class="btn btn-danger btn-sm" id="btn_edit" onclick="deleteModal(this)"><span class="glyphicon glyphicon-remove"></span>删除</button></td></tr>';																				
				}
				$("#plansItemList").html(str);
			}
		});
    }
</script>
<script type="text/javascript">
	var recordid = 0;
 function deleteModal(obj)
    {
    	var tds= $(obj).parent().parent().find("td");
    	 recordid = tds.eq(0).text();	
    	$("#deleteModal").modal("show");
    	
    }	
	function delInfo()
    {
    	$.ajax({
    	type:"post",
    	url:"servlet/recordServlet?method=delete",
    	data:"recordid="+recordid,
    	dataType:"html",
    	contentType:"application/x-www-form-urlencoded; charset=utf-8",
    	success: function(result) {  
	            location.reload();  
	        }  
    	});
    	$("#deleteModal").modal("hide");
    	    	
    }
</script>
  </body>
</html>

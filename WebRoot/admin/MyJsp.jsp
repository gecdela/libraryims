<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- DataTables CSS -->
<link href="assets/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Custom Styles-->
<!-- Bootstrap Styles-->
<!--     <link href="assets/css/bootstrap.css" rel="stylesheet" /> -->
<!-- FontAwesome Styles-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="assets/datatable/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="assets/datatable/js/jquery.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8"src="assets/datatable/js/jquery.dataTables.js"></script>
<script src="assets/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="assets/js/myjs.js"></script>
<script src="assets/jquery-validation-1.17.0/dist/jquery.validate.min.js"></script>
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
  <table id="book_table" class="table table-striped table-bordered table-hover">
  <thead>
  
  <tr>
  	<th>记录ID</th>
  	<th>用户ID</th>
  	<th>书籍ID</th>
  	<th>起始时间</th> 
  	<th>截止时间</th> 
	<th>操作</th>
	<th></th>
  </tr>
  </thead>
  <tbody id="plansItemList">
  </tbody>
  </table>
</div>
<!-- <div class="row">
<div class="col-md-offset-4">
     <ul class="pagination jq-pagination" id="pagination"> </ul>
     </div>
</div> -->

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
   var dataset = 0;

    function init()
    {
		$.ajax({
			url:"servlet/recordServlet?method=all",
			dataType:"json",
			type:"post",
			success:function(data)
			{
				dataset = data;
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

    $(document).ready( function () {
         init();
  var eventFired = function(type) {
/*         var n = $('#demo_info')[0];
        n.innerHTML += '<div>' + type + ' 事件- ' + new Date().getTime() + '</div>';
        n.scrollTop = n.scrollHeight; */
    }  
    $("#book_table").on('order.dt',function(){eventFired("排序");}).on('page.dt',function(){eventFired("翻页");}).DataTable({
    	//data:dataset,//数据集

    	pagingType:"full_numbers",//分页样式
    	scrollY:false,//滚动条长度
    	scrollX: false,//指定是否开启横向滚动条
    	scrollCollapse:"true",
    	stateSave:true,//保存状态
    	paging:true,//是否分页
    	ordering:true, //是否排序
    	info:true, //是否显示页面信息
		columnDefs:[
/*		    {
				target:[1],
				orderData:[0,1],
		    },*/
		    {
		    	targets:[3],
		    	visible: false,
		    	searchable: false
		    }
		    ],
    	decimal:",",	//指定数字显示格式
    	thousands:".",
    	language:{
                 "lengthMenu": "每页 _MENU_ 条记录",
                 "zeroRecords": "没有找到记录",
                 "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                 "infoEmpty": "无记录",
                 "infoFiltered": "(从 _MAX_ 条记录过滤)"
             },
		order:[[0,"asc"]], //默认排序列和排序方式
		 lengthMenu: [[8, 10, 12, -1], [8, 10, 12, "All"]], //指定每页显示的长度
		 processing: true,
		 columns: [
		    null,
		    null,
		    null,
		    null,
		    null,
		    { "orderable": false },
		    { "orderable": false },		    
		  ]
		}
        );
    
});	
   
    
    </script>
  </body>
</html>

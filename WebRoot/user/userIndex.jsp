<%@ page language="java" import="java.util.*,com.bean.*,net.sf.json.*"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List<Book> book_list = (List<Book>)request.getAttribute("book_list");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
<script type="text/javascript" src="assets/js/jqPaginator.js"></script>
<style>
.error {
	color: red;
}
</style>
</head>
<body>

<div class="container">
<div class="row">
<ul class="breadcrumb">
<li><a>首页</a></li>
<li class="active"><a>用户首页</a></li>
</ul>
</div>
<div id="plansItemList" class="row">  </div>

<div class="text-center margin-top-20">
     <ul class="pagination jq-pagination" id="pagination"> </ul>
</div>
</div>
<script type="text/javascript">


	var total = 0;
    	init();
    $.jqPaginator('#pagination', {
    	totalPages:1,
        visiblePages: 5,
        currentPage: 1,
    first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
    prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
    next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
    last: '<li class="last"><a href="javascript:void(0);">末页</a></li>',
    page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
    	
        onPageChange: function (num, type) {
            search(num);
        },
    });

    function init(){
	    $.ajax({
	    url:"servlet/UserIndexServlet?method=init",
	    type:"post",
	    success:function(data)
		    {
		        total = data;
		        total= Math.ceil(total/6);
		    	$('#pagination').jqPaginator('option', {
                    totalPages: total //总页数
                });
		    },
	    });
    }
    //分页搜索
    function search(pageIndex){
    $.ajax({ url :"servlet/UserIndexServlet?method=listBook",
        type : "post",
        dataType : "json",
        data:"pageIndex="+pageIndex+"&&pageSize=6",
        success : function(datas) {
            var str='';
            if(datas.length>0){
                for(var i=0;i<datas.length;i++){ 
                str+='<div class="col-sm-4"><a href="servlet/bookDetail?bookid='+datas[i].bookid+'"><div class="thumbnail"><img src="'+datas[i].bookpicture+'"alt="通用的占位符缩略图"><div class="caption"><h3>'+datas[i].bookname+'</h3></div></div></a></div>';                                                         
                if(i!=0&&(i+1)%3==0)
                {
                	str+='</br></br></br></br>';
                }
                }
                $("#plansItemList").html(str);
            }else{
                $("#plansItemList").html("暂无数据……");
/*                 $('#pagination').jqPaginator('option', {
                    totalPages: 1
                }); */
            }
        },
        error:function () {
            layer.msg('<i class="icon-volume-1"></i>&nbsp;获取数据失败！');
        }
    });
}   

</script>
</body>
</html>

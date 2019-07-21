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
<link href="assets/bootstrap-4.1.3-dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
  </head>
  
  <body>
      <button type="button" class="btn btn-default" id="btn_add" data-toggle="modal"data-target="#addModal">新增</button>
  <div class="table-responsive">
    <table class="table table-striped table-bordered table-hover">
    <thead>
	    <tr>
	    <th>用户ID</th>
	    <th>用户名</th>
	    <th>角色</th>
	    <th>电话</th>
	    <th>邮箱</th>
	    <th colspan="2">操作</th>    
	    </tr>
    </thead>
    <tbody>
    <c:forEach items="${user_list}" var="user">
  	    	<tr>
  	    	<td hide>${user.getUserid()}</td>
	    	<td>${user.getUsername()}</td>
	    	<c:if test="${user.getPer()=='0'}">
	    	<td>管理员</td>
	    	</c:if>
	    	<c:if test="${user.getPer()=='1'}">
	    	<td>普通用户</td>
	    	</c:if>
	        <td>${user.getTel()}</td>	
	    	<td>${user.getEmail()}</td>	
	         <td><button type="button"class="btn btn-danger btn-sm" onClick="deleteInfo(this)">删除</button></td>	
	         <td><button type="button" class="btn btn-primary btn-sm" id="btn_edit" onclick="editInfo(this)">
查看
</button></td>		             	
	    	</tr>  
    </c:forEach>
    <div class="modal fade"id="addModal">
 <div class="modal-dialog modal-md">
 <div class="modal-content">
 <div class="modal-header">
 <h4>添加信息</h4>
 <button type="button" class="close" data-dismiss="modal" >x</button>
 </div>
 <div class="modal-body">
	<form class="form-horizontal" id="add_form" >
	  <div class="form-group">
	  <div class="row">
	    <label for="username" class="col-sm-2 control-label">用户名</label>
	    <div class="col-sm-6">
	      <input type="text" class="form-control" value="" id="add_name" placeholder="请输入用户名">
	    </div>
	   </div>
	  </div>
	  	  <div class="form-group">
	  <div class="row">
	    <label for="password" class="col-sm-2 control-label">密码</label>
	    <div class="col-sm-6">
	      <input type="password" class="form-control" value="" id="add_password" placeholder="请输入密码">
	    </div>
	   </div>
	  </div>
	               <div class="form-group">
	                <div class="row"> 
                  <label for=""class="col-sm-2 control-label">角色</label> 
                   <div class="col-sm-6">
                   <select class="form-control" name="s_per" id="sel1">    
			        <option value="">=====请选择=====</option>
			        <option value="0">超级管理员</option>
			        <option value="1">普通用户</option>

      			</select>
                   </div>
      			</div>
      			</div>
      			
	  <div class="form-group">
	  <div class="row">
	    <label for="tel" class="col-sm-2 control-label">电话</label>
	    <div class="col-sm-6">
	      <input type="text" class="form-control" id="add_tel" placeholder="请输入电话">
	    </div>

	  </div>
	  </div>
	  <div class="form-group">
	        <div class="row">
	    <label for="permit" class="col-sm-2 control-label">邮箱</label>
	    <div class="col-sm-6">
	    	 <input type="text" class="form-control" id="add_email"placeholder="请输入邮箱">

	    </div>
	  </div>
	  </div>
	</form>

 </div>
 <div class="modal-footer">
    <button type="button" class="btn btn-default"  onClick="addInfo()">保存</button>
  <button type="button" class="btn btn-primary" data-dismiss="modal" >关闭</button>
 </div>
</div>
 </div>
 </div>
    
    
    <!-- 按钮：用于打开模态框 -->

 <div class="modal fade"id="editModal">
 <div class="modal-dialog modal-md">
 <div class="modal-content">
 <div class="modal-header">
 <h4>查看信息</h4>
 <button type="button" class="close" data-dismiss="modal" >x</button>
 </div>
 <div class="modal-body">
	<form class="form-horizontal" id="edit_form"role="form">
	  	  <div class="form-group">
	        <div class="row">
	    <label for="ID" class="col-sm-2 control-label">ID</label>
	    <div class="col-sm-8">
	    	 <input type="text" class="form-control" id="edit_id" disabled>
	    </div>
	  </div>
	  </div>
	  <div class="form-group">
	  <div class="row">
	    <label for="username" class="col-sm-2 control-label">用户名</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" value="" id="edit_name" placeholder="请输入名字">
	    </div>

	   </div>
	  </div>
	  <div class="form-group">
	  <div class="row">
	    <label for="tel" class="col-sm-2 control-label">电话</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="edit_tel" placeholder="请输入电话">
	    </div>
	  </div>
	  </div>
	  <div class="form-group">
	        <div class="row">
	    <label for="permit" class="col-sm-2 control-label">邮箱</label>
	    <div class="col-sm-8">
	    	 <input type="text" class="form-control" id="edit_email">
	    </div>
	  </div>
	  </div>
	  <div class="form-group">
	        <div class="row">
	    <label for="permit" class="col-sm-2 control-label">角色</label>
	    <div class="col-sm-8">
	    	 <input type="text" class="form-control" id="edit_per" disabled>

	    </div>
	  </div>
	  </div>
	</form>

 </div>
 <div class="modal-footer">
    <button type="button" class="btn btn-default"  onClick="return update()">保存</button>
  <button type="button" class="btn btn-primary" data-dismiss="modal" >关闭</button>
 </div>
</div>
 </div>
 </div>
 <div class="modal" id="deleteModal">
 <div class="modal-dialog modal-md">
<div class="modal-content">
<div class="modal-header">
<h4>确定删除该条信息吗？</h4>
<button type="button" class="close" data-dismiss="modal" >x</button>
</div>
<div class="modal-body">

</div>
<div class="modal-footer">
	<button class="btn btn-default" onClick="del()">确定</button>
		<button class="btn btn-primary" data-dismiss="modal">取消</button>
</div>
</div>
</div>
</div>
    </tbody>  
    </table>
      </div>

<script>
function addInfo() {  
	    //获取模态框数据  
	    var username = $("#add_name").val(); 
	    var password = $("#add_password").val();  	     
	    var tel = $("#add_tel").val();  
	    var email = $("#add_email").val();  
		var selectedIndex=$("#sel1 ").get(0).selectedIndex - 1; 
	if(username=="")
	{
		alert(checkIndex);
	}
		if(tel=="")
	{
		alert("不能为空");
	}
	var per=0;
	if(selectedIndex==0)
	{
	per="0";
	}
	else per ="1";

	    $.ajax({  
	        type: "post",  
    		url:"servlet/userServlet?method=add", 
	        data: "username=" + username +"&password="+password+"&per="+per+ "&tel=" + tel+"&email="+email,  
	        dataType: "html",  
	        contentType: "application/x-www-form-urlencoded;charset=utf-8",  
	        success: function(result) {  
	            location.reload();  
	        }  
	    }); 
		$("#addModal").modal("hide");
    }

function editInfo(obj)
{
var tds = $(obj).parent().parent().find("td");
var name = $(this).parent().prev().text();
/* 		$("#edit_name_message").hide()
		$("#edit_tel_message").hide()
		$("#edit_email_message").hide()	 */			
		$("#edit_id").val(tds.eq(0).text());
		$("#edit_name").val(tds.eq(1).text());
		$("#edit_per").val(tds.eq(2).text()); 
	    $("#edit_tel").val(tds.eq(3).text());
	    $("#edit_email").val(tds.eq(4).text()); 
        $("#editModal").modal("show");
}

    
function update() {  
	    var username = $("#edit_name").val();  
	    var tel = $("#edit_tel").val();
	    var email = $("#edit_email").val(); 	      
	    var userid = $("#edit_id").val();
/* 
	if(username=="")
	{
		var span = $("<p id='is_name_empty'><p>").text("*用户名不能为空!");
		$("#edit_name_message").append(span);
		$("#edit_name_message").show();
		return false;  
	}
	if(tel=="")
	{
		var span = $("<p><p>").text("*电话不能为空!");
		$("#edit_tel_message").append(span);
		$("#edit_tel_message").show();
		return false;  
	}
	if(email=="")
	{
		var span = $("<p><p>").text("*邮箱不能为空!");
		$("#edit_email_message").append(span);
		$("#edit_email_message").show();
		return false;  
	} */
	    $.ajax({  
	        type: "post",  
    		url:"servlet/userServlet?method=update", 
	        data: "username=" + username + "&tel=" + tel+"&userid="+userid+"&email="+email,  
	        dataType: 'html',  
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
	        success: function(result) {  
	            location.reload();  
	        }  
	    }); 
		$("#editModal").modal("hide");
    }
    var userid=0;
    function deleteInfo(obj)
    {
    	var tds= $(obj).parent().parent().find("td");
    	 userid = tds.eq(0).text(); 	      	    	    	      	 	    	    	
    	$("#deleteModal").modal("show");
    	
    }
    function del()
    {
    	$.ajax({
    	type:"post",
    	url:"servlet/userServlet?method=delete",
    	data:"userid="+userid,
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

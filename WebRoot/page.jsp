<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'page.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
//表格
<div class="box-body">
<table id="lawtable"></table>
</div>
//分页
<div class="col-lg-10" style="position: relative;magin:0px auto;text-align: center;">
<ul class="pagination" id="pagelaw">
<span>跳转到</span>
</ul> <div class="pageJump">
<span>页</span>
<input type="text" style="border-radius: 5px;width: 45px;height: 20px">
<span style="margin-left: 20px;">共计:<span id="totallawNum"></span>条</span>
<button type="button" class="button" style="position: relative;margin-top:0px;padding-top: 5px;height: 30.4px;border-radius: 5px;color: #3c8dbc;font-size: 14px;" onClick="getSendMessageInfo()">确定</button> </div>
</div>

<script type="text/javascript" src="assets/js/jquery-1.10.2.js" ></script>
<!-- <script type="text/javascript">
$(document).ready(function(){
$(".button").click(function(){
    $.post("servlet/pageServlet",function(data,status){
        alert("Data: " + data + "nStatus: " + status);
    },"JSON");
    });
});
</script> -->
<script type="text/javascript">
function getSendMessageInfo() {    //初始化首页显示                                                                        
 var paramObj = {
        "pageNum":"1",
        "pageSize":"10"
    };
                    
    //法律信息
    $.ajax({
        url:  'servlet/pageServlet',
        type: 'POST',
        dataType: 'json',
        contentType: "application/json",
        async: false,
        data: JSON.stringify(paramObj),
        success: function (result) {
          /*   if (result.code=='666'){ */
                 if (result.data.list.length>0){
                     addLawInfo(result.data.list);//添加数据
                     changepagelaw(result.data.total,result.data.pages)//分页显示（总条数，总页数）
                 /* } */
            }else {
                alert("出现未知错误")
            }
        },
        
        error: function (XMLHttpRequest, textStatus) {
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        }
    })

}
/*分页*/
function changepagelaw(total,page) {
  
    $("#totallawNum").html(total)
    Page({
        num:page,               //页码数
        startnum:1,            //指定页码
        elem:$('#pagelaw'),     //指定的元素
        callback:function(n){  //回调函数 n为number类型所以需要转为String类型
            var pageNum = n.toString()
            getSendMessageInfo2(pageNum);
        }
    });
}
</script>
  </body>
</html>

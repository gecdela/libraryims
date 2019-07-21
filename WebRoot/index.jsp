<%@ page language="java" import="java.util.*,com.bean.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user =(User) session.getAttribute("user");
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
<!--      Bootstrap Styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
<!--         FontAwesome Styles -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
<!--         Custom Styles -->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
  </head>
  <body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp"><i class="fa fa-comments"></i> <strong>图书管理系统 </strong></a>
            </div>
        <ul class="nav navbar-nav navbar-right"> 
        	<c:if test="${user.getUsername()==NULL}">
	            <li><a href="user/register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li> 
	            <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li> 
            </c:if>
			<c:if test="${user.getUsername()!=NULL}">
	            <li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                     <span class="glyphicon glyphicon-user"></span>${user.getUsername()}<b class="caret"></b>
	                </a>
	                <ul class="dropdown-menu">
	                    <li><a href="servlet/userPageServlet?userid=${user.getUserid()}" target="innerFrame"><i class="fa fa-user fa-fw"></i>个人中心</a></li>
	                    <li class="divider"></li>
	                    <li><a href="servlet/loginServlet?method==logout"><i class="fa fa-sign-out fa-fw"></i>退出</a></li>
	                </ul>
	            </li>
	           <li><a href="servlet/logoutServlet?method==logout"><span class="glyphicon glyphicon-log-in"></span> 退出</a></li> 
            </c:if>
        </ul>
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
		<div id="sideNav" href=""><i class="fa fa-caret-right"></i></div>
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="active">
                        <a class="active-menu" href="index.jsp"><i class="fa fa-dashboard"></i> 首页</a>
                    </li>
                    <li>
                        <a href="servlet/bookServlet?method=all" target="innerFrame"><i class="fa fa-desktop"></i>书籍管理</a>
                    </li>
                     <li>
                        <a href="admin/record.jsp" target="innerFrame"><i class="fa fa-desktop"></i>借阅管理</a>
                    </li>
                        <li>
                        <a href="user/userIndex.jsp" target="innerFrame"><i class="fa fa-desktop"></i>用户首页</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
    			<iframe scrolling= "no" width="1000px" height="780px"src="servlet/bookServlet?method=all" class="innerFrame" name="innerFrame"></iframe>
                </div>
                </div>
            </div>
        </div>
    </div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>

</body>
</html>

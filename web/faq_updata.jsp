<%@include file="vail1.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Category" %><%--
  Created by IntelliJ IDEA.
  User: oo
  Date: 2021/6/8
  Time: 2:16 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%String webroot=request.getContextPath()+"/";
//    System.out.println(webroot);
%>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>tobyblog |分类管理</title>

    <link href="<%=webroot%>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=webroot%>font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="<%=webroot%>css/animate.css" rel="stylesheet">
    <link href="<%=webroot%>css/style.css" rel="stylesheet">

</head>

<body>

<div id="wrapper">



    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                                <img alt="image" class="img-circle" src="<%=webroot%>img/profile_small.jpg" />
                                 </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="dashboard_2.html#">
                                <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">toby</strong>
                                 </span> <span class="text-muted text-xs block">其他 <b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="profile.html">Profile</a></li>
                            <li><a href="contacts.html">Contacts</a></li>
                            <li><a href="mailbox.html">Mailbox</a></li>
                            <li class="divider"></li>
                            <li><a href="<%=webroot%>/login">退出</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        IN+
                    </div>
                </li>

                <li>
                    <a href="<%=webroot%>admin"><i class="fa fa-diamond"></i> <span class="nav-label">主页</span></a>
                </li>

                <li>
                    <a href="<%=webroot%>admin/faq"><i class="fa fa-envelope"></i> <span class="nav-label">分类管理 </span></a>
                </li>

                <li>
                    <a href="<%=webroot%>admin/blog"><i class="fa fa-edit"></i> <span class="nav-label">文章管理</span></a>

                </li>

            </ul>

        </div>
    </nav>

    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top  " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="faq.html#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="请输入搜索内容" class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message">欢迎来到我的博客</span>
                    </li>


                    <li>
                        <a href="<%=webroot%>login">
                            <i class="fa fa-sign-out"></i> 退出
                        </a>
                    </li>

                </ul>


            </nav>
        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-4">
                <h2>分类管理</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="<%=webroot%>dashboard_2.html">主页</a>
                    </li>
                    <li class="active">
                        <strong>修改分类</strong>
                    </li>
                </ol>
            </div>
            <div class="col-sm-8">
                <div class="title-action">

                </div>
            </div>
        </div>
        <div class="row">
                <div class="col-lg-12">
                    <div class="wrapper wrapper-content animated fadeInRight">

                        <div class="ibox-content m-b-sm border-bottom">
                            <div class="text-center p-lg">
                                <%String error= (String) request.getAttribute("error");
                                    if (error !=null && !"".equals(error)){
                                %>
                                <h3 style="color: red"><%=error%></h3>
                                <%}%>
                                <form method="POST" action="faq">
                                    <div class="input-group">
                                        <%Category category= (Category) request.getAttribute("category");%>
                                        <input name="id" value="<%=category.getId()%>" style="display: none">
                                        <input name="title" type="text" placeholder="<%=category.getTitle()%>" name="class_fil" class="form-control input-lg">
                                        <div class="input-group-btn">
                                            <button class="btn btn-lg btn-primary" type="submit" name="action" value="updata_emp">
                                                修改分类名称
                                            </button>
                                            <!-- <button title="Create new cluster" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> <span class="bold">添加分类</span></button>  -->

                                        </div>
                                    </div>
                                    <a href="faq">
                                        <button  class="btn  btn-primary" type="submit" style="margin-top: 30px;">
                                            返回
                                        </button>
                                    </a>

                                </form>
                            </div>
                        </div>

                    </div>
            </div>
        </div>
        <div class="footer">

            <div>
                <strong>toby</strong> myblog &copy; 2020-2021
            </div>
        </div>

    </div>
</div>

<!-- Mainly scripts -->
<script src="<%=webroot%>js/jquery-2.1.1.js"></script>
<script src="<%=webroot%>js/bootstrap.min.js"></script>
<script src="<%=webroot%>js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=webroot%>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="<%=webroot%>js/inspinia.js"></script>
<script src="<%=webroot%>js/plugins/pace/pace.min.js"></script>

<script>
    $(document).ready(function(){

        $('#loading-example-btn').click(function () {
            btn = $(this);
            simpleLoad(btn, true)

            // Ajax example
//                $.ajax().always(function () {
//                    simpleLoad($(this), false)
//                });

            simpleLoad(btn, false)
        });
    });

    function simpleLoad(btn, state) {
        if (state) {
            btn.children().addClass('fa-spin');
            btn.contents().last().replaceWith(" Loading");
        } else {
            setTimeout(function () {
                btn.children().removeClass('fa-spin');
                btn.contents().last().replaceWith(" Refresh");
            }, 2000);
        }
    }
</script>
</body>

</html>

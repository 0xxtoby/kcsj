<%@include file="vail1.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.PostDao" %>
<%@ page import="bean.Category" %>
<%@ page import="dao.CategoryDao" %><%--
  Created by IntelliJ IDEA.
  User: oo
  Date: 2021/6/10
  Time: 5:18 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%String webroot=request.getContextPath()+"/";
//    System.out.println(webroot);
%>
<html>
<%List<Post> posts=new ArrayList<Post>();
    PostDao postDao=new PostDao();
    String p_classString= (String) request.getAttribute("p_class");
    int p_class= Integer.parseInt(p_classString);
    String cat_id_str= (String) request.getAttribute("cat_id");

    if (cat_id_str.equals("-1")) {
        posts = postDao.getAll(p_class);
    }
    else {

        posts=postDao.getAll(p_class, Integer.parseInt(cat_id_str));
    }


%>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>tobyblog| blogbox</title>

    <link href="<%=webroot%>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=webroot%>font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%=webroot%>css/plugins/iCheck/custom.css" rel="stylesheet">
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
            <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="mailbox.html#"><i class="fa fa-bars"></i> </a>
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
                        <a href="<%=webroot%>/login">
                            <i class="fa fa-sign-out"></i> 退出
                        </a>
                    </li>

                </ul>

            </nav>
        </div>

        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-3">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content mailbox-content">
                            <div class="file-manager">
                                <a class="btn btn-block btn-primary compose-mail" href="blog_compose">新建博客</a>
                                <div class="space-25"></div>
                                <h5>文件夹</h5>
                                <ul class="folder-list m-b-md" style="padding: 0">
                                    <li><a href="blog?action=blog"> <i class="fa fa-inbox "></i> 博客 <span class="label label-warning pull-right"><%=postDao.getLen(1)%></span> </a></li>

                                    <li><a href="blog?action=draft"> <i class="fa fa-file-text-o"></i> 草稿<span class="label label-danger pull-right"><%=postDao.getLen(2)%></span></a></li>
                                    <li><a href="blog?action=deldata"> <i class="fa fa-trash-o"></i> 回收站</a></li>
                                </ul>
                                <h5>类型</h5>
                                <ul class="category-list" style="padding: 0">
                                    <%List<Category> categories=new ArrayList<Category>();
                                        CategoryDao categoryDao=new CategoryDao();
                                        categories=categoryDao.get_categorys();
                                        for (Category category:categories){
                                    %>
                                    <li><a href="blog?cat_id=<%=category.getId()%>"> <i class="fa fa-circle text-navy"></i> <%=category.getTitle()%></a></li>
                                    <%}%>
<%--                                    <li><a href="mailbox.html#"> <i class="fa fa-circle text-danger"></i> Documents</a></li>--%>
<%--                                    <li><a href="mailbox.html#"> <i class="fa fa-circle text-primary"></i> Social</a></li>--%>
<%--                                    <li><a href="mailbox.html#"> <i class="fa fa-circle text-info"></i> Advertising</a></li>--%>
<%--                                    <li><a href="mailbox.html#"> <i class="fa fa-circle text-warning"></i> Clients</a></li>--%>
                                </ul>


                                <div class="clearfix"></div>

                            </div>
                        </div>
                    </div>
                </div>
                <form  method="post" action="blog">
                <div class="col-lg-9 animated fadeInRight">
                    <div class="mail-box-header">

<%--                        <form method="get" action="index.html" class="pull-right mail-search">--%>
                            <div class="input-group">
                                <input type="text" class="form-control input-sm" name="search" placeholder="搜索博客">
                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-sm btn-primary">
                                        搜索
                                    </button>
                                </div>
                            </div>
<%--                        </form>--%>
                        <h2>
<%--                            博客 (16)--%>
                            <%String title= (String) request.getAttribute("title");
                            %>

                            <%=title%>(<%=postDao.getLen(p_class)%>)
                        </h2>
                        <div class="mail-tools tooltip-demo m-t-md">
                            <div class="btn-group pull-right">
                                <button class="btn btn-white btn-sm"><i class="fa fa-arrow-left"></i></button>
                                <button class="btn btn-white btn-sm"><i class="fa fa-arrow-right"></i></button>

                            </div>

                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="Refresh "><i class="fa fa-refresh"></i> 刷新</button>
                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Mark as read"><i class="fa fa-eye"></i> </button>
                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Mark as important"><i class="fa fa-exclamation"></i> </button>
                            <button name="action" value="del" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="删除"><i class="fa fa-trash-o"></i> </button>

                        </div>
                    </div>
                    <div class="mail-box">

                        <table class="table table-hover table-mail">
                            <tbody>

                            <%for (Post post:posts){%>
                            <tr class="unread">
                                <td class="check-mail">
                                    <input name="id" value="<%=post.getId()%>" type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="blog_updata?post_id=<%=post.getId()%>"><%=post.getTitle()%></a></td>
                                <td><a href="mailbox.html#"> <i class="fa fa-circle text-navy"></i> <%=categoryDao.get_Category(post.getCategry_id()).getTitle()%></a></td>
                                <td class="text-right mail-date"><%=post.getCreated_ar()%></td>
                            </tr>


                        <%}%>
                            </tbody>
                        </table>


                    </div>

                </div>

                </form>
        </div>
        <div class="footer">
            <div class="pull-right">
                10GB of <strong>250GB</strong> Free.
            </div>
            <div>
                <strong>Copyright</strong> Example Company &copy; 2014-2015
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

<!-- iCheck -->
<script src="<%=webroot%>js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function(){
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
</script>
</body>

</html>

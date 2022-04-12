<%@include file="vail1.jsp" %>
<%@ page import="dao.PostDao" %>
<%@ page import="bean.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.CategoryDao" %>
<%@ page import="bean.Post" %><%--
  Created by IntelliJ IDEA.
  User: oo
  Date: 2021/6/10
  Time: 5:20 下午
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

    <title>INSPINIA | Mailbox</title>

    <link href="<%=webroot%> css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=webroot%> font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%=webroot%> css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=webroot%> css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="<%=webroot%> css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="<%=webroot%> css/animate.css" rel="stylesheet">
    <link href="<%=webroot%> css/style.css" rel="stylesheet">




    <link href="<%=webroot%>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=webroot%>font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%=webroot%>css/animate.css" rel="stylesheet">
    <link href="<%=webroot%>css/plugins/bootstrap-markdown/bootstrap-markdown.min.css" rel="stylesheet">
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
                                <%PostDao postDao=new PostDao();



                                %>
                                <ul class="folder-list m-b-md" style="padding: 0">
                                    <li><a href="blog?action=blog"> <i class="fa fa-inbox "></i> 博客 <span class="label label-warning pull-right"><%=postDao.getLen(1)%></span> </a></li>

                                    <li><a href="blog?action=draft"> <i class="fa fa-file-text-o"></i> 草稿<span class="label label-danger pull-right"><%=postDao.getLen(2)%></span></a></li>
                                    <li><a href="blog?action=deldata"> <i class="fa fa-trash-o"></i> 回收站</a></li>
                                </ul>
                                <h5>类型</h5>
                                <ul class="category-list" style="padding: 0">

                                    <%
                                        List<Category> categories=new ArrayList<Category>();
                                        CategoryDao categoryDao=new CategoryDao();
                                        categories=categoryDao.get_categorys();
                                        for (Category category:categories){
                                    %>
                                    <li><a href="mailbox.html#"> <i class="fa fa-circle text-navy"></i> <%=category.getTitle()%></a></li>
                                    <%}%>
<%--                                    <li><a href="mailbox.html#"> <i class="fa fa-circle text-navy"></i> Work </a></li>--%>
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
                <div class="col-lg-9 animated fadeInRight">
                    <div class="mail-box-header">
                        <div class="pull-right tooltip-demo">
                            <a href="mailbox.html" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Move to draft folder"><i class="fa fa-pencil"></i> 草稿</a>
                            <a href="mailbox.html" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i> 丢弃</a>
                        </div>
                        <h2>
                            修改博客
                        </h2>
                    </div>
                    <div class="mail-box">
                        <form class="form-horizontal" method="post" action="blog_updata">

                        <div class="mail-body" >
                            <% Post post55= (Post) request.getAttribute("post");

                            %>

                                <div class="form-group"><label class="col-sm-2 control-label">标题:</label>

                                    <div class="col-sm-10"><input name="title" type="text" class="form-control" value="<%=post55.getTitle()%>"></div>
                                </div>
                                <div class="form-group "><label class="col-sm-2 control-label">分类:</label>
                                    <div class="btn-group" style="margin-left: 15px;">

                                        <%
                                            String category_data="";
                                            if (post55.getCategry_id()==-1){
                                                category_data="请选择分类";
                                            }
                                            else{
                                                category_data=categoryDao.get_Category(post55.getCategry_id()).getTitle();
                                            }

                                        %>

                                        <button  data-toggle="dropdown" class="btn btn-primary dropdown-toggle" aria-expanded="false"><%=category_data%> <span class="caret"></span></button>
                                        <input name="category_id" value="<%=post55.getCategry_id()%>" style="display: none">



                                        <ul class="dropdown-menu">

                                            <% List<Category> categories1= categoryDao.get_categorys();
                                                for (Category category:categories){
                                            %>
                                            <li><a type="submit" href="blog_updata?category_id=<%=category.getId()%>&post_id=<%=post55.getId()%>" ><%=category.getTitle()%></a></li>
<%--                                            <li><a href="buttons.html#" class="font-bold">java</a></li>--%>
<%--                                            <li><a href="buttons.html#">py</a></li>--%>

                                            <%}%>
                                        </ul>
                                    </div>
                                    <!-- <div class="col-sm-10"><input type="text" class="form-control" value=""></div> -->
                                </div>





                        </div>


                        <div class="mail-text h-200">

                            <textarea name="content" data-provide="markdown" rows="20"  ><%=post55.getContent()%> </textarea>
                            <div class="clearfix"></div>

                            <input name="id" value="<%=post55.getId()%>" style="display: none">
                        </div>





                        <div class="mail-body text-right tooltip-demo">

                            <button type="submit"  name="action" value="send" class="btn btn-sm btn-primary " data-toggle="tooltip" data-placement="top" title="Send" ><i class="fa fa-reply"></i>保存修改 </button>
                            <button type="submit"  name="action" value="post_del" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i> 丢弃</button>
                            <button type="submit"  name="action" value="folder" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Move to draft folder"><i class="fa fa-pencil"></i> 草稿</button>
                        </div>
                        <div class="clearfix"></div>
                        </form>



                    </div>
                </div>





            </div>





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

<!-- Bootstrap markdown -->
<script src="<%=webroot%>js/plugins/bootstrap-markdown/bootstrap-markdown.js"></script>
<script src="<%=webroot%>js/plugins/bootstrap-markdown/markdown.js"></script>


<!-- Custom and plugin javascript -->
<script src="<%=webroot%>js/inspinia.js"></script>
<script src="<%=webroot%>js/plugins/pace/pace.min.js"></script>




<!-- iCheck -->
<script src="<%=webroot%>js/plugins/iCheck/icheck.min.js"></script>

<!-- SUMMERNOTE -->
<script src="<%=webroot%>js/plugins/summernote/summernote.min.js"></script>
<script>
    $(document).ready(function(){
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });


        $('.summernote').summernote();

    });
    var edit = function() {
        $('.click2edit').summernote({focus: true});
    };
    var save = function() {
        var aHTML = $('.click2edit').code(); //save HTML If you need(aHTML: array).
        $('.click2edit').destroy();
    };

</script>






</body>

</html>

<%@ page import="java.util.List" %>
<%@ page import="bean.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.PostDao" %>
<%@ page import="dao.CategoryDao" %>
<%@ page import="bean.Category" %><%--
  Created by IntelliJ IDEA.
  User: oo
  Date: 2021/6/14
  Time: 4:00 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%String webroot=request.getContextPath()+"/";
//    System.out.println(webroot);
%>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width" />
    <meta name="author" content="www.yanshisan.cn" />
    <meta name="robots" content="all" />
    <title>文章</title>
    <link rel="stylesheet" href="<%=webroot%>blog_index/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=webroot%>blog_index/layui/css/layui.css" />
    <link rel="stylesheet" href="<%=webroot%>blog_index/css/master.css" />
    <link rel="stylesheet" href="<%=webroot%>blog_index/css/gloable.css" />
    <link rel="stylesheet" href="<%=webroot%>blog_index/css/nprogress.css" />
    <link rel="stylesheet" href="<%=webroot%>blog_index/css/blog.css" />
</head>
<body>
<div class="header">
</div>
<header class="gird-header">
    <div class="header-fixed">
        <div class="header-inner">
            <a href="javascript:void(0)" class="header-logo" id="logo">Mr.toby</a>
            <nav class="nav" id="nav">
                <ul>
                    <li><a href="<%=webroot%>index">首页</a></li>
                    <li><a href="<%=webroot%>article">博客</a></li>
                    <li><a href="<%=webroot%>message">留言</a></li>
                    <li><a href="<%=webroot%>link">友链</a></li>
                </ul>
            </nav>
            <a href="<%=webroot%>admin" class="blog-user">
                <i class="fa fa-sign-out"></i>管理
            </a>
            <a class="phone-menu">
                <i></i>
                <i></i>
                <i></i>
            </a>
        </div>
    </div>
</header>
<div class="doc-container" id="doc-container">

    <div class="container-fixed">
        <div class="col-content">
            <div class="inner">
                <article class="article-list bloglist" id="LAY_bloglist" >
                    <%
                        List<Post> posts=new ArrayList<Post>();
                        String cat_id= (String) request.getAttribute("cat_id");
                        PostDao postDao=new PostDao();
                        CategoryDao categoryDao=new CategoryDao();

                        if (cat_id.equals("-1")){
                            posts=postDao.getAll(1);
                        }
                        else {
                            posts=postDao.getAll(1, Integer.parseInt(cat_id));
                        }




                        for (Post post:posts){


                    %>
                    <section class="article-item zoomIn article">
                        <!-- <div class="fc-flag">置顶</div>    -->
                        <h5 class="title">
                            <span class="fc-blue">【原创】</span>
                            <a href="read.html"><%=post.getTitle()%></a>
                        </h5>
                        <div class="time">
                            <span class="day"><%=post.getCreated_ar().split(" ")[0].split("-")[2]%></span>
                            <span class="month fs-18"><%=post.getCreated_ar().split(" ")[0].split("-")[1]%><small class="fs-14">月</small></span>
                            <span class="year fs-18"><%=post.getCreated_ar().split(" ")[0].split("-")[0]%></span>
                        </div>
                        <div class="content">
                            <!-- <a href="read.html" class="cover img-light">
                                <img src="image/cover/2019121192339714.png">
                            </a> -->
<%--                            Spire.Doc for .NET是一款由E-iceblue公司开发的专业的Word .NET类库，使用该工具开发人员可以在任意.NET平台（C#，VB.NET，ASP.NET）上快速创建，读取，写入，转换，打印Word文档。作为一个独立的Word 组件，Spire.Doc的运行无需安装Microsoft Word。而且，它可以将Microsoft Word文档创建功能集成到开发者的任何.NET应用程序。--%>
                            <%=post.getContent()%>
                        </div>
                        <div class="read-more">
                            <a href="read.html" class="fc-black f-fwb">继续阅读</a>
                        </div>
                        <aside class="f-oh footer">
                            <div class="f-fl tags">

                                <span class="fa fa-tags fs-16"></span>
                                <%
                                    if (post.getCategry_id()!=-1){


                                        Category category222= categoryDao.get_Category(post.getCategry_id());%>

                                        <a class="tag"><%=category222.getTitle()%></a>
                                <%}%>
                            </div>
                            <div class="f-fr">
									<span class="read">
										<i class="fa fa-eye fs-16"></i>
										<i class="num">57</i>
									</span>
                                <span class="ml20">
										<i class="fa fa-comments fs-16"></i>
										<a href="javascript:void(0)" class="num fc-grey">1</a>
									</span>
                            </div>
                        </aside>
                    </section>
                    <%}%>


                </article>
            </div>
        </div>
        <div class="col-other">
            <div class="inner">
                <div class="other-item" id="categoryandsearch">
                    <div class="search">
                        <label class="search-wrap">
                            <input type="text" id="searchtxt" placeholder="输入关键字搜索" />
                            <span class="search-icon">
					                <i class="fa fa-search"></i>
					            </span>
                        </label>
                        <ul class="search-result"></ul>
                    </div>

                    <ul class="category mt20" id="category">
                        <li data-index="0" class="slider"></li>
                        <li data-index="1"  class="current"><a href="<%=webroot%>article?cat_id=-1">全部分类</a></li>

                        <%

                            List<Category> categories=new ArrayList<Category>();
                            categories=categoryDao.get_categorys();
                            int i=1;
                            int t=-1;

                            if (cat_id.equals("-1")){
                                t=0;
                            }else {
                                t= Integer.parseInt(cat_id);
                            }
                            for (Category category22:categories){
                                i++;
                                if (category22.getId()==t){
                                    System.out.println(category22.getId());

                        %>

                        <li data-index="<%=i%> " class="current"><a href="<%=webroot%>article?cat_id=<%=category22.getId()%>"><%=category22.getTitle()%></a></li>
                        <%}
                        else {
                        %>
                        <li data-index="<%=i%>"><a href="<%=webroot%>article?cat_id=<%=category22.getId()%>"><%=category22.getTitle()%></a></li>


                        <%  }

                            }%>

<%--                        <li data-index="0" class="slider"></li>--%>
<%--                        <li data-index="1"><a href="/Blog/Article">全部文章</a></li>--%>
<%--                        <li data-index="2"><a href="/Blog/Article/1/">个人日记</a></li>--%>
<%--                        <li data-index="3"><a href="/Blog/Article/2/">HTML5&amp;CSS3</a></li>--%>
<%--                        <li data-index="4"><a href="/Blog/Article/3/">JavaScript</a></li>--%>
<%--                        <li data-index="5"><a href="/Blog/Article/4/">ASP.NET MVC</a></li>--%>
<%--                        <li data-index="6"><a href="/Blog/Article/5/">其它</a></li>--%>
                    </ul>
                </div>
                <!--右边悬浮 平板或手机设备显示-->
                <div class="category-toggle"><i class="layui-icon">&#xe603;</i></div>
                <div class="article-category">
                    <div class="article-category-title">分类导航</div>
                    <a href="/Blog/Article/1/">个人日记</a>
                    <a href="/Blog/Article/2/">HTML5&amp;CSS3</a>
                    <a href="/Blog/Article/3/">JavaScript</a>
                    <a href="/Blog/Article/4/">ASP.NET MVC</a>
                    <a href="/Blog/Article/5/">其它</a>
                    <div class="f-cb"></div>
                </div>
                <!--遮罩-->
                <div class="blog-mask animated layui-hide"></div>
                <div class="other-item">
                    <h5 class="other-item-title">热门文章</h5>
                    <div class="inner">
                        <ul class="hot-list-article">
                            <li> <a href="/Blog/Read/9">2018最新版QQ音乐api调用</a></li>
                            <li> <a href="/Blog/Read/12">模板分享</a></li>
                            <li> <a href="/Blog/Read/13">逆水寒</a></li>
                            <li> <a href="/Blog/Read/4">序章</a></li>
                            <li> <a href="/Blog/Read/7">解决百度分享插件不支持https</a></li>
                            <li> <a href="/Blog/Read/11">使用码云和VS托管本地代码</a></li>
                            <li> <a href="/Blog/Read/14">MUI框架-快速开发APP</a></li>
                            <li> <a href="/Blog/Read/8">NPOI导入导出Excel</a></li>
                        </ul>
                    </div>
                </div>
                <div class="other-item">
                    <h5 class="other-item-title">置顶推荐</h5>
                    <div class="inner">
                        <ul class="hot-list-article">
                            <li> <a href="/Blog/Read/16">.NET Spire.Doc组件</a></li>
                            <li> <a href="/Blog/Read/14">MUI框架-快速开发APP</a></li>
                            <li> <a href="/Blog/Read/9">2018最新版QQ音乐api调用</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<footer class="grid-footer">
    <div class="footer-fixed">
        <div class="copyright">
            <div class="info">
                <div class="contact">
                    <a href="javascript:void(0)" class="github" target="_blank"><i class="fa fa-github"></i></a>
                    <a href="https://wpa.qq.com/msgrd?v=3&uin=930054439&site=qq&menu=yes" class="qq" target="_blank" title="930054439"><i class="fa fa-qq"></i></a>
                    <a href="https://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=gbiysbG0tbWyuMHw8K-i7uw" class="email" target="_blank" title="930054439@qq.com"><i class="fa fa-envelope"></i></a>
                    <a href="javascript:void(0)" class="weixin"><i class="fa fa-weixin"></i></a>
                </div>
                <p class="mt05">
                    Copyright &copy; 2020-2021 toby All Rights Reserved
                </p>
            </div>
        </div>
    </div>
</footer>
<script src="<%=webroot%>blog_index/layui/layui.js"></script>
<script src="<%=webroot%>blog_index/js/yss/gloable.js"></script>
<script src="<%=webroot%>blog_index/js/plugins/nprogress.js"></script>
<script>NProgress.start();</script>
<script src="<%=webroot%>blog_index/js/yss/article.js"></script>
<script>
    window.onload = function () {
        NProgress.done();
    };
</script>
</body>
</html>


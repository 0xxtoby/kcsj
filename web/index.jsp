<%@ page import="java.util.List" %>
<%@ page import="bean.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.PostDao" %><%--
  Created by IntelliJ IDEA.
  User: oo
  Date: 2021/6/14
  Time: 2:36 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-Hans-CN">
<%String webroot=request.getContextPath()+"/";
//    System.out.println(webroot);
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width" />
    <title>toby｜blog</title>
    <link href="<%=webroot%>blog_index/layui/css/layui.css" rel="stylesheet" type="text/css">
    <link href="<%=webroot%>blog_index/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<%=webroot%>blog_index/css/index_style.css" rel="stylesheet" type="text/css">
    <link href="<%=webroot%>blog_index/css/animate.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="menu" class="hover_animation menu_open" data-mark="false">
    <span></span>
    <span></span>
    <span></span>
</div>
<div id="navgation" class="navgation navgation_close">
    <ul class="point">
        <li><a href="#">首页</a></li>
        <li><a href="article.html">博客</a></li>
        <li><a href="admin">管理</a></li>
    </ul>
    <div class="logo"><a>Mr.toby</a></div>
</div>
<div class="section" id="section1">
    <div class="fp-tablecell">
        <div class="page1">
            <div class="nav wow zoomIn" data-wow-duration="2s">
                <h1>toby</h1>
                <p>辛苦的实训周</p>
                <a class="layui-btn layui-btn-normal" style="margin-top: 20px" href="#section2">进入博客</a>
            </div>
            <a class="next wow fadeInUp" data-wow-duration="2s" id="next"></a>
        </div>
    </div>
</div>
<div class="section" id="section2">
    <div class="fp-tablecell">
        <div class="page2">
            <div class="warp-box">
                <div class="new-article">
                    <div class="inner wow fadeInDown" data-wow-delay=".2s">
                        <h1>热门文章</h1>
                        <p>
                            很想给你写封信,告诉你这里的天气.
                            <br>昨夜的那场电影,还有我的心情.
                        </p>
                    </div>
                </div>

                <div class="layui-row">
                    <%
                        List<Post> posts=new ArrayList<Post>();
                        PostDao postDao=new PostDao();
                        posts=postDao.getAll(1);


                        for (Post post:posts){



                    %>
                    <div class="layui-col-xs12 layui-col-sm4 layui-col-md4  wow fadeInUp" style="padding: 0 10px">
                        <div class="single-news">
                            <div class="news-head">
                                <img src="<%=webroot%>blog_index/image/1.jpg">
                                <a href="<%=webroot%>read?id=<%=post.getId()%>" class="link"><i class="fa fa-link"></i></a>
                            </div>
                            <div class="news-content">
                                <h4>
                                    <a href="#">
                                        <%=post.getTitle()%>
                                    </a>
                                </h4>
                                <div class="date">
                                    <%=post.getCreated_ar().split(" ")[0]%>
                                </div>
                                <p>
                                    <%if (post.getContent().length()>30){
                                    %>
                                    <%=post.getContent().substring(0,30)%>....
                                    <%}
                                    else {%>
                                    <%=post.getContent()%>

                                    <%}%>
                                </p>
                                <a href="<%=webroot%>read?id=<%=post.getId()%>" class="btn">
                                    阅读更多
                                </a>
                            </div>
                        </div>
                    </div>

                    <%}%>

                </div>
            </div>
        </div>
    </div>
</div>
<div class="section" id="section3">
    <div class="fp-tablecell">
        <div class="page3">
            <div class="warp-box">
                <div class="warp">
                    <div class="inner">
                        <div class="links">
                            <ul>
                                <li class="wow fadeInLeft"><a href="#">关于</a></li>
                                <li class="wow fadeInRight"><a href="#">+友情链接</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="section" id="section4">
    <div class="fp-tablecell">
        <div class="page4">
            <div class="warp-box">
                <div class="about">
                    <div class="inner">
                        <h1 class="wow fadeInLeft">次元使者</h1>
                        <p class="wow fadeInRight">
                            爱好游戏，动漫。闲来无事喜欢在一些不健康的场所虚度光阴，撸起代码就会废寝忘食。
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="footer wow fadeInUp" id="contact">
    <div class="footer-top">
        <div class="container">
            <div class="layui-row">
                <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                    <div class="single-widget about">
                        <div class="footer-logo">
                            <h2>toby</h2>
                        </div>
                        <!-- <p>剑气纵横三万里，一剑光寒十九洲。</p> -->
                        <div class="button">
                            <a href="#" class="btn layui-btn layui-btn-normal">About Me</a>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                    <div class="single-widget">
                        <h2>相关链接</h2>
                        <ul class="social-icon">
                            <li class="active"><a href="#"><i class="fa fa-book"></i>博文</a></li>
                            <li class="active"><a href="#"><i class="fa fa-comments"></i>留言</a></li>
                            <li class="active"><a href="#"><i class="fa fa-share"></i>资源</a></li>
                            <li class="active"><a href="#"><i class="fa fa-snowflake-o"></i>日记</a></li>
                            <li class="active"><a href="#"><i class="fa fa-files-o"></i>归档</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="copyright">
        <div class="container">
            <div class="layui-row">
                <div class="layui-col-xs12 layui-col-sm12 layui-col-md12 text-center">
                    <p>Copyright &copy; 2020-2021 toby All Rights Reserved </p>
                </div>
            </div>
        </div>
    </div>
</footer>
<script src="<%=webroot%>blog_index/layui/layui.js"></script>
<script src="<%=webroot%>blog_index/js/wow.min.js"></script>
<script src="<%=webroot%>blog_index/js/index.js"></script>
</body>
</html>

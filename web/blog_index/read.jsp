<%@ page import="bean.Post" %>
<%@ page import="dao.PostDao" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Reply" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.ReplyDao" %><%--
  Created by IntelliJ IDEA.
  User: oo
  Date: 2021/6/14
  Time: 3:05 下午
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
    <title>文章阅读</title>
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
<%
    Post post=new Post();
//    String idStr= request.getParameter("id");
//    int id= Integer.parseInt(idStr);
    int id= (int) request.getAttribute("id");

    PostDao postDao=new PostDao();
    post=postDao.getPost(id);
%>
<div class="doc-container" id="doc-container">
    <div class="container-fixed">
        <div class="col-content" style="width:100%">
            <div class="inner">
                <article class="article-list">
                    <input type="hidden" value="@Model.BlogTypeID" id="blogtypeid" />
                    <section class="article-item">
                        <aside class="title" style="line-height:1.5;">
                            <h4><%=post.getTitle()%>></h4>
                            <p class="fc-grey fs-14">
                                <small>
                                    作者：<a href="javascript:void(0)" target="_blank" class="fc-link">toby</a>
                                </small>
<%--                                <small class="ml10">围观群众：<i class="readcount">37</i></small>--%>
                                <small class="ml10">更新于 <label><%=post.getCreated_ar()%></label> </small>
                            </p>
                        </aside>
                        <div class="time mt10" style="padding-bottom:0;">
                            <span class="day"><%=post.getCreated_ar().split(" ")[0].split("-")[2]%></span>
                            <span class="month fs-18"><%=post.getCreated_ar().split(" ")[0].split("-")[1]%><small class="fs-14">月</small></span>
                            <span class="year fs-18"><%=post.getCreated_ar().split(" ")[0].split("-")[0]%></span>
                        </div>
                        <div class="content artiledetail" style="border-bottom: 1px solid #e1e2e0; padding-bottom: 20px;">


                            <%=post.getContent()%>



                            <div class="copyright mt20">
                                <p class="f-toe fc-black">
                                    非特殊说明，本文版权归 toby 所有，转载请注明出处.
                                </p>
                                <p class="f-toe">
                                    本文标题：
                                    <a href="javascript:void(0)" class="r-title">使用码云和VS托管本地代码</a>
                                </p>
                                <p class="f-toe">
                                    本文网址：
                                    <a href="#"><%=request.getRequestURL()%></a>
                                </p>
                            </>
                            <div id="aplayer" style="margin:5px 0"></div>
                            <h6>延伸阅读</h6>
                            <ol class="b-relation"></ol>
                        </div>
                        <div class="bdsharebuttonbox share" data-tag="share_1">
                            <ul>
                                <li class="f-praise"><span><a class="s-praise"></a></span></li>
                                <li class="f-weinxi"><a class="s-weinxi" data-cmd="weixin"></a></li>
                                <li class="f-sina"><a class="s-sina" data-cmd="tsina"></a></li>
                                <li class="f-qq" href="#"></li>
                                <li class="f-qzone"><a class="s-qzone" data-cmd="qzone"></a></li>
                            </ul>
                        </div>
                        <div class="f-cb"></div>
                        <div class="mt20 f-fwn fs-24 fc-grey comment" style="border-top: 1px solid #e1e2e0; padding-top: 20px;">
                        </div>
                        <fieldset class="layui-elem-field layui-field-title">
                            <legend>发表评论</legend>
                            <div class="layui-field-box">
                                <div class="leavemessage" style="text-align:initial">
                                    <form class="layui-form blog-editor" action="reply" method="post">
                                        <input type="hidden" name="articleid" id="articleid" value="@Model.ID">


                                        <label class="search-wrap">
                                            <span class="search-icon">
					                         <i class="fa fa-user-circle-o"></i>
                                                ：
                                            </span>
                                            <input name="username" type="text" id="searchtxt" placeholder="请输入用户名">

                                        </label>
<%--                                        <div class="">用户：<input type="text" class="layui-textarea" value="请输入用户名" style="border: #0a6aa1 4px"> </div>--%>
                                        <div class="layui-form-item">
                                            <textarea name="content" lay-verify="content" id="remarkEditor" placeholder="请输入内容" class="layui-textarea "></textarea>
                                        </div>
                                        <div class="layui-form-item">
                                            <input name="post_id" value="<%=post.getId()%>" style="display: none">
                                            <button name="action" value="add" class="layui-btn" lay-submit="formLeaveMessage" lay-filter="formLeaveMessage">提交留言</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </fieldset>
                        <ul class="blog-comment" id="blog-comment">
                            <%List<Reply> replies=new ArrayList<Reply>();
                                ReplyDao replyDao=new ReplyDao();
                                replies=replyDao.getAll(post.getId());
                                for (Reply reply22:replies){


                            %>

                            <li>
                                <div class="comment-parent"><a name="remark-362"></a><img
                                        src="https://thirdqq.qlogo.cn/g?b=oidb&amp;k=gU5KYz7GzA08ffHYLNWy3g&amp;s=100&amp;t=1556071555"
                                        alt="❤ONE" piece="">
                                    <div class="info" style="margin-top: -15px" ><span class="username"><%=reply22.getUsername()%></span></div>
                                    <div class="comment-content"><%=reply22.getContent()%></div>
                                    <p class="info info-footer"><span class="comment-time"><%=reply22.getCreated_at()%></span></p></div>
                                <div class="replycontainer layui-hide">
                                    <form class="layui-form" action=""><input type="hidden" name="remarkId" value="362">
                                        <input type="hidden" name="targetUserId" value="0"> <input type="hidden"
                                                                                                   name="articleId"
                                                                                                   value="23">
                                        <div class="layui-form-item"><textarea name="replyContent"
                                                                               lay-verify="replyContent"
                                                                               placeholder="请输入回复内容"
                                                                               class="layui-textarea"
                                                                               style="min-height:80px;"></textarea>
                                        </div>
                                        <div class="layui-form-item">
                                            <button class="layui-btn layui-btn-xs" lay-submit="formReply"
                                                    lay-filter="formReply">提交
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <%}%>

                        </ul>
                    </section>
                </article>
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
                    <a href="#" class="qq" target="_blank" ><i class="fa fa-qq"></i></a>
                    <a href="#" class="email" target="_blank" ><i class="fa fa-envelope"></i></a>
                    <a href="javascript:void(0)" class="weixin"><i class="fa fa-weixin"></i></a>
                </div>
                <p class="mt05">
                    Copyright &copy; 2020-2021 tobyAll Rights Reserved
                </p>
            </div>
        </div>
    </div>
</footer>
<script src="<%=webroot%>blog_index/layui/layui.js"></script>
<script src="<%=webroot%>blog_index/js/yss/gloable.js"></script>
<script src="<%=webroot%>blog_index/js/plugins/nprogress.js"></script>
<script src="<%=webroot%>blog_index/js/pagecomment.js"></script>
<script>NProgress.start();</script>
<script>
    window.onload = function () {
        NProgress.done();
    };
</script>
</body>
</html>

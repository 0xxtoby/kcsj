<%--
  Created by IntelliJ IDEA.
  bean.User: oo
  Date: 2021/6/7
  Time: 9:02 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>INSPINIA | Login</title>

  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

  <link href="css/animate.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen animated fadeInDown">
  <div>
    <div>

      <h1 class="logo-name">toby</h1>

    </div>

    <p>tobyのblog</p>
    <%String error= (String) request.getAttribute("error");
      if (error !=null && !"".equals(error)){
    %>
    <p style="color: red"><%=error%></p>
    <%}%>
    <form class="m-t" role="form"   action="login" method="post">
      <div class="form-group">
        <input name="email" type="email" class="form-control" placeholder="邮箱" required="">
      </div>
      <div class="form-group">
        <input name="password" type="password" class="form-control" placeholder="密码" required="">
      </div>
      <button type="submit" class="btn btn-primary block full-width m-b">登录</button>


      <a class="btn btn-sm btn-white btn-block" href="register.jsp">注册</a>
    </form>
    <p class="m-t"> <small>toby &copy; 2014</small> </p>
  </div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-2.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>

</html>

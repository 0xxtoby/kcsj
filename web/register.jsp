<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Register</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">toby</h1>

            </div>
<!--            <h3>Register to IN+</h3>-->
            <p>注册，请输入相关信息</p>
            <%String error= (String) request.getAttribute("error");
                if (error !=null && !"".equals(error)){
            %>
            <p style="color: red"><%=error%></p>
            <%}%>

            <form class="m-t" role="form" action="register" method="post">
                <div class="form-group">
                    <input name="username" type="text" class="form-control" placeholder="姓名" required="">
                </div>
                <div class="form-group">
                    <input name="email" type="email" class="form-control" placeholder="邮箱" required="">
                </div>
                <div class="form-group">
                    <input name="password" type="password" class="form-control" placeholder="密码" required="">
                </div>
                <div class="form-group">
                        <div class="checkbox i-checks"><label> <input type="checkbox"><i></i> 同意条款和政策 </label></div>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">注册</button>

                <p class="text-muted text-center"><small>已经有账户？</small></p>
                <a class="btn btn-sm btn-white btn-block" href="login">登录</a>
            </form>
            <p class="m-t"> <small>tobyblog &copy; 2021</small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
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

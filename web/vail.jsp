<%--
  Created by IntelliJ IDEA.
  User: oo
  Date: 2021/5/10
  Time: 10:08 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object obj=session.getAttribute("user");
    if (obj==null)
        response.sendRedirect("login");
%>
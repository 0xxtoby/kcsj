<%--
  Created by IntelliJ IDEA.
  User: oo
  Date: 2021/6/15
  Time: 5:39 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object obj=session.getAttribute("user");
    String webroot22=request.getContextPath()+"/";
    if (obj==null)
        response.sendRedirect(webroot22+"login");
%>

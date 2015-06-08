<%@ page import="cn.net.hous.shopping.User" %>
<%--
  Created by IntelliJ IDEA.
  User: 帅
  Date: 2015/6/6
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@include file="usersesscheck.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    User u = (User)session.getAttribute("user");
%>
<h1 align="center"><%=u.getUsername()%>,wecome!</h1>
<a href="usermodify.jsp" >modify info</a>
<a href="psdmodify.jsp" >modify password</a>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 帅
  Date: 2015/6/5
  Time: 16:53
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
    session.setAttribute("username", request.getParameter("username"));
%>
<h1 align="center"><%=session.getAttribute("username")%>,Wecome to regiser!</h1><a href="usermodify.jsp" >modify info</a><a href="psdmodify.jsp" >modify password</a>

</body>
</html>

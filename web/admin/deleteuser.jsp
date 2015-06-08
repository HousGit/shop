<%@ page import="cn.net.hous.shopping.UserManger" %>
<%--
  Created by IntelliJ IDEA.
  User: 帅
  Date: 2015/6/5
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="_adminsesscheck.jsp"%><html>
<head>
    <title></title>
</head>
<body>

<%
    int id =Integer.parseInt(request.getParameter("id"));
    cn.net.hous.shopping.UserManger.deleteUser(id);
%>
<jsp:forward page="userlist.jsp"/>
</body>
</html>

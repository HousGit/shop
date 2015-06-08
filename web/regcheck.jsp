<%@ page import="cn.net.hous.shopping.User" %>
<%--
  Created by IntelliJ IDEA.
  User: 帅
  Date: 2015/6/4
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="cn.net.hous.shopping.User" scope="session"/>
<jsp:setProperty name="user" property="*"/>
<jsp:setProperty name="user" property="password" param="password"/>
<html>
<head>
    <title></title>
</head>
<body>
<%

  if (User.check(user))
  {
      user.sava();
%>

<jsp:forward page="regsucc.jsp"/>

<%

  }

  if (!User.check(user)){
%>

<jsp:forward page="register.jsp"/>

<%
  }
%>
</body>
</html>

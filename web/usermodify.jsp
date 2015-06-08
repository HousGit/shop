<%@ page import="cn.net.hous.shopping.User" %>
<%@ page import="cn.net.hous.shopping.UserManger" %>
<%--
  Created by IntelliJ IDEA.
  User: 帅
  Date: 2015/6/6
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@include file="usersesscheck.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User)session.getAttribute("user");
    if (null !=request.getParameter("hid"))
    {
        user.setPhone(request.getParameter("phone"));
        user.setAddr(request.getParameter("addr"));
        user.update();
        out.print("<h3 align='center'>modify succeed!</h3>");
    }
%>
<html>
<head>
    <title>usermodify</title>
</head>
<body>

<form action="usermodify.jsp" name="modify" method="post" onsubmit="return confirm('sure about that?')">
    <h1 align="center">Register</h1>
    <table align="center" border="1">
        <tr><td>Username</td><td><%=user.getUsername()%></td></tr>
        <tr><td>Phone</td><td><input type="text" name="phone" value="<%=user.getPhone()%>"></td></tr>
        <tr><td>Address</td><td><input type="text" name="addr" value="<%=user.getAddr()%>"></td></tr>
        <tr><td><input type="submit" value="go"></td></tr>
    </table>
    <input type="hidden" name="hid" value="modify">
</form>
</body>
</html>

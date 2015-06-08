<%@ page import="cn.net.hous.shopping.UserManger" %>
<%@ page import="cn.net.hous.shopping.User" %>
<%--
  Created by IntelliJ IDEA.
  User: 帅
  Date: 2015/6/6
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getParameter("hid") != null){
        User u = null;
        if ((u=UserManger.login(request.getParameter("usn"), request.getParameter("psd"))) != null) {
            session.setAttribute("user",u);
            response.sendRedirect("usercenter.jsp");
        }else {
            out.print("<h2 align='center'>username or password error,plaese try again!</h2>");
        }
    }
%>

<html>
<head>
    <title>login</title>
</head>
<body>
<h2 align="center">sign in</h2>
<form action="login.jsp" name="login" method="post">
    <table align="center" border="1">
        <tr><td>Username </td><td><input type="text" name="usn" ></td></tr>
        <tr><td>Password </td><td><input type="password" name="psd" ></td></tr>
        <tr><td><input type="submit" value="ok" align="center"></td></tr>
    </table>

    <input type="hidden" name="hid" value="login">

</form>
</body>
</html>

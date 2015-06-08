<%@ page import="cn.net.hous.shopping.User" %>
<%--
  Created by IntelliJ IDEA.
  User: 帅
  Date: 2015/6/6
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@include file="usersesscheck.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User u = (User)session.getAttribute("user");
    if (null !=request.getParameter("hid"))
    {
        u.setPassword(request.getParameter("newpassword"));
        u.update();
        out.print("<h3 align='center'>modify succeed!</h3>");
    }
%>
<html>
<head>
    <script language="JavaScript">
        function check()
        {
            if(document.mdf.newpassword.value != document.mdf.repassword.value)
            {
                alert("check repassword!")
                return false;
            }
            else{
                return true;
            }
        }
    </script>
    <title>password modify</title>
</head>
<body>
<form action="psdmodify.jsp" name="mdf" method="post" onsubmit="return check()">
    <h1 align="center">Register</h1>
    <table align="center" border="1">
        <tr><td>Username</td><td><%=u.getUsername()%></td></tr>
        <tr><td>NewPassword</td><td><input type="password" name="newpassword" > </td></tr>
        <tr><td>Repassword</td><td><input type="password" name="repassword"  > </td></tr>
        <tr><td><input type="submit" value="go"></td></tr>
    </table>
    <input type="hidden" name="hid" value="psdmodify">

</form>
</body>
</html>

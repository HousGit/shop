<%--
  Created by IntelliJ IDEA.
  User: 帅
  Date: 2015/6/5
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String flag = request.getParameter("action");
    if (flag!=null)
        {
            if ( flag.equals("login")) {
                if (request.getParameter("apsd").equals("admin"))
                {
                    session.setAttribute("admin","admin");
                    response.sendRedirect("AdminIndex.jsp");
                }else{
                    out.print("<h2 align='center'>password error</h2>");
                }
            }
        }
%>
<html>
<head>
    <title></title>
</head>
<body>
<form name="alog" method="post" action="adminlog.jsp">
    <table align="center" border="1">
        <tr><h1 align="center">Admin sign in</h1></tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="apsd"></td>
        </tr>
        <tr><td><input type="submit" value="go"></td></tr>
    </table>
    <input type="hidden" name="action" value="login">
</form>
</body>
</html>

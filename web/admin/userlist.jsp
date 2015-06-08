<%@ page import="java.util.List" %>
<%@ page import="cn.net.hous.shopping.User" %>
<%@ page import="cn.net.hous.shopping.UserManger" %>
<%--
  Created by IntelliJ IDEA.
  User: 帅
  Date: 2015/6/5
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<User> u = UserManger.getUser();
%>
<html>
<head>
    <title></title>
</head>
<body>

<table align="center" border="1">
    <tr><td>ID</td><td>Username</td><td>Password</td><td>Phone</td><td>Adrress</td><td>RegisterDate</td><td>Option</td></tr>
    <%
       int i;
       for (i = 0; i<u.size(); i++){
           User tmp = u.get(i);
    %>

    <tr>
    <td><%=tmp.getId()%></td>
    <td><%=tmp.getUsername()%></td>
    <td><%=tmp.getPassword()%> </td>
    <td><%=tmp.getPhone()%></td>
    <td><%=tmp.getAddr()%></td>
    <td><%=tmp.getRdate()%></td>
    <td><a href="javascript:if(confirm('确实要删除吗?'))location='deleteuser.jsp?id=<%=tmp.getId()%>'" onclick="">delete</a></td>
    </tr>

        <%
    }
    %>
</body>
</html>

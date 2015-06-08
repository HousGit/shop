<%--
  Created by IntelliJ IDEA.
  User: 帅
  Date: 2015/6/4
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="cn.net.hous.shopping.User" scope="session"/>
<html>
<head>
    <script language="JavaScript" >
        function check()
        {
            if(document.reg.password.value != document.reg.repassword.value){
                alert("please check password and input again.")
            }
        }
    </script>
    <title>Register</title>
</head>
<body>

<form action="regcheck.jsp" name="reg" method="post" onsubmit="check()">
    <h1 align="center">Register</h1>
    <table align="center" border="1">
        <tr><td>Username</td><td><input type="text" name="username" value="<%=user.getUsername()%>"> <%=user.getErr("usmErr")%></td></tr>
        <tr><td>Password</td><td><input type="password" name="password" value="<%=user.getPassword()%>"> <%=user.getErr("pswErr")%></td></tr>
        <tr><td>Repassword</td><td><input type="password" name="repassword" value=""> <%=user.getErr("rpswErr")%></td></tr>
        <tr><td>Phone</td><td><input type="text" name="phone" value="<%=user.getPhone()%>"></td></tr>
        <tr><td>Address</td><td><input type="text" name="addr" value="<%=user.getAddr()%>"></td></tr>
        <tr><td><input type="submit" value="go"></td></tr>
    </table>


</form>






</body>
</html>

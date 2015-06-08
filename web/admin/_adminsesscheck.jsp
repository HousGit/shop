<%
    String sess = (String)session.getAttribute("admin");
    if (sess==null ||!sess.equals("admin"))
    {
        response.sendRedirect("adminlog.jsp");
        return;
    }
%>
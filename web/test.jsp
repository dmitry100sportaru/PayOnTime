<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 04.07.11
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Simple jsp page</title></head>
<body><%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
  %>
  <p>Hello, <%=user.getNickname() %>! (You can
  <a href="<%=userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
  <%
       } else {
  %>
  <p>Hello!
  <a href="<%=userService.createLoginURL("") %>">Sign in</a>
  to include your name with greetings you post.</p>
  <%
      }
  %>
</body>
</html>
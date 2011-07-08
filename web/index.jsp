<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="java.util.List" %>
<%@ page import="PayOnTime.PaymentRequest" %>
<%@ page import="PayOnTime.PMF" %>

<html>
<head><title>PayOnTime</title></head>
<body>
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
%>
<p>Hello, <%=user.getNickname() %>! (You can
    <a href="<%=userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
        PersistenceManager pm = PMF.get().getPersistenceManager();
        String query = "select from " + PaymentRequest.class.getName() + " order by date desc range 0,5";
        List<PaymentRequest> paymentRequests = (List<PaymentRequest>) pm.newQuery(query).execute();
        if (paymentRequests.isEmpty()) {
%>
<p>The guestbook has no messages.</p>
<%
        } else {
            for (PaymentRequest g : paymentRequests) {
                if (g.getAuthor() == null) {
%>
<p>An anonymous person wrote:</p>
<%
                } else {
%>
<p><b><%= g.getAuthor().getNickname() %>
</b> wrote:</p>
<%
                }
%>
<blockquote><%= g.getContent() %>
</blockquote>
<%
            }
        }
        pm.close();
    } else {
%>
<p>Hello!
    <a href="<%=userService.createLoginURL("") %>">Sign in</a>
    to include your name with greetings you post.</p>
<%
    }
%>

<form action="/sign" method="post">
    <div><textarea name="content" rows="3" cols="60"></textarea></div>
    <div><input type="submit" value="Post Greeting"/></div>
</form>

</body>
</html>
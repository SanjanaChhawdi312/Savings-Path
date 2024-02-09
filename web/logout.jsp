<%-- 
    Document   : logout
    Created on : 9 Dec, 2023, 11:27:09 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.RequestDispatcher"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout Page</title>
    <!-- Ensure there is no client-side redirection or hash changes -->
</head>
<body>
    <h1>Logout Page</h1>

    <% 
        HttpSession mysession = request.getSession(false);
        
        // Check if the session exists
        if (mysession != null) {
            // Invalidate the session to log out the user
            mysession.invalidate();
    
            // Forward the request to index.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } else {
    %>
            <p>You are not logged in.</p>
    <%
        }
    %>
</body>
</html>

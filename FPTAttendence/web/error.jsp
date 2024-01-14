<%-- 
    Document   : error
    Created on : Jan 14, 2024, 1:05:50 PM
    Author     : NCM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <h1>An error occurred!</h1>
    <p>${pageContext.exception.message}</p>
    <p>Stack trace:</p>
    <pre>${pageContext.exception.stackTrace}</pre>
    </body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<!DOCTYPE html>
<html lang = 'en'>
    <head>
        <meta charset="UTF-8">

        <script src="/webjars/jquery/3.1.1-1/jquery.min.js"></script>
        <script src="/webjars/sockjs-client/sockjs.min.js"></script>
        <script src="/webjars/stomp-websocket/stomp.min.js"></script>

        <title>Multiplayer Experiment</title>
        <style> 
            * { margin:0; padding:0; } /* to remove the top and left whitespace */

            html, body { width:100%; height:100%; } /* just to be sure these are full screen*/

            canvas { display:block; } /* To remove the scrollbars */
        </style>
    </head>
    <body>
        <canvas id = 'canvas' width ='100' height = '512'  bd=0 highlightthickness=0></canvas>
        <script id="jsonData" type="application/json">${pageContext.request.userPrincipal.name}</script>
        <script src="${contextPath}/resources/js/app.js"></script>
    </body>

</html>
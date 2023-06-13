<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <title>Multiplayer Experiment</title>
</head>
<body>
<h3 >Ваше имя ${pageContext.request.userPrincipal.name}</h3>

<div class="headerName">
    Hunger Game

</div>

<div class="playB">
    <!--!a href="game.html"><input class="header__logo" type="image" src="./assets/images/playButton.png" href="game.html" alt="Submit" />
            </a>-->

    <a class="header__logo" href="/"><img  class="header__logo" src="${contextPath}/resources/css/assets/images/playButton.png"></a>
    <br>
    <div class="choose_server" href="servers.html"> Выберите сервер:
        <select id="selectID">

            <option value=”GR”>Сервер 1</option>

            <option value=”YE”>Сервер 2</option>

            <option value=”BL”>Сервер 3</option>

        </select>
    </div>
</div>

<div class="headleft">


    <div class="menuleft">
        <a href="settings.html">Настройки</a>
        <a href="shop.html">Магазин</a>



    </div>

</div>

<div class="headright">
    <sec:authorize access="!hasRole('ROLE_ADMIN')">
    <img  class="adm" src="${contextPath}/resources/css/assets/images/Clear.png"></a>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
    <a href="/admin"><img  class="adm" src="${contextPath}/resources/css/assets/images/adm1.png"></a>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
    <a  href="/logout"><img  class="adm" src="${contextPath}/resources/css/assets/images/exit.png"></a>
    </sec:authorize>
    <sec:authorize access="!isAuthenticated()">
        <a  href="/login"><img  class="adm" src="${contextPath}/resources/css/assets/images/login.png"></a>
    </sec:authorize>
</div>

</body>
</html>
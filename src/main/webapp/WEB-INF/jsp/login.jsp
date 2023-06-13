<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
  <title>Multiplayer Experiment</title>
  <!-- Load the Phaser game library -->
  <!-- Some simple styles and fonts -->
</head>
<body>
<sec:authorize access="isAuthenticated()">
  <% response.sendRedirect("/"); %>
</sec:authorize>
<div class="form">

  <ul class="tab-group">
    <li class="tab active"><a href="#login">Авторизация</a></li>
    <li class="tab"><a href="/registration">Регистрация</a></li>
  </ul>

  <div class="tab-content">
      <h1>Приветствуем снова!</h1>

      <form action="/login" method="post">

        <div class="field-wrap">
          <label>
            Логин<span class="req">*</span>
          </label>
          <input type="login" name="username" autofocus="true" required autocomplete="off"/>
        </div>

        <div class="field-wrap">
          <label>
            Пароль<span class="req">*</span>
          </label>
          <input type="password" name="password" required autocomplete="off"/>
        </div>

        <p class="forgot"><a href="#">Забыли пароль?</a></p>

        <button class="button button-block"/>Авторизоваться</button>

      </form>
    </div>
</div> <!-- /form -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${contextPath}/resources/js/script.js"></script>
</body>
</html>
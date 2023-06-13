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
    <li class="tab"><a href="/login">Авторизация</a></li>
    <li class="tab active"><a href="#signup">Регистрация</a></li>
  </ul>

    <div id="signup">
      <h1>Регистрация</h1>

      <form:form modelAttribute="userForm" method="POST">

        <div class="top-row">
          <div class="field-wrap">
            <label>
              Имя<span class="req">*</span>
            </label>
            <form:input type="text" path="name"  autofocus="true"></form:input>
          </div>

          <div class="field-wrap">
            <label>
              Логин<span class="req">*</span>
            </label>
            <form:input type="text" path="username"></form:input>

          </div>
        </div>
        <form:errors path="username"></form:errors>
        ${usernameError}

        <div class="field-wrap">
          <label>
            Почта<span class="req">*</span>
          </label>
          <form:input type="email" path="email"></form:input>
        </div>

        <div class="top-row">
          <div class="field-wrap">
            <label>
              Пароль<span class="req">*</span>
            </label>
            <form:input type="password" path="password"></form:input>
          </div>

          <div class="field-wrap">
            <label>
              Подтвердите пароль<span class="req">*</span>
            </label>
            <form:input type="password" path="passwordConfirm"></form:input>
          </div>

          <form:errors path="password"></form:errors>
            ${passwordError}
        </div>


        <button type="submit" class="button button-block">Зарегистрироваться</button>


      </form:form>

    </div>

  </div><!-- tab-content -->

</div> <!-- /form -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${contextPath}/resources/js/script.js"></script>
</body>
</html>
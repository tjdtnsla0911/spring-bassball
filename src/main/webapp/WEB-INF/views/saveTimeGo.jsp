<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원 가입</title>
<link href="myform.css" rel="stylesheet" type="text/css">
</head>

<body>
<%@include file="header.jsp" %>
<form action="/saveTeamStart" method="Post">
<fieldset>
<legend>팀을 등록합시다 ^^</legend>
<ol>
  <li>
    <label for="userid">팀이름</label>
    <input id="teamName" name="teamName" type="text" required autofocus>
  </li>

</ol>
</fieldset>
<br/>

  <button type="submit"> 제출합니다 </button>

</form>
</body>
</html>



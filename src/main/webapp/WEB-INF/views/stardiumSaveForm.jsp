<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>

<form action="/saveMyHome" method="Post">
<fieldset>
<legend>야구장 등록페이지입니다^^</legend>
<ol>
  <li>
    <label for="userid">야구장이름</label>
    <input id="homename" name="homename" type="text" required autofocus>
  </li>

</ol>
</fieldset>
<br/>

  <button type="submit"> 제출합니다 </button>

</form>
</body>
</html>
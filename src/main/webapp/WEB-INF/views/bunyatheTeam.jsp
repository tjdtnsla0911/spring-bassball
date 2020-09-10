<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="container">
  <h2>Contextual Classes</h2>
  <p>Contextual classes can be used to color table rows or table cells. The classes that can be used are: .active, .success, .info, .warning, and .danger.</p>
  <table class="table">
    <thead>
      <tr>
        <th>포지션</th>
        <th>롯데자이언트</th>
        <th>치바이글스</th>
        <th>뉴욕양키즈</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="bunyas" items="${bunya}">






      <tr class="success">
        <td>${bunyas.position}</td>
        <td>${bunyas.lotte}</td>
        <td>${bunyas.chiba}</td>
       <td>${bunyas.nowyork}</td>

      </tr>
   </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<button onclick="saveTeam()">팀등록</button>
<button onclick="stardiumSaveForm()">야구장등록</button>
<br/>
<button onclick="teamList()">팀리스트</button>
<button onclick="bassball()">유저리스트</button>
<button onclick="homeLists()">홈리스트</button>
<button onclick="bunyaList()">분야별리스트</button>



<script>
function bunyaList(){
	location.href="/bunyaList";
}
function homeLists(){
	location.href="homeLists";
}
function bassball(){
	location.href="/bassball";
}
function teamList(){
	location.href="/teamList";
}
function saveTeam(){
	location.href="/saveTeam";
}

function stardiumSaveForm(){
	location.href="/saveHome";
}
</script>
</body>
</html>
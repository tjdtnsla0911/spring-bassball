<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>

<%@include file="header.jsp" %>

<div align="right">
              <button   data-toggle="modal" data-target="#myModal" style="WIDTH: 60pt; HEIGHT: 20pt">선수등록</button> <br />

         </div>

         	<form method="Post" action="/toroku">
							<div class="modal fade" id="myModal" class="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
							<h1>선수를 등록합시다!</h1>
							<br/>

							유저 이름 : <input type="text" id="name" name="name"><br/><br/>
							소속팀 : <input type="text" id="teamName" name="teamName"><br/><br/>
							포지션 :<input type="text" id="position" name="position"><br/><br/>
										</div>
										<div class="modal-body"></div>
										<div class="modal-footer">
										<input type="submit" value="등록하기"/>


											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>

						</div>
								</div>
							</div>
	</form>




<div class="container">
  <h2>베이스볼 선수리스트</h2>
  <table class="table">
    <thead>
      <tr class="success">
        <th>랭킹</th>
        <th>이름</th>
        <th>포지션</th>
        <th>소속팀</th>
        <th>가입날짜</th>
        <th>현재상태</th>
        <th>기능 </th>
      </tr>
    </thead>

    <tbody id="ajax">
    <c:forEach var="userLists" items="${userList}">

      <tr >
        <td>${userLists.rank}</td>
        <td>${userLists.name}</td>
        <td>${userLists.position}</td>
        <td>${userLists.teamName}</td>
        <td>${userLists.userCreateDate}</td>
        <td>${userLists.whatNowChange}</td>
        <td><a href="#" id="${userLists.id}" onclick="deleteUser(${userLists.id})"><img src="./hyujitong.png" style="width: 50px; height: 50px;"/></a></td>
      </tr>

      </c:forEach>
    </tbody>

  </table>
</div>


</body>


<script>
function deleteUser(id){
	console.log("원클릭에옴");
	console.log('받아온 e = ',id);

	$.ajax({
		type : "delete",
		url : "/userDelete/"+id,
		date : JSON.stringify(id),
		contentType: "application/json; charset=utf-8",
		dataType: "JSON",
		success:function(data){
			console.log("받은 data = "+data);
			$("#ajax").empty();

			for(var data2 of data){
				if(data2.name==null || data2.name=="null"){
					console.log();
					data.position = "";
				}
				if(data2.position==null || data2.position=="null"){
					console.log();
					data.position = "";
				}
				if(data2.teamName==null || data2.teamName=="null"){
					console.log();
					data.position = "";
				}

				var input_html =

					"      <tr >\r\n" +
					"        <td>"+data2.id+"</td>\r\n" +
					"        <td>"+data2.name+"</td>\r\n" +
					"        <td>"+data2.position+"</td>\r\n" +
					"        <td>"+data2.teamName+"</td>\r\n" +
					"        <td>"+data2.userCreateDate+"</td>\r\n" +
					"        <td>"+data2.whatNowChange+"</td>\r\n" +
					"        <td><a href=\"#\" id=\"${userLists.id}\" onclick=\"deleteUser("+data2.id+")\"><img src=\"./hyujitong.png\" style=\"width: 50px; height: 50px;\"/></a></td>\r\n" +
					"      </tr>";

			$("#ajax").append(input_html);
			}

		},
		error:function(e){
			alert("");
		}
	});
}

</script>
</html>

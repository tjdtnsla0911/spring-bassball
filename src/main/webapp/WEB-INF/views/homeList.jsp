<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp" %>
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

<div class="container">
  <h2>Contextual Classes</h2>
  <p>Contextual classes can be used to color table rows or table cells. The classes that can be used are: .active, .success, .info, .warning, and .danger.</p>
  <table class="table">
    <thead>
      <tr>
        <th>번호</th>
        <th>홈이름</th>
        <th>생성일</th>
        <th>기능</th>
      </tr>
    </thead>
    <tbody id="ajax">
<c:forEach var="homeList" items="${bomeList}">
      <tr class="danger">
        <td>${homeList.id}</td>
        <td>${homeList.homename}</td>
        <td>${homeList.homeCreateDate}</td>
        <td><a href="#" id="${homeList.id}" onclick="deleteHome(${homeList.id})"><img src="./hyujitong.png" style="width: 50px; height: 50px;"/></td>

      </tr>
</c:forEach>
    </tbody>
  </table>
</div>

</body>
<script>

function deleteHome(id){
	console.log("원클릭에옴");
	console.log('받아온 e = ',id);

	$.ajax({
		type : "delete",
		url : "/homeDelete/"+id,
		date : JSON.stringify(id),
		contentType: "application/json; charset=utf-8",
		dataType: "JSON",
		success:function(data){
			console.log("받은 data = "+data);
			$("#ajax").empty();

			for(var data2 of data){
				var input_html =

					" <tr class=\"danger\">\r\n" +
					"        <td>"+data2.id+"</td>\r\n" +
					"        <td>"+data2.homename+"</td>\r\n" +
					"        <td>$"+data2.homeCreateDate+"</td>\r\n" +
					"        <td><a href=\"#\" id=\""+data2.id+"\" onclick=\"deleteHome("+data2.id+")\"><img src=\"./hyujitong.png\" style=\"width: 50px; height: 50px;\"/></td>\r\n" +
					"    \r\n" +
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


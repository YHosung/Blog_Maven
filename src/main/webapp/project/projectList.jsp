<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- https://getbootstrap.com/ -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript">
	function clearErrorMessage() {
		document.getElementById("error-message").innerText="";
	}
</script>
<title>나만의 블로그</title>
</head>
<body>
	<div class="container w-75 mt-5 mx-auto">
		<h1>나만의 블로그</h1>
		<hr>
		<ul class="list-group">
			<c:forEach var="project" items="${projectlist }" varStatus="status">
				<li
					class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
					<a href="project.nhn?action=getProject&aid=${project.aid }"
					class="text-decoration-none"> [${status.count }]${project.title },${project.date }
				</a>
				<div class="btn-group">
				<!-- 수정버튼 -->
				 <a href="project.nhn?action=edtProject&aid=${project.aid}" class="btn btn-primary btn-sm">수정하기</a>
				 <!--삭제버튼 -->
				 <a href="project.nhn?action=delProject&aid=${project.aid }" class="btn btn-primary btn-sm">삭제하기</a>
                </div>
                
                </li>
			</c:forEach>
		</ul>

		<hr>
		<c:if test="${error!=null }">
			<div class="alert alert-danger" role="alert">
				에러발생:${error }
				<button type="button" class="btn-close" onclick="clearErrorMessage()"></button>
			</div>
		</c:if>

		<button type="button" class="btn btn-outline-info mb-3"
			data-bs-toggle="collapse" data-bs-target="#addForm"
			aria-expanded="false" aria-controls="addForm">블로그 등록</button>

		<div class="collapse" id="addForm">
			<div class="card card-body">
				<form action="/jwbook/project.nhn?action=addProject" method="post"
					enctype="multipart/form-data">
					<label class="form-label">제목 <input name="title" class="form-control"></label> 
					<label class="form-label">이미지 <input type="file" name="file" class="form-control"></label> 
					<label class="form-label">블로그 내용 <textarea name="content" class="form-control" cols="50" rows="5"></textarea></label>
					<button type="submit" class="btn btn-success mt-3">저장</button>

				</form>
			</div>
		</div>

		<button type="button" class="btn btn-outline-info mb-3"
        onclick="window.location.href='/jwbook/project/navigation.jsp'"
        style="text-decoration: none; color: skyblue;">
    뒤로가기
</button>
	</div>
</body>
</html>
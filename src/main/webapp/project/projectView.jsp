<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- https://getbootstrap.com/ -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>


<title>나만의 블로그 등록하기</title>
</head>
<body>
	<div class="container w-75 mt-5 mx-auto">
		<h2>${project.title }</h2>
		<hr>
		<div class="card w-75 mx-auto">
			<img class="card-img-top" src="/jwbook/img/${project.img}">
			<div class="card-body">
				<h4 class="card w-75 mx-auto">
					<div class="card-body">
				<h4 class="card-title">Date: ${project.date}</h4>
				<p class="card-text">Content: ${project.content}</p>

				</h4>
			</div>
		</div>
		<c:if test="${error!=null }">
			<div>
				 에러발생:${error }
				 <button type="button" class="btn-close"></button>
			</div>
		</c:if>
		<hr>
		<a href="javascript:history.back()"> << Back </a>
	</div>
</body>
</html>
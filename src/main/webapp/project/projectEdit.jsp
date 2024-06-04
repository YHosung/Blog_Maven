<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>나만의 블로그 수정하기</title>
</head>
<body>
    <div class="container w-75 mt-5 mx-auto">
        <h1>나만의 블로그 수정하기</h1>
        <hr>
        <form action="/jwbook/project.nhn?action=updateProject" method="post" enctype="multipart/form-data">
            <input type="hidden" name="aid" value="${project.aid}">
            <div class="mb-3">
                <label for="title" class="form-label">제목</label>
                <input type="text" id="title" name="title" class="form-control" value="${project.title}">
            </div>
            <div class="mb-3">
                <label for="file" class="form-label">이미지</label>
                <input type="file" id="file" name="file" class="form-control">
                <img src="/jwbook/${project.img}" alt="이미지 미리보기" class="mt-2" style="max-width: 100px;">
            </div>
            <div class="mb-3">
                <label for="content" class="form-label">블로그 내용</label>
                <textarea id="content" name="content" class="form-control" rows="5">${project.content}</textarea>
            </div>
            <button type="submit" class="btn btn-primary">수정 완료</button>
        </form>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style type="text/css">
	body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        
        .form-container {
            margin: 0 auto;
            width: 300px;
        }
        
        form div {
            margin-bottom: 10px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
        }
        
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        
        button:hover {
            background-color: #45a049;
        }
</style>
</head>
<body>
<h2>회원 정보</h2>
<c:if test="${not empty user}">
    <form action="/jwbook/user" method="POST">
        <input type="hidden" name="aid" value="${user.aid}" />
        <div>
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" value="${user.name}" required/>
        </div>
        <div>
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" value="${user.email}" required/>
        </div>
        <div>
            <label for="password">비밀번호:</label>
            <input type="text" id="password" name="password" value="${user.password}" required/>
        </div>
        <button type="submit">수정하기</button>
    </form>
</c:if>
<c:if test="${empty user}">
    <p>현재 로그인이 되어 있지 않습니다.</p>
    <span><a href="login.jsp">로그인</a>으로 이동</span>
</c:if>
</body>
</html>
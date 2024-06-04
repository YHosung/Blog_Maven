<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>블로그 메인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        header {
            background-color: #007bff;
            color: white;
            padding: 15px 0;
            text-align: center;
        }
        nav {
            background-color: #f0f0f0;
            padding: 10px 0;
            text-align: center;
        }
        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        nav ul li {
            display: inline;
            margin: 0 15px;
        }
        nav ul li a {
            text-decoration: none;
            color: #333;
        }
        nav ul li a:hover {
            color: #007bff;
        }
        .container {
            display: flex;
            padding: 20px;
        }
        .sidebar {
            width: 25%;
            background-color: #fff;
            padding: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-right: 20px;
        }
        .main-content {
            width: 75%;
            background-color: #fff;
            padding: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        footer {
            background-color: #5cb85c;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1>Blog Title</h1>
    </header>
    <nav>
        <ul>
            <li><a href="/jwbook/project.nhn?action=listProject">게시판</a></li>
            <% if(session.getAttribute("user") == null) { %>
                <li><a href="/jwbook/project/login.jsp">로그인</a></li>
                <li><a href="/jwbook/project/signup.html">회원가입</a></li>
            <% } else { %>
                <li><a href="/jwbook/user">회원정보</a></li>
                <li><a href="/jwbook/logout">로그아웃</a></li>
            <% } %>
        </ul>
    </nav>
    <div class="container">
        <div class="sidebar">
            <h2>블로그 메뉴</h2>
            <ul>
                <li><a href="#">카테고리 1</a></li>
                <li><a href="#">카테고리 2</a></li>
                <li><a href="#">카테고리 3</a></li>
                <li><a href="#">카테고리 4</a></li>
            </ul>
        </div>
        <div class="main-content">
            <h2>최근 게시물</h2>
            <p>여기에 최근 게시물 내용이 표시됩니다.</p>
           
        </div>
    </div>
    <footer>
        <p>Copyright © 2024 5Team. All rights reserved.</p>
    </footer>
</body>
</html>

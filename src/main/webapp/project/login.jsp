<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        #container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        h2 {
            text-align: center;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        p {
            text-align: center;
        }
    </style>
</head>
<body>
    <div id="container">
        <h2>로그인</h2>
        <form action="/jwbook/login" method="post">
            <label for="username">아이디:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="로그인">
        </form>
        <% if ("true".equals(request.getParameter("error"))) { %>
            <p style="color:red;"> 아이디 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.</p>
        <% } %>
        <br>
        <p>아직 계정이 없으신가요? <a href="signup.html">회원가입</a></p>
    </div>
</body>
</html>

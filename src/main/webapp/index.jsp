<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Library Management System</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #fbc2eb 0%, #a6c1ee 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: white;
            padding: 40px 60px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 400px;
        }

        h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 10px;
        }

        p {
            color: #666;
            font-size: 16px;
            margin-bottom: 30px;
        }

        a.button {
            display: inline-block;
            padding: 12px 25px;
            margin: 10px 5px;
            border-radius: 8px;
            background: #6a11cb;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s ease;
        }

        a.button:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #888;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>📚 Welcome to Library System</h1>
    <p>Manage your books with ease</p>

    <a class="button" href="register.jsp">Register</a>
    <a class="button" href="login.jsp">Login</a>

    <div class="footer">
       
    </div>
</div>

</body>
</html>

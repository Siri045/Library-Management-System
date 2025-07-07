<!-- style.jsp -->
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(to right, #a1c4fd, #c2e9fb);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .box {
        background: rgba(255, 255, 255, 0.95);
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        text-align: center;
        width: 350px;
        animation: slideIn 0.6s ease-in-out;
    }

    .box h1 {
        font-size: 26px;
        margin-bottom: 20px;
        color: #333;
    }

    .box input[type="text"],
    .box input[type="password"],
    .box input[type="submit"] {
        width: 90%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 10px;
        font-size: 15px;
    }

    .box input[type="submit"] {
        background-color: #4fc3f7;
        color: white;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .box input[type="submit"]:hover {
        background-color: #0288d1;
    }

    .box p {
        margin-top: 10px;
        font-size: 14px;
    }

    .box a {
        color: #0288d1;
        text-decoration: none;
    }

    @keyframes slideIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>

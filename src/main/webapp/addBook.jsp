<%@ page contentType="text/html;charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
    <title>Add New Book</title>
    <style>
        body {
            background: linear-gradient(to right, #f6d365, #fda085);
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 50px;
        }
        .form-container {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 4px 20px rgba(0,0,0,0.1);
            width: 400px;
        }
        input, select {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        button {
            background-color: #fca311;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #e07a0b;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add New Book</h2>
    <form action="AddBookServlet" method="post" enctype="multipart/form-data">
    
        <input type="text" name="title" placeholder="Book Title" required>
        <input type="text" name="author" placeholder="Author Name" required>
        <select name="category" required>
            <option value="">Select Category</option>
            <option value="Fiction">Fiction</option>
            <option value="Non-fiction">Non-fiction</option>
            <option value="Comics">Comics</option>
            <option value="Biography">Biography</option>
            <option value="Coding">Coding</option>
        </select>
        <input type="file" name="image" accept="image/*" required>
        <button type="submit">Add Book</button>
    </form>
</div>

</body>
</html>

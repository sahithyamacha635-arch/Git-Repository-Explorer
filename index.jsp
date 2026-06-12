<!DOCTYPE html>
<html>
<head>
    <title>GitHub Explorer</title>

    <style>

        body{
            background:#0d1117;
            color:white;
            font-family:Arial,sans-serif;
            text-align:center;
            padding:50px;
        }

        .container{
            max-width:700px;
            margin:auto;
            background:#161b22;
            padding:30px;
            border-radius:15px;
            box-shadow:0 0 15px rgba(88,166,255,0.3);
        }

        h1{
            color:#58a6ff;
        }

        h2{
            color:#58a6ff;
            margin-top:30px;
        }

        input{
            width:70%;
            padding:12px;
            border:none;
            border-radius:8px;
            margin-right:10px;
        }

        button{
            background:#238636;
            color:white;
            border:none;
            padding:12px 20px;
            border-radius:8px;
            cursor:pointer;
        }

        button:hover{
            background:#2ea043;
        }

        hr{
            margin:30px 0;
            border:1px solid #30363d;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>GitHub Explorer</h1>

    <h2>Profile Viewer</h2>

    <form action="profile" method="get">

        <input
                type="text"
                name="username"
                placeholder="Enter GitHub Username"
                required>

        <button type="submit">
            Search Profile
        </button>

    </form>

    <hr>

    <h2>Global Repository Search</h2>

    <form action="searchRepos" method="get">

        <input
                type="text"
                name="query"
                placeholder="Search GitHub Repositories"
                required>

        <button type="submit">
            Search Repository
        </button>

    </form>

</div>

</body>
</html>
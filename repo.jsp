<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>GitHub Profile</title>

    <style>
        body{
            font-family: Arial, sans-serif;
            background:#0d1117;
            color:white;
            text-align:center;
            padding:40px;
        }

        .card{
            background:#161b22;
            width:500px;
            margin:auto;
            padding:30px;
            border-radius:15px;
            box-shadow:0 0 15px rgba(88,166,255,0.3);
        }

        img{
            width:150px;
            border-radius:50%;
        }

        h1{
            color:#58a6ff;
        }

        p{
            margin:8px;
        }

        .btn{
            background:#238636;
            color:white;
            padding:10px 20px;
            text-decoration:none;
            border-radius:8px;
            margin:5px;
            display:inline-block;
        }
    </style>

</head>

<body>

<div class="card">

    <img src="<%=request.getAttribute("avatar")%>">

    <h1>
        <%=request.getAttribute("name")%>
    </h1>

    <h3>
        @<%=request.getAttribute("login")%>
    </h3>

    <p>
        <%=request.getAttribute("bio")%>
    </p>

    <hr>

    <p>
        Followers:
        <%=request.getAttribute("followers")%>
    </p>

    <p>
        Following:
        <%=request.getAttribute("following")%>
    </p>

    <p>
        Public Repositories:
        <%=request.getAttribute("repos")%>
    </p>

    <p>
        Location:
        <%=request.getAttribute("location")%>
    </p>

    <br>

    <a class="btn"
       href="https://github.com/<%=request.getAttribute("login")%>"
       target="_blank">
        View GitHub Profile
    </a>

    <a class="btn"
       href="repositories?username=<%=request.getAttribute("login")%>">
        View Repositories
    </a>

</div>

</body>
</html>
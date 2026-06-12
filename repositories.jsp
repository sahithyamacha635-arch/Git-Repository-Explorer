<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>

<!DOCTYPE html>
<html>
<head>
    <title>Repositories</title>

    <style>

        body{
            background:#0d1117;
            color:white;
            font-family:Arial, sans-serif;
            padding:20px;
        }

        h1{
            text-align:center;
            color:#58a6ff;
        }

        .container{
            display:grid;
            grid-template-columns:
                    repeat(auto-fit,minmax(300px,1fr));
            gap:20px;
        }

        .card{
            background:#161b22;
            border-radius:15px;
            padding:20px;
            transition:0.3s;
            box-shadow:
                    0 0 10px rgba(88,166,255,0.2);
        }

        .card:hover{
            transform:translateY(-5px);
        }

        .repo-name{
            color:#58a6ff;
            font-size:20px;
            font-weight:bold;
        }

        .btn{
            background:#238636;
            color:white;
            text-decoration:none;
            padding:10px 15px;
            border-radius:8px;
            display:inline-block;
            margin-top:10px;
        }

    </style>

</head>

<body>

<h1>
    Repositories of
    <%=request.getAttribute("username")%>
</h1>

<div class="container">

<%

JSONArray repos =
        (JSONArray) request.getAttribute("repositories");

for(int i=0;i<repos.length();i++){

    JSONObject repo =
            repos.getJSONObject(i);

%>

<div class="card">

    <div class="repo-name">
        <%=repo.getString("name")%>
    </div>

    <p>
        <%=repo.optString(
                "description",
                "No description"
        )%>
    </p>

    <p>
        ⭐ Stars:
        <%=repo.getInt("stargazers_count")%>
    </p>

    <p>
        🍴 Forks:
        <%=repo.getInt("forks_count")%>
    </p>

    <p>
        💻 Language:
        <%=repo.optString("language","N/A")%>
    </p>

    <p>
        📅 Updated:
        <%=repo.getString("updated_at")%>
    </p>

    <a class="btn"
       href="<%=repo.getString("html_url")%>"
       target="_blank">
        Open Repository
    </a>

</div>

<%
}
%>

</div>

</body>
</html>
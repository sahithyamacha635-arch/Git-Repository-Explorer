<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>

<!DOCTYPE html>
<html>
<head>
    <title>Repository Search Results</title>

    <style>

        body{
            background:#0d1117;
            color:white;
            font-family:Arial,sans-serif;
            padding:20px;
        }

        h1{
            text-align:center;
            color:#58a6ff;
        }

        .container{
            display:grid;
            grid-template-columns:
                    repeat(auto-fit,minmax(350px,1fr));
            gap:20px;
        }

        .card{
            background:#161b22;
            padding:20px;
            border-radius:15px;
            transition:.3s;
            box-shadow:
                    0 0 10px rgba(88,166,255,.2);
        }

        .card:hover{
            transform:translateY(-5px);
        }

        .avatar{
            width:60px;
            height:60px;
            border-radius:50%;
        }

        .repo{
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
    Search Results :
    <%=request.getAttribute("query")%>
</h1>

<div class="container">

<%

JSONArray repos =
        (JSONArray)request.getAttribute(
                "repositories"
        );

for(int i=0;i<repos.length();i++){

    JSONObject repo =
            repos.getJSONObject(i);

    JSONObject owner =
            repo.getJSONObject("owner");

%>

<div class="card">

    <img class="avatar"
         src="<%=owner.getString("avatar_url")%>">

    <br><br>

    <div class="repo">
        <%=repo.getString("full_name")%>
    </div>

    <p>
        <%=repo.optString(
                "description",
                "No description"
        )%>
    </p>

    <p>
        ⭐ Stars :
        <%=repo.getInt("stargazers_count")%>
    </p>

    <p>
        🍴 Forks :
        <%=repo.getInt("forks_count")%>
    </p>

    <p>
        🐞 Open Issues :
        <%=repo.getInt("open_issues_count")%>
    </p>

    <p>
        💻 Language :
        <%=repo.optString(
                "language",
                "N/A"
        )%>
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
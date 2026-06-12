package com.githubexplorer.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/searchRepos")
public class SearchRepositoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String query =
                request.getParameter("query");

        String apiUrl =
                "https://api.github.com/search/repositories?q="
                        + query.replace(" ", "%20");

        URL url = new URL(apiUrl);

        HttpURLConnection con =
                (HttpURLConnection) url.openConnection();

        con.setRequestMethod("GET");

        BufferedReader br =
                new BufferedReader(
                        new InputStreamReader(
                                con.getInputStream()
                        )
                );

        StringBuilder result =
                new StringBuilder();

        String line;

        while((line = br.readLine()) != null){
            result.append(line);
        }

        br.close();

        JSONObject json =
                new JSONObject(result.toString());

        JSONArray items =
                json.getJSONArray("items");

        request.setAttribute(
                "repositories",
                items
        );

        request.setAttribute(
                "query",
                query
        );

        request.getRequestDispatcher(
                "searchResults.jsp"
        ).forward(request,response);
    }
}
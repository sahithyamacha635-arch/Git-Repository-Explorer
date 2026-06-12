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

@WebServlet("/repositories")
public class RepositoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String apiUrl =
                "https://api.github.com/users/"
                        + username
                        + "/repos";

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

        while ((line = br.readLine()) != null) {
            result.append(line);
        }

        br.close();

        JSONArray repos =
                new JSONArray(result.toString());

        request.setAttribute(
                "repositories",
                repos
        );

        request.setAttribute(
                "username",
                username
        );

        request.getRequestDispatcher(
                "repositories.jsp"
        ).forward(request, response);
    }
}
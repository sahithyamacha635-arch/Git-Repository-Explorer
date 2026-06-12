package com.githubexplorer.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");

        String apiUrl =
                "https://api.github.com/users/" + username;

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

        JSONObject user =
                new JSONObject(result.toString());

        request.setAttribute(
                "avatar",
                user.optString("avatar_url")
        );

        request.setAttribute(
                "name",
                user.optString("name")
        );

        request.setAttribute(
                "login",
                user.optString("login")
        );

        request.setAttribute(
                "bio",
                user.optString("bio")
        );

        request.setAttribute(
                "followers",
                user.optInt("followers")
        );

        request.setAttribute(
                "following",
                user.optInt("following")
        );

        request.setAttribute(
                "repos",
                user.optInt("public_repos")
        );

        request.setAttribute(
                "location",
                user.optString("location")
        );

        request.getRequestDispatcher("repo.jsp")
                .forward(request, response);
    }
}
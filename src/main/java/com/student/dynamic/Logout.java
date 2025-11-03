package com.student.dynamic;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get current session, if it exists
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Invalidate session to log out the user
            session.invalidate();
        }

        // Redirect to login page after logout
        response.sendRedirect("login.jsp");
    }
}

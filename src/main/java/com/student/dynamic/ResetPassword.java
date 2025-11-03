package com.student.dynamic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import conn.Connector;
import studentDAO.StudentDAO;
import studentDAO.StudentDAOImp;
import studentDTO.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/resetPassword")
public class ResetPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String newPass = req.getParameter("newPassword");
        String confirmPass = req.getParameter("confirmPassword");

        // 1️⃣ Validate that both passwords match
        if (!newPass.equals(confirmPass)) {
            req.setAttribute("error", "❌ Passwords do not match!");
            RequestDispatcher rd = req.getRequestDispatcher("resetPassword.jsp");
            rd.forward(req, resp);
            return;
        }

        try (Connection con = Connector.getConnection()) {
            // 2️⃣ Find the student by email
            String query = "SELECT id FROM student WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");

                // 3️⃣ Create Student object and update password
                Student s = new Student();
                s.setId(id);
                s.setPass(newPass);

                StudentDAO dao = new StudentDAOImp();
                boolean updated = dao.updateStudent(s);

                if (updated) {
                    req.setAttribute("success", "✅ Password reset successful! You can now log in.");
                    RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                    rd.forward(req, resp);
                } else {
                    req.setAttribute("error", "⚠️ Failed to reset password. Try again.");
                    RequestDispatcher rd = req.getRequestDispatcher("resetPassword.jsp");
                    rd.forward(req, resp);
                }

            } else {
                req.setAttribute("error", "⚠️ Email not found in the system.");
                RequestDispatcher rd = req.getRequestDispatcher("resetPassword.jsp");
                rd.forward(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "❌ Server error: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("resetPassword.jsp");
            rd.forward(req, resp);
        }
    }
}

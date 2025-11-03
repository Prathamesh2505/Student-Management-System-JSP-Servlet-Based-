package com.student.dynamic;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import studentDAO.StudentDAO;
import studentDAO.StudentDAOImp;

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        StudentDAO dao = new StudentDAOImp();
        boolean deleted = dao.deleteStudent(id);

        if (deleted) {
            req.setAttribute("success", "User deleted successfully!");
        } else {
            req.setAttribute("error", "Failed to delete user.");
        }

        RequestDispatcher rd = req.getRequestDispatcher("viewUser.jsp");
        rd.forward(req, resp);
    }
}

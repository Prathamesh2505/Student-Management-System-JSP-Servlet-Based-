package com.student.dynamic;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import studentDAO.StudentDAO;
import studentDAO.StudentDAOImp;
import studentDTO.Student;
@WebServlet("/forgotpassword")
public class ForgotPassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Student s =null;
		StudentDAO st = new StudentDAOImp();
		PrintWriter out=resp.getWriter();
		s = st.getStudent(Long.parseLong(req.getParameter("phone")), req.getParameter("email"));
		
		if(req.getParameter("password").equals(req.getParameter("confirmPassword"))) {
			if(s.getPass().equals(req.getParameter("password"))) {
				out.print("<h1>This Password is already used kindley use password before not used</h1>");
			}
			else {
				s.setPass(req.getParameter("password"));
				if(st.updateStudent(s)) {
					out.print("Password changed");
				}
				else {
					out.println("Something went wrong");
				}
			}
		}
		else {
			out.println("<h2>Password mismached");
		}
	}
}

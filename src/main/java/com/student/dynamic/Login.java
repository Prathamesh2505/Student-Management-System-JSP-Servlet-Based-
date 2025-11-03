package com.student.dynamic;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import studentDAO.StudentDAO;
import studentDAO.StudentDAOImp;
import studentDTO.Student;

@WebServlet("/login")
public class Login extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Student s = null;
		HttpSession session=req.getSession(true);
		StudentDAO st = new StudentDAOImp();
		PrintWriter out=resp.getWriter();
		s = st.getStudent(req.getParameter("email"), req.getParameter("password"));
		if (s!=null) {
//			out.println("<h1>You are logged in!...</h1>");
			session.setAttribute("Student", s);
			req.setAttribute("success","Logged in successfully!" );
			RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
			rd.forward(req, resp);
		}
		else {
//			out.println("<h1>Failed to login</h1>");
			req.setAttribute("error","Failed to log in");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
	}
}

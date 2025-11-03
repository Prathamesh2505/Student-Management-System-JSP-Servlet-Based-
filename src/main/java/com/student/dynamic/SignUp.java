package com.student.dynamic;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import studentDAO.StudentDAO;
import studentDAO.StudentDAOImp;
import studentDTO.Student;

@WebServlet("/Signup")
public class SignUp extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Student s = new Student();
		StudentDAO st = new StudentDAOImp();
		PrintWriter out = resp.getWriter();

		s.setName(req.getParameter("name"));
		s.setPhone(Long.parseLong(req.getParameter("phone")));
		s.setEmail(req.getParameter("email"));
		s.setBranch(req.getParameter("branch"));
		s.setLoc(req.getParameter("loc"));
		String pass = req.getParameter("pass");
		String confirm = req.getParameter("confirmPass");

		if (pass.equals(confirm)) {
			s.setPass(pass);
			
			
			if (st.insertStudent(s)) {
//				out.println("<h1>Data saved successfully!</h1>");
				req.setAttribute("success","Data saved successfully!" );
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			} 
			else {
				out.println("<h2>Data not saved.</h2>");
				req.setAttribute("error","Data Failed to Save!" );
				RequestDispatcher rd=req.getRequestDispatcher("SignUp.jsp");
				rd.forward(req, resp);
			}
		} 
		else {
//			out.println("<h2>Password mismatch or empty fields!</h2>");
			req.setAttribute("error","Password mismatch or empty fields!" );
			RequestDispatcher rd=req.getRequestDispatcher("SignUp.jsp");
			rd.forward(req, resp);
		
		}
	}
}
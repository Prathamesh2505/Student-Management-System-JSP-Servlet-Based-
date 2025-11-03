package com.student.dynamic;

import java.io.IOException;

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

@WebServlet("/updateStudent")
public class UpdateAccount extends HttpServlet{
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			StudentDAO st=new StudentDAOImp();
			HttpSession session=req.getSession(false);
			   if (session == null) {
		            req.setAttribute("fails", "Session expired. Please log in again.");
		            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
		            rd.forward(req, resp);
		            return;
		        }
			Student s=(Student)session.getAttribute("Student");
			if(s!=null) {
				s.setName(req.getParameter("name"));
				s.setPhone(Long.parseLong(req.getParameter("phone")));
				s.setEmail(req.getParameter("email"));
				s.setBranch(req.getParameter("branch"));
				s.setLoc(req.getParameter("loc"));
				if(st.updateStudentData(s)) {
					session.setAttribute("Student", s);
					req.setAttribute("success", "Account update Succesfully");
					RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
					rd.forward(req, resp);
					
				}
				else {
					req.setAttribute("fails", "Not yet Updated");
					RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
					rd.forward(req, resp);
				}	
			}
		}
}
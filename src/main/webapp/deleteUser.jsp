<%@ page import="studentDAO.StudentDAO"%>
<%@ page import="studentDAO.StudentDAOImp"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="studentDTO.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete User</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #0d6efd, #6610f2);
        color: white;
        text-align: center;
        padding: 80px;
    }
    .container {
        background-color: rgba(255,255,255,0.1);
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.2);
        width: 50%;
        margin: auto;
    }
    h2 {
        margin-bottom: 25px;
    }
    .btn-danger {
        background-color: #dc3545;
        border: none;
    }
    .btn-danger:hover {
        background-color: #b02a37;
    }
    .btn-secondary {
        background-color: #6c757d;
        border: none;
    }
    .btn-secondary:hover {
        background-color: #565e64;
    }
</style>
</head>
<body>

<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("Student") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Student loggedUser = (Student) sess.getAttribute("Student");

    // ✅ Only admin (id = 1) can delete users
    if (loggedUser.getId() != 1) {
        response.sendRedirect("Dashboard.jsp");
        return;
    }

    String idParam = request.getParameter("id");
    if (idParam == null || idParam.isEmpty()) {
        out.println("<h3>Error: Invalid user ID.</h3>");
        return;
    }

    int id = Integer.parseInt(idParam);
    StudentDAO dao = new StudentDAOImp();

    // ✅ If delete is confirmed
    if ("true".equals(request.getParameter("confirm"))) {
        boolean deleted = dao.deleteStudent(id);
        if (deleted) {
            response.sendRedirect("viewuser");
            return;
        } else {
            out.println("<h3>Error deleting user. Please try again.</h3>");
        }
    }
%>

<div class="container">
    <h2>Confirm User Deletion</h2>
    <p>Are you sure you want to delete user with ID: <strong><%= id %></strong>?</p>
    <div class="mt-4">
        <a href="deleteuser.jsp?id=<%= id %>&confirm=true" class="btn btn-danger btn-lg me-3">Yes, Delete</a>
        <a href="viewuser" class="btn btn-secondary btn-lg">Cancel</a>
    </div>
</div>

</body>
</html>

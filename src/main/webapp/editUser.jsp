<%@page import="studentDAO.StudentDAO"%>
<%@page import="studentDAO.StudentDAOImp"%>
<%@page import="studentDTO.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #ffb347, #ffcc33);
        font-family: 'Poppins', sans-serif;
    }
    .container {
        margin-top: 60px;
        background: #fff;
        padding: 40px 30px;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.25);
        max-width: 600px;
    }
    h2 {
        text-align: center;
        color: #ff8800;
        font-weight: 600;
        margin-bottom: 25px;
    }
    .btn-submit {
        background-color: #ff8800;
        color: white;
        border-radius: 8px;
        padding: 10px 25px;
        border: none;
        transition: 0.3s;
    }
    .btn-submit:hover {
        background-color: #e06f00;
    }
</style>
</head>
<body>

<%
    int id = 0;
    Student s = null;

    try {
        id = Integer.parseInt(request.getParameter("id"));
        StudentDAO dao = new StudentDAOImp();
        s = dao.getStudentById(id);
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (s == null) {
%>
        <h3 style="color:red; text-align:center;">No student found with the given ID!</h3>
        <a href="viewUser.jsp" style="display:block; text-align:center;">Go Back</a>
<%
        return;
    }
%>
<div class="container">
    <h2>Edit Student Details</h2>
    <form action="editUser" method="post">
        <input type="hidden" name="id" value="<%= s.getId() %>">

        <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" name="name" class="form-control" value="<%= s.getName() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Phone</label>
            <input type="text" name="phone" class="form-control" value="<%= s.getPhone() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" value="<%= s.getEmail() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Branch</label>
            <input type="text" name="branch" class="form-control" value="<%= s.getBranch() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Location</label>
            <input type="text" name="loc" class="form-control" value="<%= s.getLoc() %>" required>
        </div>

        <div class="text-center">
            <button type="submit" class="btn-submit">Save Changes</button>
            <a href="viewuser" class="btn btn-secondary ms-2">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>

<%@page import="java.util.List"%>
<%@page import="studentDTO.Student"%>
<%@page import="studentDAO.StudentDAO"%>
<%@page import="studentDAO.StudentDAOImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Users</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
/* Orange-Yellow Theme CSS */

/* Background */
body {
  background: linear-gradient(135deg, #ffb84d, #ff751a);
  font-family: 'Poppins', sans-serif;
  color: #333;
  margin: 0;
  padding: 0;
  min-height: 100vh;
}

/* Navbar */
.navbar {
  background: linear-gradient(90deg, #ff9900, #ff6600);
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px 30px;
  color: white;
  box-shadow: 0 4px 10px rgba(255, 102, 0, 0.3);
}

.navbar-left {
  font-weight: 600;
  font-size: 18px;
}

.navbar-right a {
  color: white;
  margin-right: 15px;
  text-decoration: none;
  font-weight: 500;
  transition: 0.3s;
}

.navbar-right a:hover {
  color: #ffe6b3;
}

.logout-btn {
  background: linear-gradient(45deg, #ff4d4d, #e60000);
  border: none;
  color: white;
  padding: 6px 14px;
  border-radius: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.logout-btn:hover {
  background: linear-gradient(45deg, #ff3333, #cc0000);
  transform: scale(1.05);
}

/* Container */
.container {
  background: #fff;
  border-radius: 20px;
  box-shadow: 0 4px 20px rgba(255, 140, 0, 0.3);
  padding: 40px;
  width: 95%;
  max-width: 1000px;
  margin-top: 50px;
  margin-bottom: 40px;
  transition: all 0.3s ease-in-out;
}

.container:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 25px rgba(255, 140, 0, 0.5);
}

/* Table */
table {
  width: 100%;
  border-collapse: collapse;
  text-align: center;
  margin-top: 20px;
}

th {
  background: linear-gradient(90deg, #ff9900, #ff8000);
  color: white;
  padding: 12px;
  font-weight: 600;
  letter-spacing: 0.5px;
}

td {
  background-color: #fff7e6;
  padding: 10px;
  border-bottom: 1px solid #ffd699;
}

tr:hover td {
  background-color: #ffe0b3;
  transition: 0.3s;
}

/* Buttons */
.btn {
  border: none;
  padding: 8px 14px;
  border-radius: 25px;
  color: white;
  font-weight: 500;
  cursor: pointer;
  transition: 0.3s;
  text-decoration: none;
  display: inline-block;
}

.btn-primary {
  background: linear-gradient(45deg, #ffb84d, #ff8000);
}

.btn-primary:hover {
  background: linear-gradient(45deg, #ff9933, #e67300);
  transform: scale(1.05);
}

.btn-danger {
  background: linear-gradient(45deg, #ff4d4d, #e60000);
}

.btn-danger:hover {
  background: linear-gradient(45deg, #ff3333, #cc0000);
  transform: scale(1.05);
}

/* Footer */
footer {
  text-align: center;
  color: #804000;
  font-size: 14px;
  margin-top: 30px;
  padding-bottom: 20px;
}
</style>
</head>

<body>
	<%
	// ✅ Session validation
	if (session == null || session.getAttribute("Student") == null) {
		response.sendRedirect("login.jsp");
		return;
	}

	Student loggedUser = (Student) session.getAttribute("Student");

	// ✅ Allow only admin (id == 1)
	if (loggedUser.getId() != 1) {
		response.sendRedirect("Dashboard.jsp");
		return;
	}

	StudentDAO dao = new StudentDAOImp();
	List<Student> list = dao.getAllStudent();
	%>

	<!-- ✅ Navbar -->
	<div class="navbar">
		<div class="navbar-left">
			Welcome, <%=loggedUser.getName()%>
		</div>
		<div class="navbar-right">
			<a href="Dashboard.jsp">Dashboard</a>
			<a href="Update.jsp">Update</a>
			<a href="resetPassword.jsp">Reset Password</a>
			<form action="logout" method="post" style="display:inline;">
				<button class="logout-btn" type="submit">Logout</button>
			</form>
		</div>
	</div>

	<!-- ✅ User Table -->
	<div class="container">
		<h2 class="text-center mt-3 mb-4 text-warning fw-bold">All Registered Users</h2>

		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Phone</th>
					<th>Email</th>
					<th>Branch</th>
					<th>Location</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Student s : list) {
				%>
				<tr>
					<td><%=s.getId()%></td>
					<td><%=s.getName()%></td>
					<td><%=s.getPhone()%></td>
					<td><%=s.getEmail()%></td>
					<td><%=s.getBranch()%></td>
					<td><%=s.getLoc()%></td>
					<td>
						<a href="editUser.jsp?id=<%=s.getId()%>" class="btn btn-primary btn-sm">Edit</a>
						<a href="deleteUser?id=<%=s.getId()%>" class="btn btn-danger btn-sm">Delete</a>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<footer>
		<p>© 2025 Student Management System | Orange-Yellow Theme</p>
	</footer>

</body>
</html>

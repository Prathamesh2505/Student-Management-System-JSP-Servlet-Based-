<%@page import="studentDTO.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
/* ✨ Modern Gradient Background */
body {
	background: linear-gradient(135deg, #f9d423, #ff4e50);
	font-family: 'Poppins', sans-serif;
	min-height: 100vh;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	animation: fadeIn 1.2s ease-in-out;
}

/* 🌈 Fade-in Animation */
@keyframes fadeIn {
	from { opacity: 0; transform: translateY(15px); }
	to { opacity: 1; transform: translateY(0); }
}

/* 🌟 Navbar (Glassmorphic Style) */
.navbar {
	width: 100%;
	margin-bottom: 40px;
	padding: 15px 30px;
	backdrop-filter: blur(10px);
	background: rgba(0, 0, 0, 0.6);
	box-shadow: 0 5px 25px rgba(0,0,0,0.4);
	border-bottom: 2px solid rgba(255, 204, 51, 0.7);
}

.navbar-brand {
	font-weight: 600;
	font-size: 22px;
	color: #ffcc33 !important;
	text-transform: capitalize;
	text-shadow: 0 0 5px rgba(255,255,255,0.3);
}

.navbar-nav .nav-link {
	color: #f8f8f8 !important;
	font-weight: 500;
	margin: 0 12px;
	transition: all 0.3s ease;
	position: relative;
}

.navbar-nav .nav-link::after {
	content: "";
	position: absolute;
	left: 0;
	bottom: -2px;
	width: 0%;
	height: 2px;
	background: #ffcc33;
	transition: width 0.3s ease;
}

.navbar-nav .nav-link:hover::after {
	width: 100%;
}

.navbar-nav .nav-link:hover {
	color: #ffcc33 !important;
	transform: translateY(-1px);
}

/* 📋 Glass Card Container */
.table-container {
	max-width: 950px;
	width: 90%;
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(10px);
	border-radius: 20px;
	padding: 40px;
	margin-bottom: 40px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
	transition: all 0.4s ease;
	border: 1px solid rgba(255, 255, 255, 0.3);
}

.table-container:hover {
	transform: translateY(-5px);
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.35);
}

/* 🧾 Headings */
h3 {
	font-weight: 700;
	color: #fff;
	margin-bottom: 25px;
	text-align: center;
	text-shadow: 0 2px 5px rgba(0,0,0,0.3);
	letter-spacing: 1px;
}

/* 🧮 Table Styling */
.table {
	border-radius: 12px;
	overflow: hidden;
	background-color: rgba(255, 255, 255, 0.85);
}

th {
	background: linear-gradient(90deg, #212529, #343a40);
	color: #ffcc33;
	text-align: center;
	font-weight: 600;
	font-size: 15px;
	padding: 14px;
	letter-spacing: 0.4px;
}

td {
	text-align: center;
	color: #333;
	font-size: 15px;
	padding: 12px;
	background-color: rgba(255, 255, 255, 0.9);
}

tr:hover td {
	background-color: #fff6d5;
	transition: background-color 0.3s ease;
}

/* ✅ Success message */
h1.text-success {
	font-size: 20px;
	font-weight: 600;
	color: #155724 !important;
	background: #d4edda;
	padding: 10px 25px;
	border-radius: 10px;
	display: inline-block;
	margin-top: 15px;
	box-shadow: 0 2px 6px rgba(0,0,0,0.15);
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
/* 🌐 Responsive */
@media (max-width: 768px) {
	.table-container {
		padding: 25px;
	}
	th, td {
		font-size: 13px;
	}
	.navbar-brand {
		font-size: 18px;
	}
}
</style>
</head>

<body>
<%
    Student s = (Student) session.getAttribute("Student");
%>

<% if(session.getAttribute("success") != null) { %>
	<h1 class="text-success text-center mt-3"><%= request.getAttribute("success") %></h1>
<% } %>

<!-- 🌟 Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <a class="navbar-brand" href="#">Welcome <%= s.getName() %></a>

  <button class="navbar-toggler" type="button" data-toggle="collapse"
      data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false"
      aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
          <% if(s.getId() == 1) { %>
          <li class="nav-item">
              <a class="nav-link" href="viewUser.jsp">View Users<span class="sr-only">(current)</span></a>
          <% } %>
          </li>

          <li class="nav-item">
              <a class="nav-link" href="Update.jsp">Update</a>
          </li>

          <li class="nav-item">
              <a class="nav-link" href="resetPassword.jsp">Reset Password</a>
          </li>
          <form action="logout" method="post" style="display:inline;">
				<button class="logout-btn" type="submit">Logout</button>
			</form>
      </ul>
  </div>
</nav>

<!-- 📋 User Info Card -->
<div class="table-container">
	<h3>User Details</h3>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Branch</th>
				<th>Location</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%= s.getId() %></td>
				<td><%= s.getName() %></td>
				<td><%= s.getPhone() %></td>
				<td><%= s.getEmail() %></td>
				<td><%= s.getBranch() %></td>
				<td><%= s.getLoc() %></td>
			</tr>
		</tbody>
	</table>
</div>

</body>
</html>

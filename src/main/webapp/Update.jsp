<%@page import="studentDTO.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Details</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<style>
/* 🌅 Background with soft animation */
body {
	background: linear-gradient(135deg, #ffb347, #ffcc33);
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: 'Poppins', sans-serif;
	color: #333;
	margin: 0;
	overflow: hidden;
	animation: gradientMove 10s ease infinite alternate;
}

@keyframes gradientMove {
	from { background-position: 0% 50%; }
	to { background-position: 100% 50%; }
}

/* ✨ Glassmorphic Card */
.card {
	width: 440px;
	backdrop-filter: blur(12px);
	background: rgba(255, 255, 255, 0.15);
	border-radius: 20px;
	border: 1px solid rgba(255, 255, 255, 0.3);
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	padding: 45px 40px;
	color: #fff;
	text-align: center;
	transition: transform 0.4s ease, box-shadow 0.4s ease;
}

.card:hover {
	transform: translateY(-8px);
	box-shadow: 0 25px 45px rgba(0, 0, 0, 0.25);
}

/* 🌟 Heading */
h2 {
	font-weight: 700;
	color: #fff;
	text-transform: uppercase;
	letter-spacing: 1px;
	margin-bottom: 25px;
	text-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
}

/* 🧾 Labels and Inputs */
label {
	font-weight: 500;
	color: #fff;
	text-align: left;
	display: block;
	margin-bottom: 6px;
}

.form-control {
	border-radius: 12px;
	padding: 12px;
	border: 1.5px solid rgba(255, 255, 255, 0.4);
	background: rgba(255, 255, 255, 0.2);
	color: #fff;
	font-size: 15px;
	box-shadow: inset 0 1px 5px rgba(255,255,255,0.1);
	transition: 0.3s ease;
}

.form-control:focus {
	background: rgba(255, 255, 255, 0.3);
	border-color: #ffcc33;
	box-shadow: 0 0 10px #ffcc33;
	outline: none;
}

/* 🎨 Buttons */
.btn {
	border-radius: 12px;
	font-weight: 600;
	padding: 10px 22px;
	transition: all 0.3s ease;
}

.btn-primary {
	background: linear-gradient(90deg, #ffb347, #ffcc33);
	border: none;
	color: #222;
	box-shadow: 0 0 12px rgba(255, 204, 51, 0.6);
}

.btn-primary:hover {
	background: linear-gradient(90deg, #ffcc33, #ffb347);
	transform: scale(1.07);
	box-shadow: 0 0 18px rgba(255, 204, 51, 0.9);
	color: #000;
}

.btn-secondary {
	background: rgba(255,255,255,0.2);
	color: #fff;
	border: 1px solid rgba(255,255,255,0.3);
}

.btn-secondary:hover {
	background: rgba(255,255,255,0.3);
	transform: scale(1.05);
	color: #000;
}

/* 🔗 Login link */
.text-center a {
	color: #fff;
	font-weight: 500;
	text-decoration: none;
	transition: 0.3s;
}

.text-center a:hover {
	color: #ffcc33;
	text-shadow: 0 0 10px #ffcc33;
}

/* ✨ Input placeholder */
::placeholder {
	color: rgba(255, 255, 255, 0.7);
}

/* 📱 Responsive */
@media (max-width: 480px) {
	.card {
		width: 90%;
		padding: 25px 20px;
	}
	h2 {
		font-size: 22px;
	}
}
</style>
</head>

<body>
	<%
	Student s = (Student) session.getAttribute("Student");
	if (s != null) {
	%>

	<div class="card">
		<h2>Update Details</h2>
		<form action="updateStudent" method="post">
			<div class="form-group">
				<label>ID</label>
				<input type="text" name="id" class="form-control" 
				       value="<%=s.getId()%>" readonly>
			</div>

			<div class="form-group">
				<label>Name</label>
				<input type="text" name="name" class="form-control" 
				       value="<%=s.getName()%>" required>
			</div>

			<div class="form-group">
				<label>Phone</label>
				<input type="text" name="phone" class="form-control"
				       value="<%=s.getPhone()%>" required>
			</div>

			<div class="form-group">
				<label>Email</label>
				<input type="email" name="email" class="form-control"
				       value="<%=s.getEmail()%>" required>
			</div>

			<div class="form-group">
				<label>Branch</label>
				<input type="text" name="branch" class="form-control"
				       value="<%=s.getBranch()%>" required>
			</div>

			<div class="form-group">
				<label>Location</label>
				<input type="text" name="loc" class="form-control"
				       value="<%=s.getLoc()%>" required>
			</div>

			<div class="d-flex justify-content-between mt-4">
				<a href="Dashboard.jsp" class="btn btn-secondary">Back</a>
				<button type="submit" class="btn btn-primary">Update</button>
			</div>

			<div class="text-center mt-4">
				<a href="login.jsp">Already have an account? Login</a>
			</div>
		</form>
	</div>

	<%
	} else {
		request.setAttribute("error", "Session expired. Please log in again.");
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}
	%>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up | Student Portal</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
/* ---------- General Page Styling ---------- */
body {
	margin: 0;
	padding: 0;
	height: 100vh;
	font-family: 'Poppins', sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, #ffb347, #ffcc33);
}

/* ---------- Form Card ---------- */
.signup form {
	background-color: #fff;
	padding: 45px 40px;
	border-radius: 20px;
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25);
	width: 400px;
	display: flex;
	flex-direction: column;
	gap: 16px;
	animation: fadeIn 0.7s ease-in-out;
}

/* ---------- Headings ---------- */
h2 {
	text-align: center;
	color: #333;
	font-weight: 600;
	letter-spacing: 0.6px;
	margin-bottom: 5px;
}

/* ---------- Input & Select Fields ---------- */
form input,
form select {
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 10px;
	font-size: 15px;
	outline: none;
	transition: all 0.3s ease;
	background-color: #fafafa;
}

form input:focus,
form select:focus {
	border-color: #ff8800;
	background-color: #fff;
	box-shadow: 0 0 6px rgba(255, 136, 0, 0.35);
}

/* ---------- Submit Button ---------- */
form input[type="submit"] {
	background: linear-gradient(90deg, #ff8800, #ffb347);
	color: white;
	font-weight: 600;
	cursor: pointer;
	border: none;
	transition: all 0.3s ease;
	border-radius: 10px;
	padding: 12px;
}

form input[type="submit"]:hover {
	background: linear-gradient(90deg, #ffb347, #ff8800);
	transform: translateY(-2px);
	box-shadow: 0 5px 12px rgba(255, 136, 0, 0.4);
}

/* ---------- Error Message ---------- */
.error {
	color: #e63946;
	text-align: center;
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 5px;
}

/* ---------- Link Section ---------- */
.text-center {
	text-align: center;
	margin-top: 10px;
}

.text-center a {
	color: #ff8800;
	text-decoration: none;
	font-weight: 500;
	transition: color 0.3s ease;
}

.text-center a:hover {
	color: #e06f00;
	text-decoration: underline;
}

/* ---------- Animation ---------- */
@keyframes fadeIn {
	from {
		opacity: 0;
		transform: translateY(-20px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}
</style>
</head>

<body>
	<div class="signup">
		<form action="Signup" method="post">
			<h2>Create Account</h2>

			<% if (request.getAttribute("error") != null) { %>
				<div class="error"><%= request.getAttribute("error") %></div>
			<% } %>

			<input type="text" name="name" placeholder="Enter full name" required>
			<input type="tel" name="phone" placeholder="Enter phone number" required>
			<input type="email" name="email" placeholder="Enter email address" required>

			<select name="branch" required>
				<option value="" disabled selected>Select Branch</option>
				<option>CSE</option>
				<option>ECE</option>
				<option>Electrical</option>
				<option>Civil</option>
				<option>Mechanical</option>
			</select>

			<select name="loc" required>
				<option value="" disabled selected>Select Location</option>
				<option>Pune</option>
				<option>Mumbai</option>
				<option>Bangalore</option>
				<option>Chennai</option>
			</select>

			<input type="password" name="pass" placeholder="Password" required>
			<input type="password" name="confirmPass" placeholder="Confirm Password" required>

			<input type="submit" value="Sign Up">

			<div class="text-center mt-3">
				<a href="login.jsp">Already have an account? Login</a>
			</div>
		</form>
	</div>
</body>
</html>

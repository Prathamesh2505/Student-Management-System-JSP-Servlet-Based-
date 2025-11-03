<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<style>
	/* ---------- Page Layout ---------- */
	body {
		background: linear-gradient(135deg, #ffb347, #ffcc33);
		font-family: 'Poppins', sans-serif;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
		margin: 0;
	}

	/* ---------- Card ---------- */
	.card {
		background-color: #fff;
		border-radius: 20px;
		box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
		padding: 40px 35px;
		width: 400px;
		transition: transform 0.3s ease, box-shadow 0.3s ease;
		animation: fadeIn 0.7s ease-in-out;
	}

	.card:hover {
		transform: translateY(-5px);
		box-shadow: 0 12px 25px rgba(0, 0, 0, 0.25);
	}

	/* ---------- Heading ---------- */
	h2 {
		text-align: center;
		color: #333;
		font-weight: 600;
		letter-spacing: 0.5px;
		margin-bottom: 25px;
	}

	/* ---------- Input Fields ---------- */
	.form-control {
		border-radius: 10px;
		border: 1px solid #ccc;
		padding: 12px;
		font-size: 15px;
		transition: all 0.3s ease;
	}

	.form-control:focus {
		border-color: #ff8800;
		box-shadow: 0 0 6px rgba(255, 136, 0, 0.3);
	}

	/* ---------- Button ---------- */
	.btn-custom {
		background-color: #ff8800;
		color: #fff;
		border-radius: 10px;
		width: 100%;
		font-weight: 600;
		padding: 12px;
		border: none;
		transition: all 0.3s ease;
	}

	.btn-custom:hover {
		background-color: #e06f00;
		transform: translateY(-2px);
		box-shadow: 0 4px 8px rgba(255, 136, 0, 0.3);
	}

	/* ---------- Messages ---------- */
	.message {
		text-align: center;
		margin-bottom: 10px;
		font-weight: 600;
		font-size: 15px;
	}

	.success {
		color: #28a745;
	}

	.error {
		color: #e63946;
	}

	/* ---------- Links ---------- */
	a {
		color: #b55e00;
		text-decoration: none;
		font-weight: 500;
	}

	a:hover {
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
	<div class="card">
		<h2>Reset Password</h2>

		<% if (request.getAttribute("success") != null) { %>
			<div class="message success"><%= request.getAttribute("success") %></div>
		<% } else if (request.getAttribute("error") != null) { %>
			<div class="message error"><%= request.getAttribute("error") %></div>
		<% } %>

		<form action="forgotpassword" method="post">
			<div class="form-group">
				<label>Email Address</label>
				<input name="email" type="email" class="form-control" placeholder="Enter registered email" required>
			</div>

			<div class="form-group">
				<label>Phone Number</label>
				<input name="phone" type="tel" class="form-control" placeholder="Enter registered phone" required>
			</div>

			<div class="form-group">
				<label>New Password</label>
				<input name="password" type="password" class="form-control" placeholder="Enter new password" required>
			</div>

			<div class="form-group">
				<label>Confirm Password</label>
				<input name="confirmPassword" type="password" class="form-control" placeholder="Re-enter password" required>
			</div>

			<button type="submit" class="btn btn-custom mt-3">Update Password</button>

			<div class="text-center mt-3">
				<a href="login.jsp">Back to Login</a>
			</div>
		</form>
	</div>
</body>
</html>

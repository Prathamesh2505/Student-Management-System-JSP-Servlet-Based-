<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
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

    /* ---------- Card Styling ---------- */
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

    .card-header {
        background-color: #ff8800;
        color: #fff;
        border-radius: 15px 15px 0 0;
        font-weight: 600;
        text-align: center;
        padding: 15px;
        font-size: 22px;
    }

    /* ---------- Input Fields ---------- */
    .form-control {
        border-radius: 10px;
        border: 1px solid #ccc;
        padding: 12px;
        transition: all 0.3s ease;
        font-size: 15px;
    }

    .form-control:focus {
        border-color: #ff8800;
        box-shadow: 0 0 6px rgba(255, 136, 0, 0.3);
    }

    .password-wrapper {
        position: relative;
    }

    .toggle-password {
        position: absolute;
        right: 12px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        color: #ff8800;
    }

    /* ---------- Button ---------- */
    .btn-reset {
        background-color: #ff8800;
        color: #fff;
        border-radius: 10px;
        width: 100%;
        font-weight: 600;
        padding: 12px;
        transition: all 0.3s ease;
        border: none;
    }

    .btn-reset:hover {
        background-color: #e06f00;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(255, 136, 0, 0.3);
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

    /* ---------- Alert Messages ---------- */
    .alert {
        width: 380px;
        text-align: center;
        font-weight: 600;
        border-radius: 10px;
        margin-bottom: 15px;
        animation: fadeIn 0.7s ease-in-out;
    }

    /* ---------- Animation ---------- */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>
<div>

<% if(request.getAttribute("success") != null) { %>
    <div class="alert alert-success">
        <%= request.getAttribute("success") %>
    </div>
<% } else if(request.getAttribute("error") != null) { %>
    <div class="alert alert-danger">
        <%= request.getAttribute("error") %>
    </div>
<% } %>

<div class="card">
  <div class="card-header">Reset Password</div>
  <div class="card-body">
    <form action="resetPassword" method="post">
      <div class="form-group">
        <label>Email Address</label>
        <input type="email" name="email" class="form-control" placeholder="Enter your registered email" required>
      </div>

      <div class="form-group password-wrapper">
        <label>New Password</label>
        <input type="password" id="newPassword" name="newPassword" class="form-control" placeholder="Enter new password" required>
        <span class="toggle-password" onclick="togglePassword('newPassword', this)">👁️</span>
      </div>

      <div class="form-group password-wrapper">
        <label>Confirm Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm password" required>
        <span class="toggle-password" onclick="togglePassword('confirmPassword', this)">👁️</span>
      </div>

      <div class="text-center mt-4">
        <button type="submit" class="btn btn-reset">Reset Password</button>
      </div>
    </form>
    <div class="text-center mt-3">
      <a href="login.jsp">Back to Login</a>
    </div>
  </div>
</div>
</div>

<script>
    function togglePassword(id, icon) {
        const field = document.getElementById(id);
        if (field.type === "password") {
            field.type = "text";
            icon.textContent = "🙈";
        } else {
            field.type = "password";
            icon.textContent = "👁️";
        }
    }
</script>

</body>
</html>

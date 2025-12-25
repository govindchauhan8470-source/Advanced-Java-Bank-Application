<%@page import="com.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#f1f3f6;
}
.profile-card{
    max-width:900px;
    margin:50px auto;
    background:white;
    border-radius:12px;
    box-shadow:0 6px 18px rgba(0,0,0,0.15);
    overflow:hidden;
}
.profile-left{
    background:linear-gradient(135deg,#0d6efd,#084298);
    color:white;
    padding:40px 25px;
    text-align:center;
}
.profile-left img{
    width:120px;
    height:120px;
    border-radius:50%;
    border:4px solid white;
    margin-bottom:15px;
}
.profile-right{
    padding:35px;
}
label{
    font-weight:600;
}
</style>
</head>

<body>

<%
    UserBean ub = (UserBean) session.getAttribute("UserBean");
%>

<div class="profile-card row g-0">

    <!-- LEFT SIDE -->
    <div class="col-md-4 profile-left">
        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
        <h4><%=ub.getFull_name()%></h4>
        <p class="mb-1"><%=ub.getEmail()%></p>
        <small>Account Holder</small>
    </div>

    <!-- RIGHT SIDE -->
    <div class="col-md-8 profile-right">
        <h4 class="text-primary mb-4">Edit Profile</h4>

        <form action="UpdateProfile" method="post">

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label>Full Name</label>
                    <input type="text" name="fullName" class="form-control"
                           value="<%=ub.getFull_name()%>" required>
                </div>

                <div class="col-md-6 mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control"
                           value="<%=ub.getEmail()%>" required>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label>Username</label>
                    <input type="text" name="username" class="form-control"
                           value="<%=ub.getUsername()%>" readonly>
                </div>

                <div class="col-md-6 mb-3">
                    <label>Password</label>
                    <input type="text" name="password" class="form-control"
                           value="<%=ub.getPassword()%>" required>
                </div>
            </div>

            <div class="mb-3">
                <label>Phone Number</label>
                <input type="text" name="phone" class="form-control"
                       value="<%=ub.getPhone_number()%>" required>
            </div>

            <button class="btn btn-primary w-100 mt-2">
                Update Profile
            </button>
        </form>

        <%
            String msg = (String) request.getAttribute("msg");
            if(msg != null){
        %>
            <div class="alert alert-success mt-3 text-center">
                <%=msg %>
            </div>
        <% } %>

    </div>
</div>

</body>
</html>

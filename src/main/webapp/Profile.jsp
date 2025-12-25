<%@page import="com.helpermethods.Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bean.UserBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Profile - SecureBank</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!--  Google Icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" />

<style>
    body {
        margin: 0;
        padding: 0;
        background: #f3f4f6;
        font-family: Arial, sans-serif;
    }

    /* Top Navbar */
    .navbar {
        background: #004aad;
        padding: 15px 40px;
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .navbar .logo {
        font-size: 28px;
        font-weight: bold;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .navbar .menu a {
        color: white;
        margin: 0 18px;
        text-decoration: none;
        font-size: 18px;
        font-weight: 500;
    }

    .navbar .logout-btn {
        background: #ffcc00;
        padding: 8px 18px;
        color: black;
        font-weight: bold;
        text-decoration: none;
        border-radius: 8px;
    }
    
    .navbar .menu a:hover {
    
    color: #ffcc00;
    text-decoration: underline;
     
}
    /* ---Navbar end---  */ 
    /* Profile Card */
    .profile-card {
        width: 55%;
        background: white;
        margin: 50px auto;
        padding: 30px 40px;
        border-radius: 16px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }

    .profile-title {
        font-size: 28px;
        color: #003c82;
        font-weight: bold;
        margin-bottom: 10px;
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .line {
        width: 100%;
        height: 2px;
        background: #cccccc;
        margin: 15px 0 25px 0;
    }

    .profile-details {
        display: grid;
        grid-template-columns: 1fr 1fr;
        row-gap: 25px;
        column-gap: 30px;
        font-size: 18px;
    }

    .label {
        font-weight: bold;
        color: #333;
    }

    .value {
        margin-top: 5px;
        font-size: 19px;
    }

    .balance {
        color: green;
        font-weight: bold;
        font-size: 22px;
    }

    
    .btn-box {
        margin-top: 35px;
        text-align: center;
    }

    .btn {
        background: #004aad;
        padding: 10px 20px;
        color: white;
        font-size: 16px;
        border-radius: 8px;
        margin: 0 10px;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }
    
    .btn:hover {
    background: #00337a;   /* darker blue */
    color: white;
    text-decoration: none;
}
</style>
</head>

<body>


   <%   UserBean ub=(UserBean)session.getAttribute("UserBean"); %>
<!-- NAVBAR -->
<div class="navbar">
    <div class="logo" style="color:#ffcc00;">
        <span class="material-symbols-outlined">credit_card</span>
        SecureBank
    </div>

    <div class="menu">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="transaction.jsp">Transactions</a>
        <a href="Profile.jsp">Profile</a>
        <a href="SendMoney.jsp">Send Money</a>
        <a href="ApplyLoan.jsp">Apply Loan</a>
    </div>

    <a href="logout" class="logout-btn">Logout</a>
</div>

<!-- PROFILE CARD -->
<div class="profile-card">
    <div class="profile-title">
        <span class="material-symbols-outlined" style="font-size:34px;">account_circle</span>
        Your Profile
    </div>

    <div class="line"></div>

    <div class="profile-details">
        <div>
            <div class="label">Full Name:</div>
             
            <div class="value"><%= ub.getFull_name()%></div>
        </div>

        <div>
            <div class="label">Email:</div>
            <div class="value"><%=ub.getEmail() %></div>
        </div>

        <div>
            <div class="label">Username:</div>
            <div class="value"><%=ub.getUsername() %></div>
        </div>

        <div>
            <div class="label">Account Number:</div>
            <div class="value"><%=ub.getAccount_number() %></div>
        </div>

        <div>
            <div class="label">Balance:</div>
            <%
              Double balance=Helper.getBalance(ub.getAccount_number());
            %>
            <div class="balance">₹ <%=balance%></div>
        </div>

        <div>
            <div class="label">Phone Number:</div>
            <div class="value"><%=ub.getPhone_number() %></div>
        </div>
    </div>

    <!-- Buttons -->
    <div class="btn-box">
        <a href="dashboard.jsp" class="btn">
            <span class="material-symbols-outlined">arrow_back</span>
            Back to Dashboard
        </a>

        <a href="EditProfile.jsp" class="btn">
            Edit
        </a>
    </div>

</div>

</body>
</html>

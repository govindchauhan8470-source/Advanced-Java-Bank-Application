<%@page import="java.util.Iterator"%>
<%@page import="com.helpermethods.AllTransactionDAO"%>
<%@page import="com.bean.Transactions"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Transaction History - SecureBank</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" />

<style>
    body {
        background-color: #f4f7fb;
        font-family: Arial, sans-serif;
    }

    .navbar {
        background: #004aad;
        padding: 15px 40px;
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
        
       /* this is for sticky navbar
        position: sticky;
        top: 0;
        z-index: 1000; */
        
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
    
  /* Loan Container */  
     .loan-container {
        width: 420px;
        margin: 80px auto;
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 16px rgba(0,0,0,0.15);
        text-align: left;
    }

    h2 {
        text-align: center;
        color: #004090;
        margin-bottom: 25px;
    }

    label {
        font-weight: bold;
        color: #003366;
    }

    input, select {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        margin-bottom: 18px;
        border: 1px solid #bfbfbf;
        border-radius: 4px;
        font-size: 15px;
    }

    input:focus, select:focus {
        outline: none;
        border: 1px solid #007bff;
        box-shadow: 0px 0px 6px rgba(0,123,255,0.5);
    }

    .btn-submit {
        width: 100%;
        padding: 12px;
        background-color: #0056d6;
        border: none;
        border-radius: 6px;
        color: white;
        font-weight: bold;
        font-size: 16px;
        cursor: pointer;
    }

    .btn-submit:hover {
        background-color: #0046b0;
    }
      
      
</style>
</head>

<body>

<!-- 🟦 NAVBAR -->
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

    <a href="#" class="logout-btn">Logout</a>
</div>

  

   <!--  Apply For Loan -->
   
   <div class="loan-container">
    <h2>Apply for Loan</h2>

    <form action="ApplyLoanServlet" method="post">

        <label>Loan Amount (₹)</label>
        <input type="number" name="amount" required>

        <label>Loan Type</label>
        <select name="loanType" required>
            <option value="">-- Select Loan Type --</option>

            <!-- ALL LOAN TYPES ↓ -->
            <option>Personal Loan</option>
            <option>Home Loan</option>
            <option>Education Loan</option>
            <option>Car Loan</option>
            <option>Bike Loan</option>
            <option>Gold Loan</option>
            <option>Business Loan</option>
            <option>Medical Loan</option>
            <option>Marriage Loan</option>
            <option>Travel Loan</option>
            <option>Agriculture Loan</option>
            <option>Loan Against Property</option>
            <option>Credit Card Loan</option>

        </select>

        <label>Duration (Months)</label>
        <input type="number" name="duration" required>

        <button class="btn-submit">Submit Application</button>
    </form>
    <a href="dashboard.jsp" class="back  btn-primary">← Back to Dashboard</a>
</div>

</body>
</html>

<%@page import="com.bean.UserBean"%>
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
    
      
     .classic-table thead th {
        background-color: #007bff;   /* same blue as your screenshot */
        color: white;
        padding: 12px;
        font-size: 16px;
        font-weight: bold;
        text-align: center;
        border-right: 1px solid #e3e3e3;
    }

    .classic-table thead th:last-child {
        border-right: none;
    }

    /* TABLE BODY LIKE IMAGE */
    .classic-table tbody td {
        padding: 12px;
        font-size: 15px;
        color: #003366;
        text-align: center;
        border-bottom: 1px solid #dcdcdc;
    }

    /* Row hover effect — light & clean (same type as screenshot) */
    .classic-table tbody tr:hover {
        background-color: #f2f7ff;
    }

    /* SUCCESS badge same design */
    .status-success {
        color: green;
        font-weight: bold;
    }

    /* Amount styling */
    .money {
        font-weight: bold;
        color: #333;
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

    <a href="logout" class="logout-btn">Logout</a>
</div>

<div class="container mt-4">

    <div class="transactions-title"><h3><b Style='color:#004aad;' >Transaction History</b></h3></div>

    <table class="table table-bordered classic-table">
    <thead>
        <tr>
            <th>Transaction ID</th>
            <th>Date</th>
            <th>Description</th>
            <th>Type</th>
            <th>Amount (₹)</th>
            <th>Status</th>
        </tr>
    </thead>

    <tbody>
    <%
      String description="No message";
                 UserBean  ub=(UserBean)session.getAttribute("UserBean");
                  String account_number=ub.getAccount_number();
        ArrayList<Transactions> al = AllTransactionDAO.retriveAllTransactions(account_number);
        for (Transactions tr : al) {
    %>
        <tr>
            <td><%= tr.getTXN_ID() %></td>
            <td><%= tr.getTxn_date() %></td>
            <% 
            if(tr.getDescription()==null || tr.getDescription().trim().isEmpty())
            {
            %>
             <td style="color: blue;"><%= description%></td>
             <%  
            }
            else
            {
            %>
            <td><%= tr.getDescription() %></td>
            <%
            }
            %>
            <td><%= tr.getTxn_type() %></td>
            <td class="money">₹<%= tr.getAmount() %></td>
            <td><span class="status-success"><%= tr.getStatus() %></span></td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

    <a href="dashboard.jsp" class="btn btn-primary back-btn">← Back to Dashboard</a>
</div>

</body>
</html>

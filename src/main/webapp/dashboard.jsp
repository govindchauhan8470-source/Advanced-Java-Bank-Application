 <%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.Transactions"%>
<%@page import="com.helpermethods.Helper"%>
<%@page import="com.dao.TransactionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bean.UserBean" %>

<%
    UserBean ub = (UserBean) session.getAttribute("UserBean");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SecureBank | Dashboard</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" />

<style>
    body {
        background-color: #e8f0ff;
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
    .welcome-box {
        background: white;
        padding: 30px;
        border-radius: 15px;
        margin: 30px auto;
        width: 90%;
        text-align: center;
        box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
    }
    .info-card {
        width: 40%;
        padding: 25px;
        background: white;
        border-radius: 15px;
        text-align: center;
        box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
    }
    .transactions-box {
        width: 90%;
        margin: auto;
        margin-top: 25px;
        background: white;
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
    }
    table th {
        background: #0047ab;
        color: white;
        padding: 12px;
    }
    table td {
        padding: 12px;
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


<!-- 🟦 Welcome Section -->
<div class="welcome-box">
    <h2 style="color:#004aad;">Welcome back, <%= ub.getFull_name() %> 👋</h2>
    <p style="color:#004aad;">Account Number: <b><%= ub.getAccount_number() %></b></p>
</div>

  <%
    Double balance=Helper.getBalance(ub.getAccount_number());
 %>


<!-- 🟦 Info Cards -->
<div class="d-flex justify-content-around">

    <div class="info-card">
        <h5>Current Balance</h5>
        <h3 style="color:green;">₹ <%= balance %></h3>
    </div>

    <div class="info-card">
        <h5>Make a Transfer</h5>
        <a href="SendMoney.jsp" class="btn btn-primary mt-2">Transfer Money</a>
    </div>

</div>

<!-- 🟦 Recent Transactions -->
<div class="transactions-box">
    <h4>Recent Transactions</h4><br>

    <table class="table table-bordered">
        <tr>
            <th>Date</th>
            <th>Description</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Status</th>
        </tr>

        <!-- STATIC ROW (replace with dynamic DB records later) -->
        
        <%
             String description="No Message";
        
              ArrayList<Transactions> al=Helper.retriveTransactions(ub.getAccount_number());
              
              Iterator<Transactions> itr=al.iterator();
              
              while(itr.hasNext())
              {
            	  Transactions tr=itr.next();
              
         %>
        <tr>
            <td><%=tr.getTxn_date() %></td>
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
            <td><%=tr.getTxn_type() %></td>
            <td>₹<%=tr.getAmount() %></td>
            <td><span class="badge bg-success"><%=tr.getStatus()%></span></td>
        </tr>
        <%  } %>
    </table>
</div>

</body>
</html>
 
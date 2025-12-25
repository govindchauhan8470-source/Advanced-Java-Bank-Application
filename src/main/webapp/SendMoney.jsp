<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.connection.ConnectionProvder"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" />
  
    <meta charset="UTF-8">
    <title>Send Money</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f3f7ff;
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
        .box {
            width: 380px;
            margin: 60px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }

        .box h2 {
            text-align: center;
            color: #0066cc;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #bdbdbd;
            border-radius: 6px;
            margin-top: 10px;
            font-size: 15px;
        }

        .btn {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #0066cc;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #004c99;
        }

        .success {
            color: green;
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #0066cc;
            text-decoration: none;
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



<!-- CONTENT BOX -->
<div class="box">
    <h2>Send Money</h2>

    <form action="SendMoneyServlet" method="post">
        <label>Recipient Account Number :</label>
        <input type="text" name="receiver" placeholder="Enter account or mobile number" required>

        <label>Amount (₹):</label>
        <input type="number" name="amount" placeholder="Enter amount" required>

        <label>Description:</label>
        <input type="text" name="description" placeholder="Purpose (optional)">

        <button class="btn" type="submit">Send Money</button>
    </form>

    <% 
        String msg =(String)request.getAttribute("msg");
        UserBean  ub=(UserBean)session.getAttribute("UserBean");
        Double amount=(Double)request.getAttribute("amount");
        
        if(msg != null) {
    %>
        <p class="success">₹<%=amount %>&nbsp; <%= msg %> &nbsp; 
          
           <%
           String fullName=null;
           try
        {
        	   Connection con=ConnectionProvder.getConnection();
        	   
        	   
        	   String reciverName=(String)request.getParameter("receiver");
        	   
        	   String query="select FULL_NAME FROM BANK_USERS WHERE ACCOUNT_NUMBER=?";
        	   
        	    
        	   PreparedStatement psmt=con.prepareStatement(query);
        	   
        	   psmt.setString(1, reciverName);
        	   ResultSet rs=psmt.executeQuery();
        	   
        	   if(rs.next())
        	   {
        		   fullName=rs.getString("FULL_NAME");
        	   }
        	   
        }
        catch(SQLException e)
        {
        	e.printStackTrace();
        }
        %>
        <u><%= fullName %></u>
        </p>
        
    <% 
        } else  {
    %>
    <p class="success"></p> 
     <% }    %>
    <a href="dashboard.jsp" class="back  btn-primary">← Back to Dashboard</a>
</div>

</body>
</html>

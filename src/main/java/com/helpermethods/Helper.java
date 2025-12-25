package com.helpermethods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.Transactions;
import com.connection.ConnectionProvder;
 

public class Helper 
{
    public static ArrayList<Transactions> retriveTransactions(String accountNumber)
    {
        ArrayList<Transactions> al = new ArrayList<>();

        String query = "SELECT * FROM BANK_TRANSACTIONS " +
                       "WHERE  SENDER_ACCOUNT = ? " +
                       "ORDER BY txn_date DESC " +
                       "FETCH FIRST 5 ROWS ONLY";

        try 
        {
             Connection con = ConnectionProvder.getConnection();
             PreparedStatement psmt = con.prepareStatement(query);
       
             psmt.setString(1, accountNumber);
            ResultSet rs = psmt.executeQuery();

            while(rs.next())
            {
                Transactions t = new Transactions();

                t.setTXN_ID(rs.getString("TXN_ID"));
                t.setSender_account(rs.getString("SENDER_ACCOUNT"));
                t.setReceiver_account(rs.getString("RECEIVER_ACCOUNT"));
                t.setAmount(rs.getDouble("AMOUNT"));
                t.setTxn_type(rs.getString("TXN_TYPE"));
                t.setDescription(rs.getString("DESCRIPTION"));
                t.setStatus(rs.getString("STATUS"));
                t.setTxn_date(rs.getDate("TXN_DATE"));

                al.add(t); 
            }
        } 
        catch(SQLException e)
        {
            e.printStackTrace();
        }

        return al;
    }


	public static double getBalance(String account_number) {
	    double bal = 0;

	    try {
	    	
	    	
	        Connection con = ConnectionProvder.getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT balance FROM bank_users WHERE account_number = ?");
	        ps.setString(1, account_number);

	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            bal = rs.getDouble("balance");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return bal;
	}

}

package com.helpermethods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.bean.Transactions;
import com.connection.ConnectionProvder;

public class  AllTransactionDAO
{
	public static ArrayList<Transactions> retriveAllTransactions(String account_number)
	{
		
		ArrayList<Transactions> al=new ArrayList<Transactions>();
		String query="SELECT * FROM BANK_TRANSACTIONS WHERE  SENDER_ACCOUNT=? ORDER BY  TXN_DATE DESC ";
		
		try
		{
			Connection con=ConnectionProvder.getConnection();
			
			PreparedStatement psmt=con.prepareStatement(query);
			psmt.setString(1, account_number);
			
			ResultSet rs=psmt.executeQuery();
			 while(rs.next())
			 {
				 Transactions t=new Transactions();
				 
				 t.setTXN_ID(rs.getString(1));
				 t.setSender_account(rs.getString(2));
				 t.setReceiver_account(rs.getString(3));
				 t.setAmount(rs.getDouble(4));
				 t.setTxn_type(rs.getString(5));
				 t.setDescription(rs.getString(6));
				 t.setStatus(rs.getString(7));
				 t.setTxn_date(rs.getDate(8));
				 
				al.add(t); 
              }
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return al;
	}

}

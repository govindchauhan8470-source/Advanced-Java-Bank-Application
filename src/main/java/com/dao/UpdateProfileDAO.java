package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.connection.ConnectionProvder;

public class UpdateProfileDAO 
{
	public int updateProfile(String account_Number,String full_name,String email,String userName,
			                                                    String password,String phone_number) throws SQLException
	{
		String query="UPDATE BANK_USERS SET FULL_NAME=? , EMAIL=?, "
				+ "USERNAME=?, PASSWORD=? , PHONE_NUMBER=? WHERE ACCOUNT_NUMBER=?";
		 
		Connection  con = ConnectionProvder.getConnection();
		
		PreparedStatement psmt=con.prepareStatement(query);
		psmt.setString(1, full_name);
		psmt.setString(2, email);
		psmt.setString(3, userName);
		psmt.setString(4, password);
		psmt.setString(5, phone_number);
		psmt.setString(6, account_Number);
		
		int update = psmt.executeUpdate();
		
		return update;
		
	}

}

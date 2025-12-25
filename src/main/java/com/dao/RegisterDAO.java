package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bean.UserBean;
import com.connection.ConnectionProvder;

public class RegisterDAO 
{
	public static String generateAccountNumber() {
	    long number = (long)(Math.random() * 140000000000L) + 100000000000L; // 12-digit
	    return number+"HDFC";
	}

    public int insertData(UserBean ub) {
        int row = 0;

        String query = "INSERT INTO bank_users (FULL_NAME, EMAIL, USERNAME, PASSWORD, PHONE_NUMBER, ACCOUNT_NUMBER, BALANCE, CREATED_AT) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
        	
        	 
        	Connection con = ConnectionProvder.getConnection();
            PreparedStatement psmt = con.prepareStatement(query);

            psmt.setString(1, ub.getFull_name());
            psmt.setString(2, ub.getEmail());
            psmt.setString(3, ub.getUsername());
            psmt.setString(4, ub.getPassword());
            psmt.setString(5, ub.getPhone_number());
            psmt.setString(6,  RegisterDAO.generateAccountNumber());
            psmt.setDouble(7, ub.getBalance());

            
            psmt.setTimestamp(8, new java.sql.Timestamp(ub.getCreated_at().getTime()));

            row = psmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return row;
    }
}

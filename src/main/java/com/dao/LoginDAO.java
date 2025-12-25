package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.UserBean;
import com.connection.ConnectionProvder;

public class LoginDAO {

    public UserBean retriveData(String username, String password) {

        String query = "SELECT * FROM bank_users WHERE USERNAME = ? AND PASSWORD = ?";

        UserBean ub = null;

        try  {
            
        	
        	Connection con = ConnectionProvder.getConnection();
            PreparedStatement psmt = con.prepareStatement(query);
            
            psmt.setString(1, username);
            psmt.setString(2, password);

            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                ub = new UserBean();

                ub.setUser_id(rs.getInt("USER_ID"));
                ub.setFull_name(rs.getString("FULL_NAME"));
                ub.setEmail(rs.getString("EMAIL"));
                ub.setUsername(rs.getString("USERNAME"));
                ub.setPassword(rs.getString("PASSWORD"));
                ub.setPhone_number(rs.getString("PHONE_NUMBER"));
                ub.setAccount_number(rs.getString("ACCOUNT_NUMBER"));
                ub.setBalance(rs.getDouble("BALANCE"));
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ub;
    }
}

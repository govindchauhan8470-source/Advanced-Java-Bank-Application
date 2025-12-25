package com.bean;

import java.sql.Date;
 

public class UserBean
{
    private int user_id;
    private String full_name;
    private String email;
    private String username;
    private String password;
    private String phone_number;
    private String account_number;
    private double balance;
    private Date created_at;
    
   public  UserBean()
    {
    	
    }
	public UserBean(int user_id, String full_name, String email, String username, String password, String phone_number,
		 double balance, Date created_at) {
		super();
		this.user_id = user_id;
		this.full_name = full_name;
		this.email = email;
		this.username = username;
		this.password = password;
		this.phone_number = phone_number;
		this.balance = balance;
		this.created_at = created_at;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getAccount_number() {
		return account_number;
	}
	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	 
	 
	
	
    
    

     
}


package com.bean;

import java.sql.Date;

public class Transactions
{
	private String   TXN_ID;
	private String sender_account;
	private String receiver_account;
	private double amount;
	private String  txn_type;
	private String description;
	private String status;
	private Date txn_date;
	public Transactions()
	{
		
	}
	public Transactions(String tXN_ID, String sender_account, String receiver_account, double amount, String txn_type,
			String description, String status, Date txn_date) {
		super();
		TXN_ID = tXN_ID;
		this.sender_account = sender_account;
		this.receiver_account = receiver_account;
		this.amount = amount;
		this.txn_type = txn_type;
		this.description = description;
		this.status = status;
		this.txn_date = txn_date;
	}
	public String getTXN_ID() {
		return TXN_ID;
	}
	public void setTXN_ID(String tXN_ID) {
		TXN_ID = tXN_ID;
	}
	public String getSender_account() {
		return sender_account;
	}
	public void setSender_account(String sender_account) {
		this.sender_account = sender_account;
	}
	public String getReceiver_account() {
		return receiver_account;
	}
	public void setReceiver_account(String receiver_account) {
		this.receiver_account = receiver_account;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getTxn_type() {
		return txn_type;
	}
	public void setTxn_type(String txn_type) {
		this.txn_type = txn_type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getTxn_date() {
		return txn_date;
	}
	public void setTxn_date(Date txn_date) {
		this.txn_date = txn_date;
	}
	
	@Override
	public String toString() {
		return "Transactions [TXN_ID=" + TXN_ID + ", sender_account=" + sender_account + ", receiver_account="
				+ receiver_account + ", amount=" + amount + ", txn_type=" + txn_type + ", description=" + description
				+ ", status=" + status + ", txn_date=" + txn_date + "]";
	}
	

}

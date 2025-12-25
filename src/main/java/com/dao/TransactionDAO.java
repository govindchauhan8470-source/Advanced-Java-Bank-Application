package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.connection.ConnectionProvder;

public class TransactionDAO {

    // Safe TXN generator
    public String generateTXN() {
        long random = (long) (Math.random() * 9000000L) + 1000000L;
        return "TXN" + random;
    }

    public boolean transfefAmount(String sender_account, String receiver_account, double amount,String desciption) throws SQLException {

        boolean result = false;

        String getBalance = "SELECT BALANCE FROM BANK_USERS WHERE ACCOUNT_NUMBER = ?";

        String debit = "UPDATE BANK_USERS SET BALANCE = BALANCE - ? WHERE ACCOUNT_NUMBER = ?";

        String credit = "UPDATE BANK_USERS SET BALANCE = BALANCE + ? WHERE ACCOUNT_NUMBER= ?";

        String insertCreditTxn = "INSERT INTO BANK_TRANSACTIONS "
               + "(TXN_ID, SENDER_ACCOUNT, RECEIVER_ACCOUNT, AMOUNT, TXN_TYPE, DESCRIPTION, STATUS, TXN_DATE) "
               + "VALUES (?, ?, ?, ?, ?, ?, ?, SYSDATE)";

        String insertDebitTxn = "INSERT INTO BANK_TRANSACTIONS "
                + "(TXN_ID, SENDER_ACCOUNT, RECEIVER_ACCOUNT, AMOUNT, TXN_TYPE, DESCRIPTION, STATUS, TXN_DATE) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, SYSDATE)";

        Connection con = ConnectionProvder.getConnection();

        try {
        	
        	con.setAutoCommit(false);
        	
            double currentBalance = 0;

            // ------------------ GET BALANCE ------------------
            
            PreparedStatement balpsmt = con.prepareStatement(getBalance);
                balpsmt.setString(1, sender_account);
                ResultSet rs = balpsmt.executeQuery();

                if (rs.next()) {
                    currentBalance = rs.getDouble("BALANCE");
                    result=true;
                } else {
                    result= false;
                }
           

            // ------------------ If Low Balance ------------------
            if (amount > currentBalance) {
                insertFailedTransaction(con, sender_account, receiver_account, amount, "INSUFFICIENT BALANCE");
                con.rollback();
                result= false;
            }

            // ------------------ Prepared Statements ------------------
                 PreparedStatement debitpsmt = con.prepareStatement(debit);
                 PreparedStatement creditpsmt = con.prepareStatement(credit);
                 
                 PreparedStatement insertCreditPsmt = con.prepareStatement(insertCreditTxn);
                 
                 PreparedStatement insertDebitPsmt = con.prepareStatement(insertDebitTxn);

                // Debate Sender
                debitpsmt.setDouble(1, amount);
                debitpsmt.setString(2, sender_account);

                // Credit Receiver
                creditpsmt.setDouble(1, amount);
                creditpsmt.setString(2, receiver_account);

                int debitUp = debitpsmt.executeUpdate();
                int creditUp = creditpsmt.executeUpdate();

                if (debitUp > 0 && creditUp > 0) {

                    // SAME TRANSACTION ID FOR BOTH
                    String txnId = generateTXN();

                    // --------------- CREDIT ENTRY (Receiver ki entry) ----------------
                    insertCreditPsmt.setString(1, txnId);
                    insertCreditPsmt.setString(2, sender_account);
                    insertCreditPsmt.setString(3, receiver_account);
                    insertCreditPsmt.setDouble(4, amount);
                    insertCreditPsmt.setString(5, "DEBIT");
                    insertCreditPsmt.setString(6, desciption);
                    insertCreditPsmt.setString(7, "SUCCESS");

                    insertCreditPsmt.executeUpdate(); 

                    // --------------- DEBIT ENTRY (Sender ki entry) ----------------
                    insertDebitPsmt.setString(1, txnId);
                    insertDebitPsmt.setString(2,  receiver_account);
                    insertDebitPsmt.setString(3, sender_account);
                    insertDebitPsmt.setDouble(4, amount);
                    insertDebitPsmt.setString(5, "CREDIT");
                    insertDebitPsmt.setString(6, desciption);
                    insertDebitPsmt.setString(7, "SUCCESS");

                    insertDebitPsmt.executeUpdate();   

                    con.commit();
                    result = true;
                   
                   
                } else {
                    con.rollback();
                    result=false;
                }
           

        } catch (Exception e) {
            try {
                con.rollback();
            } catch (Exception ignore) {}
            e.printStackTrace();
        }

        return result;
    }

    private void insertFailedTransaction(Connection conn, String senderAccount, String receiverAccount, double amount,
                                         String reason) throws SQLException {

        String sql = "INSERT INTO BANK_TRANSACTIONS "
                + "(TXN_ID, SENDER_ACCOUNT, RECEIVER_ACCOUNT, AMOUNT, TXN_TYPE, DESCRIPTION, STATUS, TXN_DATE) "
                + "VALUES (?, ?, ?, ?, 'TRANSFER', ?, 'FAILED', SYSDATE)";

        String txnId = generateTXN();

        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, txnId);
            ps.setString(2, senderAccount);
            ps.setString(3, receiverAccount);
            ps.setDouble(4, amount);
            ps.setString(5, reason);

            ps.executeUpdate();
        }
    }

}

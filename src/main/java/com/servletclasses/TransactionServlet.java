package com.servletclasses;

import java.io.IOException;
import java.sql.SQLException;

import com.bean.UserBean;
import com.dao.TransactionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SendMoneyServlet")
public class TransactionServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 		                                               throws ServletException, IOException
	{
	  
		 HttpSession session=req.getSession();
		 UserBean ub=(UserBean)session.getAttribute("UserBean");
		 
		 String senderAccount=ub.getAccount_number();
		 String receiver=req.getParameter("receiver");
		 
		 String description=req.getParameter("description");
		 if(description!=null)
		 {
			 description=req.getParameter("description");
		 }
		 else
		 {
			 description="Nothing";
		 }

		 double amount=Double.parseDouble(req.getParameter("amount"));
				 
		try {
			
			TransactionDAO tdao=new TransactionDAO();
			boolean result=tdao.transfefAmount(senderAccount,receiver,amount,description);
			
			if(result)
			{
				 
				 req.setAttribute("msg", "sent Successfully to ");
				 session.setAttribute("txn", tdao);
				 req.setAttribute("amount", amount);
			
				req.getRequestDispatcher("SendMoney.jsp").forward(req, res);
			}
			else
			{
				
			}
		} catch (SQLException e) {
		 
			e.printStackTrace();
		}
		
	}

}

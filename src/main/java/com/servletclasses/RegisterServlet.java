package com.servletclasses;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
 

import com.bean.UserBean;
import com.dao.RegisterDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/UserServlet")
public class RegisterServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			                                              throws ServletException, IOException
	{
		PrintWriter pw=res.getWriter();
		res.setContentType("text/html");
		
		String full_name=req.getParameter("full_name");
		String email=req.getParameter("email");
		String username=req.getParameter("username");
		
		String password=req.getParameter("password");
		String confirmPassword=req.getParameter("con_password");
		
		if(!password.equals(confirmPassword))
		{
			 pw.println("<center><h3 style='color: red;'>Confirm Password do not mathced!!</h3></center>");
			 req.getRequestDispatcher("register.html").include(req, res);
			 return;
		}
		
		String phone_number=req.getParameter("phone_number");
		
		double balance=Double.parseDouble(req.getParameter("balance"));
		
		String dateStr = req.getParameter("created_at");
		dateStr = dateStr + " 00:00:00";
		Date created_at = new Date(System.currentTimeMillis());


		 UserBean ub=new UserBean(1, full_name, email, username, password, phone_number, balance,created_at );
		
		int row=new RegisterDAO().insertData(ub);
		
		if(row>0)
		{
			HttpSession session=req.getSession();
			session.setAttribute("UserBean", ub);
			
			req.setAttribute("msg", "Registeration Succesfull!!");
			req.getRequestDispatcher("login.html").forward(req, res);
		}
		else
		{
			pw.println("<h2> Registration failed!!");
			req.getRequestDispatcher("register.html").include(req, res);
		}
	}

}

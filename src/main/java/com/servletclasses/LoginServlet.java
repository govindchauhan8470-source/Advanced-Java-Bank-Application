 
package com.servletclasses;

import java.io.IOException;
import java.io.PrintWriter;

import com.bean.UserBean;
import com.dao.LoginDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			                                                    throws ServletException, IOException
	{
		PrintWriter pw=res.getWriter();
		res.setContentType("text/html");
		
		UserBean ub=new LoginDAO().retriveData(req.getParameter("username"), req.getParameter("password"));
		
		if(ub==null)
		{
			pw.println("Invalid username Or Password!");
			req.getRequestDispatcher("login.html").include(req, res);
		}
		else
		{
			HttpSession session=req.getSession();
			 
			session.setAttribute("UserBean", ub);
			
			req.setAttribute("msg", "Login Successfull...");
			req.getRequestDispatcher("dashboard.jsp").forward(req, res);
		}
		 
	}

}

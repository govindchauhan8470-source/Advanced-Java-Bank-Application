package com.servletclasses;

import java.io.IOException;
import java.net.http.HttpClient;
import java.sql.SQLException;

import com.bean.UserBean;
import com.dao.UpdateProfileDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateProfile")
public class UpdateProfileServlet extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			                                         throws ServletException, IOException 
	{
		HttpSession session=req.getSession();
		
		UserBean  ub = (UserBean) session.getAttribute("UserBean");
		
		if(ub==null)
		{
			res.sendRedirect("login.html");
		}
		
		String fullname=req.getParameter("fullName");
		String email=req.getParameter("email");
		String userName=req.getParameter("username");
		String password=req.getParameter("password");
		String phone=req.getParameter("password");
		String accountNumber=ub.getAccount_number();
		
		UpdateProfileDAO update=new UpdateProfileDAO();
		
		try {
			int updateProfile = update.updateProfile(accountNumber,fullname, email, userName, password, phone);
			
			if(updateProfile>0)
			{
				ub.setFull_name(fullname);
				ub.setEmail(email);
				ub.setUsername(userName);
				ub.setPassword(password);
				ub.setPhone_number(phone);
				
				session.setAttribute("UserBean", ub);
				
				res.sendRedirect("Profile.jsp");
				
			}
			else
			{
				 req.setAttribute("msg", "Profile update failed!");
		         req.getRequestDispatcher("EditProfile.jsp").forward(req, res);
			}
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		 
	}

}

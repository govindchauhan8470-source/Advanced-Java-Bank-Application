package com.connection;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionProvder
{
	private static Connection con;
	
	public static Connection getConnection()
	{
		 if(con==null)
		 {
			 try {
				FileInputStream fis=new FileInputStream("E:\\Eclipse\\eclipse-workspace\\LabProject_BankApplication\\src\\main\\java\\com\\connection\\db.properties");
				
				Properties prop=new Properties();
				prop.load(fis);
				
				String driverName=prop.getProperty("driverName");
				String url=prop.getProperty("url");
				String username=prop.getProperty("username");
				String password=prop.getProperty("password");
				
				Class.forName(driverName);
				
			     con=DriverManager.getConnection(url,username,password);
			    
			 }
			 catch (FileNotFoundException e)
			 {
				 
				e.printStackTrace();
				
			 } catch (IOException e) {
				 
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				 
				e.printStackTrace();
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
		 }
		 return con;
	}

}

# Advanced-Java-Bank-Application
A web-based Bank Management Application developed using Advanced Java (JSP, Servlets, JDBC) with complete UI and backend functionality.

## 📌 Project Overview

This is a web-based Bank Management Application developed using Advanced Java.
The application allows users to register, login, manage profiles, perform transactions,
and view transaction history through a user-friendly web interface.

## 🛠 Technologies Used

- Java (JDK 8+)
- JSP (Java Server Pages)
- Servlets
- JDBC
- ORACLE Database
- HTML, CSS
- Apache Tomcat Server
- Eclipse IDE


## 🏗 Project Architecture

The application follows the MVC (Model–View–Controller) architecture:

- Model:
  - DAO classes
  - Database connection handling
- View:
  - JSP and HTML pages
- Controller:
  - Servlet classes
 
## 📂 Package Structure

- com.bean  
  Contains JavaBean classes like UserBean and Transactions.

- com.connection  
  Handles database connection using JDBC.

- com.dao  
  Contains DAO classes for login, registration, transactions, and profile updates.

- com.helpermethods  
  Contains helper and utility methods.

- com.servletclasses  
  Contains all Servlet classes for handling requests and responses.



## 📦 Application Modules

- Authentication Module
- User Profile Module
- Transaction Module
- Dashboard Module


## ▶ How to Run the Project

1. Clone the repository
2. Import the project into Eclipse IDE
3. Configure Apache Tomcat Server
4. Set up MySQL database and update DB credentials
5. Run the project on the server
6. Access the application using browser

## 🗄 Database Configuration

- Database: Oracle
- Update database credentials in `db.properties` file
- Create required tables before running the project

## 👤 Author

Govind Chauhan  
Advanced Java Developer

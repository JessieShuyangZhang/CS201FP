package Database;

import java.sql.*;
import java.io.*;
import java.util.*;

public class DatabaseOperator1 {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://google/assignment3?cloudSqlInstance=custom-defender-255500:us-central1:sql-db-1&socke" + 
    		"tFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false";
    static final String USER = "root";
    static final String PASS = "123456";
    
    Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	public boolean authenticate(String username, String password) {
		
		String sql = "SELECT * FROM User WHERE userName = ?";
    	
    	try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String correctPassword = resultSet.getString("password");
				if(password.equals(correctPassword)) {
					return true;
				}
				else {//incorrect password
					return false;
				}
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(resultSet != null) {
					resultSet.close();
				}
				if(preparedStatement!=null) {
					preparedStatement.close();
				}
				if(connection!=null) {
					connection.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
    	return false;//unhandle case
	}
	
	public boolean userExist(String username) {
		String sql = "SELECT * FROM User WHERE userName = ?";
    	
    	try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				return true;//username exist
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(resultSet != null) {
					resultSet.close();
				}
				if(preparedStatement!=null) {
					preparedStatement.close();
				}
				if(connection!=null) {
					connection.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
    	return false;//unhandle case
	}
	
	public boolean addUser(String username, String password) {//change to boolean to see if add successfully
		
		String insert = "INSERT INTO User (userName, password) VALUES (?,?)";
		
		try {
			//start insert
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(insert);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			preparedStatement.executeUpdate();
			return true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(resultSet != null) {
					resultSet.close();
				}
				if(preparedStatement!=null) {
					preparedStatement.close();
				}
				if(connection!=null) {
					connection.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
		return false;
	}
	
	public double getGPA (String courseName) {//get overall GPA
		
		String select = "SELECT avgGPA FROM GPA WHERE courseName = ?";
		
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, courseName);
			resultSet = preparedStatement.executeQuery();
			
			double result = 0.0;
			while(resultSet.next()) {
				double everyGPA = resultSet.getDouble("avgGPA");
				result += everyGPA;
			}
			
			return result;
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(resultSet != null) {
					resultSet.close();
				}
				if(preparedStatement!=null) {
					preparedStatement.close();
				}
				if(connection!=null) {
					connection.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
    	return -1;//unhandle case
	}

	public String getCourseTitle(String courseName) {
		
		String select = "SELECT courseTitle FROM Course WHERE courseName = ?";
		courseName.trim();
				
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, courseName);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				String title = resultSet.getString("courseTitle");
			}
			
			return result;
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(resultSet != null) {
					resultSet.close();
				}
				if(preparedStatement!=null) {
					preparedStatement.close();
				}
				if(connection!=null) {
					connection.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
    	return -1;//unhandle case
	}
}

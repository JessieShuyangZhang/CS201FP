package Database;

import java.sql.*;
import java.io.*;
import java.util.*;

public class DatabaseOperator1 {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://google/fp?cloudSqlInstance=securethata:us-central1:securethata"
			+ "&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false";
    static final String USER = "root";
    static final String PASS = "";
    
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
		
		String select = "SELECT avgGPA, counts FROM GPA WHERE courseName = ?";
		courseName = courseNameChange(courseName);
		
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, courseName);
			resultSet = preparedStatement.executeQuery();
			
			double result = 0.0;
			int count = 0;
			while(resultSet.next()) {
				double termGPA = resultSet.getDouble("avgGPA")*resultSet.getInt("counts");
				result += termGPA;
				count += resultSet.getInt("counts");
			}
			
			return result/count;
		
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
		courseName = courseNameChange(courseName);
				
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, courseName);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				String title = resultSet.getString("courseTitle");
				return title;
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
    	return null;//unhandle case
	}
	
	public String getDescription (String courseName) {
		
		String select = "SELECT description FROM Course WHERE courseName = ?";
		courseName = courseNameChange(courseName);
				
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, courseName);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				String description = resultSet.getString("description");
				return description;
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
    	return null;//unhandle case
	}
	
	public ArrayList<String> getProfessors(String courseName){
		
		String select = "SELECT p.fname, p.lname FROM Professor p, GPA g WHERE p.professorID = g.professorID AND g.courseName = ?";
		courseName = courseNameChange(courseName);
				
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, courseName);
			resultSet = preparedStatement.executeQuery();
			
			ArrayList<String> professors = new ArrayList<String>();
			while(resultSet.next()) {
				String fname = resultSet.getString("fname");
				String lname = resultSet.getString("lname");
				professors.add(fname+" "+lname);
			}
			return professors;
		
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
    	return null;//unhandle case
		
	}
	
	public ArrayList<String> getTerms(String courseName){//form is Spring 2019
		
		String select = "SELECT term FROM GPA WHERE courseName = ?";
		courseName = courseNameChange(courseName);
				
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, courseName);
			resultSet = preparedStatement.executeQuery();
			
			ArrayList<String> terms = new ArrayList<String>();
			while(resultSet.next()) {
				String term = resultSet.getString("term");
				String year = term.substring(0,4);
				String semester = term.substring(4,5);
				String weather = "";
				if(semester.equals("1")) {
					weather = "Spring";
				}
				else if(semester.equals("2")) {
					weather = "Summer";
				}
				else {
					weather = "Fall";
				}
				terms.add(year + " " + weather);
			}
			return terms;
		
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
    	return null;//unhandle case
	}
	
	public boolean upload(String course, String term, String professor, String gpa, String recommend, String challenging) {
		
		int pID = getProfessorID(professor);
		String select = "SELECT * FROM GPA WHERE courseName = ? AND professorID = ? AND term = ?";
		String courseName = courseNameChange(course);
		int recom = 0, challenge = 0;
		if(recommend.equals("yes")) {
			recom = 1;
		}
		if(challenging.equals("yes")) {
			challenge = 1;
		}
				
		try {
			double GPA = doubleTransfer(gpa);
			
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, courseName);
			preparedStatement.setInt(2, pID);
			preparedStatement.setString(3, term);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {//already exist
				int count = resultSet.getInt("counts");
				int pChallenging = resultSet.getInt("challenging") + challenge;
				int rec = resultSet.getInt("rec") + recom;
				double avgGPA = resultSet.getDouble("avgGPA");
				avgGPA = (avgGPA * count + GPA) / (count+1);
				
				String update = "UPDATE GPA SET count=count+1, challenging=?,rec=?,avgGPA=?"
						+ "WHERE courseName = ? AND professorID = ? AND term = ?";
				preparedStatement = connection.prepareStatement(update);
				preparedStatement.setInt(1, pChallenging);
				preparedStatement.setInt(2, rec);
				preparedStatement.setDouble(3, avgGPA);
				preparedStatement.setString(4, courseName);
				preparedStatement.setInt(5, pID);
				preparedStatement.setString(6, term);
				preparedStatement.executeUpdate();
				return true;
			}
			else {
				String insert = "INSERT INTO GPA (courseID, professorID, courseName, term, avgGPA, counts) "
						+ "VALUES (?,?,?,?,?,1)";
				int courseID = getCourseID(courseName);
				preparedStatement = connection.prepareStatement(insert);
				preparedStatement.setInt(1, courseID);
				preparedStatement.setInt(2, pID);
				preparedStatement.setString(3, courseName);
				preparedStatement.setString(4, term);
				preparedStatement.setDouble(5, GPA);
				preparedStatement.executeUpdate();
				return true;
			}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(NumberFormatException nfe) {
			nfe.printStackTrace();
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
	
	
	//helper function
	public String courseNameChange(String courseName) {
		courseName = courseName.trim();
		courseName = courseName.toUpperCase();
		return courseName;
	}
	
	public int getProfessorID (String professor) {//temporary
		String[] pro = professor.split("\\s+");
		if (pro.length < 2) {
			return -1;
		}
		String first = pro[0];
		String last = pro[1];
		String select = "SELECT professorID FROM Professor WHERE fname = ? AND lname = ?";
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, first);
			preparedStatement.setString(2, last);
			resultSet = preparedStatement.executeQuery();
			int pID = resultSet.getInt("professorID");	
			return pID;
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
		return -1;
	}
	
	public int getCourseID(String courseName) {
		String select = "SELECT courseID FROM Course WHERE courseName = ?";
		courseName = courseNameChange(courseName);
				
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, courseName);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				int id = resultSet.getInt("courseID");
				return id;
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
    	return -1;//unhandle case
	}
	
	public static double doubleTransfer(String transfer) throws NumberFormatException{ // transfer string to int type
		double a = 0;
		a = Double.valueOf(transfer).doubleValue();
		return a;
	}
}

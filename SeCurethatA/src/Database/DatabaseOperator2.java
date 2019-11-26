package Database;

import java.sql.*;
import java.io.*;
import java.util.*;

public class DatabaseOperator2 {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://google/fp?cloudSqlInstance=securethata:us-central1:securethata"
    		+ "&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false";
    static final String USER = "root";
    static final String PASS = "";
    
    Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
//	this function is used to get the professor ID with a professor name stored
	public int getProfessorID (String professor) {
		String[] pro = professor.split("\\s+");
		if (pro.length != 1) {
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
	
	public String getSpecificGPA(String term, String professor, String courseName) {
		
		String select = "SELECT avgGPA FROM GPA WHERE term = ? AND professorID = ? AND courseName = ?";
		term.trim();
		courseName.trim();
		if (getProfessorID(professor) == -1) {
			return null;
		}
		int professorID = getProfessorID(professor);
				
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, term);
			preparedStatement.setInt(2, professorID);
			preparedStatement.setString(3, courseName);
			resultSet = preparedStatement.executeQuery();

			String avgGPA = resultSet.getString("avgGPA");
			return avgGPA;
			
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
    	return null;
	}
	
	
	public int getRecommendRate(String professor, String courseName) {
		String select = "SELECT rec, counts FROM GPA professorID = ? AND courseName = ?";
		courseName.trim();
		if (getProfessorID(professor) == -1) {
			return -1;
		}
		int professorID = getProfessorID(professor);
				
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setInt(1, professorID);
			preparedStatement.setString(2, courseName);
			resultSet = preparedStatement.executeQuery();
			
			int rec = resultSet.getInt("rec");
			int counts = resultSet.getInt("counts");
			int result = rec/counts * 100;
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
    	return -1;
	}
	
	public int getChallenging(String professor, String courseName) {
		String select = "SELECT challenging, counts FROM GPA professorID = ? AND courseName = ?";
		courseName.trim();
		if (getProfessorID(professor) == -1) {
			return -1;
		}
		int professorID = getProfessorID(professor);
				
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setInt(1, professorID);
			preparedStatement.setString(2, courseName);
			resultSet = preparedStatement.executeQuery();
			
			int challenging = resultSet.getInt("challenging");
			int counts = resultSet.getInt("counts");
			int result = challenging/counts * 100;
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
    	return -1;
	}
	
	//course -> CS104 CourseName
	public ArrayList<String> get_All_Professor_Given_Term_And_Course(String term, String course){
		String select = "SELECT fname, lname FROM Professor "
				+ "JOIN GPA ON GPA.professorID = Professor.professorID"
				+ "WHERE term = ? AND courseName = ? ";
		term.trim();
		course.trim();
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, term);
			preparedStatement.setString(2, course);
			resultSet = preparedStatement.executeQuery();
			ArrayList<String> result = new ArrayList<String>();
			while (resultSet.next()) {
				result.add(resultSet.getString("fname") + " " + resultSet.getString("lname"));
			}
			return result;
		}
		catch(SQLException e) {
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
		return null;
	}
	
	public ArrayList<Integer> get_All_GPA_Given_Term_And_Course(String term, String course){
		String select = "SELECT avgGPA FROM GPA WHERE term = ? AND courseName = ?";
		term.trim();
		course.trim();
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, term);
			preparedStatement.setString(2, course);
			resultSet = preparedStatement.executeQuery();
			ArrayList<Integer> result = new ArrayList<Integer>();
			while (resultSet.next()) {
				result.add(resultSet.getInt("avgGPA"));
			}
			return result;
		}
		catch(SQLException e) {
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
		return null;
	}

	
	public Vector<String> searchCoureByProf(String input){
		String select = "";
		String[] search = input.split("\\s+");
		String firstname = "";
		String lastname = "";
		int selectAgain = 0;
		//check if user only have one name (can be first or last) or if they have two or more
		if (search.length == 0) {
			return null;
		}
		else if (search.length == 1) {
			select = "SELECT g.courseName FROM GPA g, Professor p, Course c "
					+ "JOIN Professor p on p.professorID = g.professorID"
					+ "WHERE p.fname LIKE ? OR p.lname LIKE ? ORDER BY c.courseNumber ASC";
			firstname = search[0];
			lastname = search[0];
		}
		else {
			select = "SELECT courseName FROM GPA g, Professor p, Course c "
					+ "JOIN Professor on Professor.professorID = GPA.professorID"
					+ "WHERE Professor.fname LIKE ? AND Professor.lname LIKE ? ORDER BY c.courseNumber ASC";
			firstname = search[0];
			lastname = search[1];
			for (int i = 2; i < search.length; i++) {
				lastname += search[i];
			}
			selectAgain = 1;
		}
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setString(1, firstname);
			preparedStatement.setString(2, lastname);
			resultSet = preparedStatement.executeQuery();
			Vector<String> result = new Vector<String>();
			while (resultSet.next()) {
				result.add(resultSet.getString("courseName"));
			}
			if (selectAgain != 1)
				return result;
		}
		catch(SQLException e) {
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
		//run sql again when there are more than two words
		if (selectAgain == 1) {
			select = "SELECT courseName FROM GPA g, Professor p, Course c "
					+ "JOIN Professor on Professor.professorID = GPA.professorID"
					+ "WHERE Professor.fname LIKE ? AND Professor.lname LIKE ? ORDER BY c.courseNumber ASC";
			firstname = search[1];
			lastname = search[0];
			for (int i = 2; i < search.length; i++) {
				firstname += search[i];
			}
		
			try {
				connection = DriverManager.getConnection(DB_URL,USER,PASS);
				preparedStatement = connection.prepareStatement(select);
				preparedStatement.setString(1, firstname);
				preparedStatement.setString(2, lastname);
				resultSet = preparedStatement.executeQuery();
				Vector<String> result = new Vector<String>();
				while (resultSet.next()) {
					result.add(resultSet.getString("courseName"));
				}
				return result;
			}
			catch(SQLException e) {
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
		}
		return null;
	}
	
	
	public Vector<String> searchCourseByCourse(String input) {
		input.trim();
		String prefix = "";
		String number = "";
		for (int i = 0; i < input.length(); i++) {
			if (Character.isDigit(input.charAt(i))) {
				number += input.charAt(i);
			}
			else
				prefix += input.charAt(i);
		}
		String select = "SELECT courseName FROM Course c WHERE prefix LIKE ? "
				+ "AND number LIKE ? ORDER BY c.courseNumber ASC";
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);
			preparedStatement.setInt(2, Integer.parseInt(number));
			preparedStatement.setString(1, prefix);
			resultSet = preparedStatement.executeQuery();
			Vector<String> result = new Vector<String>();
			while (resultSet.next()) {
				result.add(resultSet.getString("courseName"));
			}
			return result;
		}
		catch(SQLException e) {
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
		return null;
	}
	
	
	public Vector<String> getRecommendByCourse(String input){
		Vector<String> searchResult = searchCourseByCourse(input);
		if (searchResult == null)
			return null;
		String search = searchResult.get(searchResult.size() -1);
		String select = "SELECT courseName FROM Course WHERE courseName > ? ORDER BY courseName ASC";
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);;
			preparedStatement.setString(1, search);
			resultSet = preparedStatement.executeQuery();
			Vector<String> result = new Vector<String>();
			if (result.size() == 0){
				result.add("PHED 120A");
				return result;
			}
			while (resultSet.next()) {
				result.add(resultSet.getString("courseName"));
			}
			return result;
			
		}
		catch(SQLException e) {
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
		
		return null;
	}
	
	public Vector<String> getRecommendByProf(String input){
		Vector<String> searchResult = searchCoureByProf(input);
		if (searchResult == null)
			return null;
		String search = searchResult.get(searchResult.size() -1);
		String select = "SELECT courseName FROM Course WHERE courseName > ? ORDER BY courseName ASC";
		try {
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
			preparedStatement = connection.prepareStatement(select);;
			preparedStatement.setString(1, search);
			resultSet = preparedStatement.executeQuery();
			Vector<String> result = new Vector<String>();
			if (result.size() == 0){
				result.add("PHED 120A");
				return result;
			}
			while (resultSet.next()) {
				result.add(resultSet.getString("courseName"));
			}
			return result;
			
		}
		catch(SQLException e) {
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
		
		return null;
	}
}
	
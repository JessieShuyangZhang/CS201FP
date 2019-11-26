package Database;

import java.util.ArrayList;
import java.util.Vector;

public class Database {
	private Vector<String> res = new Vector<String>();
	
	public Database() {
		res.add("CSCI201");
		res.add("CSCI270");		
	}
	
	public boolean upload(String course, String term, String professor, 
			String gpa, String recommend, String challenging) {
		return true;
	}
	
	public boolean userExist(String username) {
		return true;
	}

	public boolean authenticate(String username, String password) {
		return true;
	}
	
	public void addUser(String username, String password) {
		
	}
	
	public Vector<String> searchCourseByCourse(String input){
		return res;
	}
	
	public Vector<String> searchCourseByProf(String input){
		return res;
	}
	
	public Vector<String> getRecommendByCourse(String input){
		return res;
	}
	
	public Vector<String> getRecommendByProf(String input){
		return res;
	}
	
	public double getGPA(String coursename) {
		
		return 2.0;
	}
	
	public String getCourseTitle(String coursename) {
		
		return "Principle of Software Development";
	}
	
	public String getDescription(String coursename) {
		
		return "Object-oriented paradigm for programming-in-the-large in Java; blahblahblah";
	}
	
	public int getChallenging(String professor, String courseName) {
		return 3;
	}
	
	public int getRecommendRate(String professor, String courseName) {
		return 3;
	}
	
	public ArrayList<String> getTerms(String courseName){
		ArrayList<String> terms = new ArrayList<String>();
		terms.add("20191");
		terms.add("20192");
		terms.add("20193");
		return terms;
	}
	
	public ArrayList<String> getProfessors(String courseName){
		ArrayList<String> a = new ArrayList<String>();
		a.add("Mark Redekopp");
		a.add("Olivera Grujic");
		a.add("Jeffery Miller");
		return a;
	}
	
	public double getSpecificGPA(String term, String professor, String courseName) {
		return 2.4;
	}
}


import Database.Database;
import Database.DatabaseOperator1;
import Database.DatabaseOperator2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/DetailServlet")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailServlet() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String courseName = request.getParameter("courseName");
		String term = request.getParameter("term");
		String professor = request.getParameter("professor");
		ArrayList<String> professors;
		ArrayList<String> terms;
		
		DatabaseOperator1 db1 = new DatabaseOperator1();
		DatabaseOperator2 db2 = new DatabaseOperator2();
		
		session.setAttribute("courseName", courseName);
		session.setAttribute("courseDescription", db1.getDescription(courseName));
		if(courseName == "" && professor == "") {
			session.setAttribute("specificGPA",db2.getSpecificGPA("none", "none", courseName));
		}
		else {
			session.setAttribute("specificGPA",db2.getSpecificGPA(term, professor, courseName));
		}

		professors = db1.getProfessors(courseName);
		session.setAttribute("professors", professors);
		terms = db1.getTerms(courseName);
		session.setAttribute("terms", terms);
		
		if(professor !="" && !professor.contains("none")) {
			session.setAttribute("challenging", db2.getChallenging(professor, courseName));
			session.setAttribute("recommendRate", db2.getRecommendRate(professor, courseName));
		}
		else {
			session.setAttribute("challenging", "");
			session.setAttribute("recommendRate", "");
		}
		
		try {
    		request.getRequestDispatcher("/Detail.jsp").forward(request,response);
    	}catch(IOException e) {
    		e.printStackTrace();
    	}catch(ServletException e) {
    		e.printStackTrace();
    	}
	}

}

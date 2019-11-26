
import Database.Database;
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
		
		Database db = new Database();
		session.setAttribute("courseName", courseName);
		session.setAttribute("courseDescription", db.getDescription(courseName));
		if(courseName == "" && professor == "") {
			session.setAttribute("specificGPA",db.getSpecificGPA("none", "none", courseName));
		}
		else {
			session.setAttribute("specificGPA",db.getSpecificGPA(term, professor, courseName));
		}

		professors = db.getProfessors(courseName);
		session.setAttribute("professors", professors);
		terms = db.getTerms(courseName);
		session.setAttribute("terms", terms);
		
		if(professor !="" && !professor.contains("none")) {
			session.setAttribute("challenging", db.getChallenging(professor, courseName));
			session.setAttribute("recommendRate", db.getRecommendRate(professor, courseName));
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

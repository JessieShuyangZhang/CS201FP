
import Database.Database;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//Httprequest request = request.getrequest();
		System.out.println("in detailservlet");
		String courseName = request.getParameter("courseName");
		String term = request.getParameter("term");
		String professor = request.getParameter("professor");
		ArrayList<String> professors;
		ArrayList<String> terms;
		
		//for debug
		System.out.println("courseName"+courseName);
		System.out.println("term"+term);
		System.out.println("Professor"+professor);
		
		Database db = new Database();
		request.setAttribute("courseName", courseName);
		request.setAttribute("courseDescription", db.getDescription(courseName));
		if(courseName == "" && professor == "") {
			request.setAttribute("specificGPA",db.getSpecificGPA("none", "none", courseName));
		}
		else {
			request.setAttribute("specificGPA",db.getSpecificGPA(term, professor, courseName));
		}

		professors = db.getProfessors(courseName);
		request.setAttribute("professors", professors);
		terms = db.getTerms(courseName);
		request.setAttribute("terms", terms);
		
		if(professor !="" && !professor.contains("none")) {
			request.setAttribute("challenging", db.getChallenging(professor, courseName));
			request.setAttribute("recommendRate", db.getRecommendRate(professor, courseName));
		}
		else {
			request.setAttribute("challenging", "");
			request.setAttribute("recommendRate", "");
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

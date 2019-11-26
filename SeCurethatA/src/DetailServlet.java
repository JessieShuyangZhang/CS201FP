
import Database.Database;
import java.io.IOException;
import java.io.PrintWriter;
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
		System.out.println("in detailservlet");
		String courseName = request.getParameter("courseName");
		String term = request.getParameter("term");
		String professor = request.getParameter("professor");
		ArrayList<String> professors;
		ArrayList<String> terms;
		PrintWriter out = response.getWriter();
		//for debug
		System.out.println("courseName "+courseName);
		System.out.println("term "+term);
		System.out.println("Professor "+professor);
		
		Database db = new Database();
//		request.setAttribute("courseName", courseName);
//		request.setAttribute("courseDescription", db.getDescription(courseName));
		if(courseName == "" && professor == "") {
			System.out.println("here....");
			session.setAttribute("specificGPA",db.getSpecificGPA("none", "none", courseName));
		}
		else {
			System.out.println("here.....");
			System.out.println(db.getSpecificGPA(term,professor, courseName));
			session.setAttribute("specificGPA",db.getSpecificGPA(term, professor, courseName));
		}

		professors = db.getProfessors(courseName);
		session.setAttribute("professors", professors);
		terms = db.getTerms(courseName);
		session.setAttribute("terms", terms);
		
		if(professor !="" && !professor.contains("none")) {
			System.out.println("here..");
			System.out.println(db.getChallenging(professor, courseName));
			System.out.println(db.getRecommendRate(professor, courseName));
			session.setAttribute("challenging", db.getChallenging(professor, courseName));
			session.setAttribute("recommendRate", db.getRecommendRate(professor, courseName));
		}
		else {
			System.out.println("here...");
			session.setAttribute("challenging", "");
			session.setAttribute("recommendRate", "");
		}
		out.println("hey");
		try {
    		request.getRequestDispatcher("/Detail.jsp").forward(request,response);
    	}catch(IOException e) {
    		e.printStackTrace();
    	}catch(ServletException e) {
    		e.printStackTrace();
    	}
	}

}

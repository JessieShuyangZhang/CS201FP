
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
		double specificGPA = -1;
		int challenging = -1;
		int recommend = -1;

		PrintWriter out = response.getWriter();
		//for debug
		System.out.println("courseName "+courseName);
		System.out.println("term "+term);
		System.out.println("Professor "+professor);
		
		Database db = new Database();
		
//		request.setAttribute("courseName", courseName);
//		request.setAttribute("courseDescription", db.getDescription(courseName));
		if(courseName == "" && professor == "") {
//			session.setAttribute("specificGPA",db.getSpecificGPA("none", "none", courseName));
			specificGPA=db.getSpecificGPA("none", "none", courseName);
		}
		else {
//			System.out.println(db.getSpecificGPA(term,professor, courseName));
//			session.setAttribute("specificGPA",db.getSpecificGPA(term, professor, courseName));
			specificGPA=db.getSpecificGPA(term, professor, courseName);
		}
		
		if(professor !="" && !professor.contains("none")) {
//			session.setAttribute("challenging", db.getChallenging(professor, courseName));
//			session.setAttribute("recommendRate", db.getRecommendRate(professor, courseName));
			challenging=db.getChallenging(professor, courseName);
			recommend=db.getRecommendRate(professor, courseName);
		}
		else {
//			session.setAttribute("challenging", "");
//			session.setAttribute("recommendRate", "");
		}
		System.out.println("in servlet");
		out.println(specificGPA+" "+challenging+" "+recommend);
		out.flush();
		out.close();
	}

}



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String course = request.getParameter("course");
		String term = request.getParameter("term");
		String professor = request.getParameter("professor");
		String gpa = request.getParameter("gpa");
		String recommend = request.getParameter("recommend");
		String challenging = request.getParameter("challenging");
		HttpSession session = request.getSession();
		
		//connect to database and upload the data
		Database db = new Database();
		boolean upload = db.upload(course, term, professor, gpa, recommend, challenging);
		
		if(upload)
		{
			session.setAttribute("message", "Congrats! You successfully upload your GPA!");
		}
		else {
			session.setAttribute("message", "Upload fail. Please try again.");
		}
		
		//direct back to upload page
		try {
    		request.getRequestDispatcher("/Upload.jsp").forward(request,response);
    	}catch(IOException e) {
    		e.printStackTrace();
    	}catch(ServletException e) {
    		e.printStackTrace();
    	}
	}

}

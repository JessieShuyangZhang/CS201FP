package xiaoyanq_CSCI201L_Final_Project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import javax.websocket.Session;


@WebServlet(name="chartServlet", urlPatterns={"/chartServlet"})

public class chartServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
		
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Database database = new Database();
			String term = request.getParameter("term");
			String course = request.getParameter("course");
			ArrayList<String> listProfessor = database.get_All_Professor_Given_Term_And_Course(term, course);
			ArrayList<Integer> listGPA = database.get_All_GPA_Given_Term_And_Course(term, course);
			HttpSession session = request.getSession();
			session.setAttribute("listProfessor", listProfessor);
			session.setAttribute("listGPA", listGPA);	
		}	
}

import Database.Database;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;


@WebServlet(name="RegisterServlet", urlPatterns={"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Database database = new Database();
		String errmsg1 = "";
		String errmsg2 = "";
		boolean hasIssue = false;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		PrintWriter out = response.getWriter();
		if (!password.equals(confirm)) {
			errmsg1 = "The passwords do not match. ";
			hasIssue = true;
		}
		if (database.userExist(username)) {
			errmsg2 = "This username is already taken. ";
			hasIssue = true;
		}
		String errmsg = errmsg1 + errmsg2;
		if (!hasIssue) {
			database.addUser(username, password);
		}
		out.println(errmsg);
		
		if (errmsg.trim().contentEquals("")) { // Successful
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect("Homepage.jsp");
			return;			
		}
		
	}
	
}

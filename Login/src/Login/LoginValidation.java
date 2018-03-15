package Login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.*;
import javax.servlet.*;

/**
 * Servlet implementation class LoginValidation
 */
@WebServlet("/LoginValidation")
public class LoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginValidation() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("email");
		String password = request.getParameter("pwd");
		PrintWriter out = response.getWriter();
		int flag = 0;
		try {
			flag = new loginClass().validation(username , password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			if(flag > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("userid", flag);
				session.setAttribute("username", username);
				RequestDispatcher rd = request.getRequestDispatcher("Profile.jsp");
				rd.forward(request, response);
			}
			else {
				out.println("ERROR");
				RequestDispatcher rd = request.getRequestDispatcher("LoginPage.html");
				rd.forward(request, response);
			}
	}

}

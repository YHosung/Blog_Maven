package project;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO dao = new UserDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("utf-8");
			HttpSession session = req.getSession();
			String name = (String)session.getAttribute("user");
			User user = dao.getUserByUsername(name);
			System.out.println(user.toString());
			req.setAttribute("user", user);
			req.getRequestDispatcher("project/userInfo.jsp").forward(req, res);
		} catch (Exception e) {
			e.printStackTrace();
			res.sendRedirect("project/projectList.jsp");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("utf-8");
			int aid = Integer.parseInt(req.getParameter("aid"));
			String name = req.getParameter("name");
	        String password = req.getParameter("password");
	        String email = req.getParameter("email");
	     
			User user = new User();
			user.setAid(aid);
			user.setEmail(email);
			user.setName(name);
			user.setPassword(password);
			System.out.println(user.toString());
			
			dao.updateUser(user);
			
			res.sendRedirect("project/projectList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			res.sendRedirect("project/projectList.jsp");
		}
	}
}

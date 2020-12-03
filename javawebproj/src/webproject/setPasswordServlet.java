package webproject;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "/setPasswordServlet")

public class setPasswordServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		UserService ps=new UserService();
		ServletContext sc = getServletConfig().getServletContext();
		String username = request.getParameter("username4");
		String password = request.getParameter("password");
		//List<Users> ul = ps.getUsers((JDBCKonnekt)sc.getAttribute("jk"));
		int operatorResult = ps.modifyPassword(username, password, (JDBCKonnekt)sc.getAttribute("jk"));
		request.setAttribute("returnType",3);
        request.setAttribute("operatorResult",operatorResult);
        request.setAttribute("username",username);
        request.getRequestDispatcher("/result.jsp").forward(request,response);
	}
}

package webproject;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "/delUserServlet")

public class delUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("username2");
        UserService service = new UserService();
        ServletContext sc = getServletConfig().getServletContext();
        int operatorResult = service.DelUser(username,(JDBCKonnekt)sc.getAttribute("jk"));
        request.setAttribute("returnType",1);
        request.setAttribute("operatorResult",operatorResult);
        request.setAttribute("username",username);
        //5.��ת��
        //response.sendRedirect(request.getContextPath()+"/operateResultServlet");
        request.getRequestDispatcher("/result.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

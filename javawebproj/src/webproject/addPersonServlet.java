package webproject;
import javax.servlet.ServletContext;

import java.beans.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTMLDocument;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.*;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

@WebServlet(name = "/addPersonServlet")
public class addPersonServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		response.setCharacterEncoding("utf-8");
        /*
        Map<String, String[]> map = request.getParameterMap();
        
        for(Iterator iter = map.entrySet().iterator();iter.hasNext();){
            Map.Entry element = (Map.Entry)iter.next();
            Object strKey = element.getKey();
            Object strObj = element.getValue();
            //System.out.println(strKey+" "+strObj);
        	}
        */
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String agetemp = request.getParameter("age");
		String teleno = request.getParameter("teleno");
		int age = 0;
		try {
		    age = Integer.parseInt(agetemp);
		} catch (NumberFormatException e) {
		    e.printStackTrace();
		}
		
		//System.out.println(username+" "+name+" "+age+" "+teleno+"\n");
		
        Person person = new Person(username,name,age,teleno);
        /*try{
            BeanUtils.populate(person,map);
        }catch (Exception e){
            e.printStackTrace();
        }*/
        //4.����Service����
        PersonService service = new PersonService();
        ServletContext sc = getServletConfig().getServletContext();
        int operatorResult = service.addOrModifyPerson(person,(JDBCKonnekt)sc.getAttribute("jk"));
        request.setAttribute("returnType",0);
        request.setAttribute("operatorResult",operatorResult);
        request.setAttribute("username",person.getUsername());
        //5.��ת��
        //System.out.println(person.getUsername());
        request.getRequestDispatcher("/result.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Category;
import dao.DAOFactory;

/**
 * Servlet implementation class AddSubCategory
 */
@WebServlet("/AddSubCategory")
public class AddSubCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
  		String category_name,subcategoryname;
  		RequestDispatcher rq;
  		boolean b;
  		
  		category_name =request.getParameter("categoryname");
  		subcategoryname=request.getParameter("subcategory");
  		
  		Category category=new Category();
  		category.setCategory(category_name);
  		category.setSubcategory(subcategoryname);
  		DAOFactory dao = DAOFactory.getDao();
  		b = dao.addSubCategory(category);
  		if(b == false) {
  			b = dao.addCategory(category_name);
  	  		if(b == true) {
  	  			request.setAttribute("error", "This Category is already added");
  	  			rq = request.getRequestDispatcher("subcategory.jsp");
  	  			rq.forward(request, response);
  	  		}else {
  	  		    request.setAttribute("error", "Category is not added");
	  			rq = request.getRequestDispatcher("subcategory.jsp");
	  			rq.forward(request, response);
  	  		}
  		}else {
  			request.setAttribute("success", "Category is successfully added");
  			rq = request.getRequestDispatcher("subcategory.jsp");
  			rq.forward(request, response);
  		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

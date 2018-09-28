package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.DALOAD;

import bean.CategoryOffer;
import dao.DAOFactory;

/**
 * Servlet implementation class CategoryOfferAction
 */
@WebServlet("/CategoryOfferAction")
public class CategoryOfferAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category_name,discount;
		RequestDispatcher rq;
		category_name=request.getParameter("category_name");
		discount=request.getParameter("discount");
		DAOFactory dao=DAOFactory.getDao();
		CategoryOffer categoryoffer=new CategoryOffer();
		categoryoffer.setCategory_name(category_name);
		categoryoffer.setDiscount(discount);
		boolean b=dao.insertCategoryOffer(categoryoffer);
	  		if(b == true) {
  	  			request.setAttribute("success", "Category is successfully added");
  	  			rq = request.getRequestDispatcher("categoryoffer.jsp");
  	  			rq.forward(request, response);
  	  		}else {
  	  		    request.setAttribute("error", "Category is not added");
	  			rq = request.getRequestDispatcher("categoryoffer.jsp");
	  			rq.forward(request, response);
  	  		}
  	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

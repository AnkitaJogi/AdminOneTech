package action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.Product;
import dao.DAOFactory;

@WebServlet("/EditProductAction")
public class EditProductAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "upload";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024*1024*50;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOFactory dao  = DAOFactory.getDao();
		Product product = new Product();
		if (!ServletFileUpload.isMultipartContent(request)) 
		{
			PrintWriter writer = response.getWriter();
			writer.println("Request does not contain upload data");
			writer.flush();
			return;
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);

		String uploadPath = getServletContext().getRealPath("")
				+ File.separator + UPLOAD_DIRECTORY;
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) 
		{
			uploadDir.mkdir();
		}

		try {
			List formItems = upload.parseRequest(request);
			Iterator iter = formItems.iterator();
			
			while (iter.hasNext()) 
			{
				
				FileItem item = (FileItem) iter.next();
				
				if(item.getFieldName().equals("epname"))
				{
					
					product.setProduct_name(item.getString());
				}
				else if(item.getFieldName().equals("epcategory")) {
					
					product.setCategory(item.getString());
				}
				else if(item.getFieldName().equals("epprice")) {
					
					product.setPrice(item.getString());
				}
				else if(item.getFieldName().equals("epstock")) {
					
					product.setStock(item.getString());
				}
				else if(item.getFieldName().equals("equantity")) {
					System.out.println("hello");
					product.setQty(item.getString());
				}
				else if(item.getFieldName().equals("epoffer")) {
					
					product.setOffer(item.getString());
				}
				else if(item.getFieldName().equals("teditimage1"))
				{
					product.setImage1(item.getString());
				}
				else if(item.getFieldName().equals("teditimage2"))
				{
					product.setImage2(item.getString());
				}
				else if(item.getFieldName().equals("teditimage3"))
				{
					product.setImage3(item.getString());
				}
				else if(item.getFieldName().equals("teditimage4"))
				{
					product.setImage4(item.getString());
				}
				 else if (!item.isFormField() && item.getFieldName().equals("epimage1")) 
					{
						String image1 = new File(item.getName()).getName();
						System.out.println("1="+image1);
						product.setImage1(image1);
						String filePath1 = uploadPath + File.separator + image1;
						File storeFile1 = new File(filePath1);
						item.write(storeFile1);
					}else
					if (!item.isFormField() && item.getFieldName().equals("epimage2")) 
					{
						String image2 = new File(item.getName()).getName();
						System.out.println("2="+image2);
						product.setImage2(image2);
						String filePath2 = uploadPath + File.separator + image2;
						File storeFile2 = new File(filePath2);
						item.write(storeFile2);
					}else
					if (!item.isFormField() && item.getFieldName().equals("epimage3")) 
					{
						String image3 = new File(item.getName()).getName();
						System.out.println("3="+image3);
						product.setImage3(image3);
						String filePath3 = uploadPath + File.separator + image3;
						File storeFile3 = new File(filePath3);
						item.write(storeFile3);
					}else
					if (!item.isFormField() && item.getFieldName().equals("epimage4")) 
					{
						String image4 = new File(item.getName()).getName();
						System.out.println("4="+image4);
						product.setImage4(image4);
						String filePath4 = uploadPath + File.separator + image4;
						File storeFile4 = new File(filePath4);
						item.write(storeFile4);
					}
				
				int id=Integer.parseInt(request.getParameter("product_id"));
				product.setId(id);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		boolean status = dao.updateProduct(product);
		RequestDispatcher rd;
		if(status) {
			request.setAttribute("msg", "Edit Product Successfully");
			rd = request.getRequestDispatcher("product_list.jsp");
		}
		else {
			request.setAttribute("msg", "Try After sometime");
			rd = request.getRequestDispatcher("product_list.jsp");
		}
		rd.forward(request, response);
	}
}



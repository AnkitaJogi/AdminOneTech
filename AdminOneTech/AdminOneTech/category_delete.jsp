<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="false" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@page import="dao.DAOFactory"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    boolean f = false;
    
	String category_id=request.getParameter("category_id"); 	
	DAOFactory dao = DAOFactory.getDao();
	System.out.println(category_id);
	  
	if(category_id.contains(",")){
		String ids[] = category_id.split(",");
		for(String i : ids)
			f = dao.deleteCategory(i);	
	}else{
		f = dao.deleteCategory(category_id);
	}
	
	if(f == true)
		response.sendRedirect("allcategory.jsp");
	else
		out.print("Not Delete"); 
%>
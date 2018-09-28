<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="false" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@page import="dao.DAOFactory"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    boolean f = false;
    
	String dis_id=request.getParameter("discount_id"); 	
	DAOFactory dao = DAOFactory.getDao();
	System.out.println(dis_id);
	  
	if(dis_id.contains(",")){
		String ids[] = dis_id.split(",");
		for(String i : ids)
			f = dao.deleteDiscount(i);	
	}else{
		f = dao.deleteDiscount(dis_id);
	}
	
	if(f == true)
		response.sendRedirect("categoryoffer.jsp");
	else
		out.print("Not Delete"); 
%>
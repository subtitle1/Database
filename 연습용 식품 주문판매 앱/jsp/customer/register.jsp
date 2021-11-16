<%@page import="service.AdminService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	
	AdminService service = AdminService.getInstance();
	service.addNewCustomer(name, tel);
	
	response.sendRedirect("list.jsp");
	
%>
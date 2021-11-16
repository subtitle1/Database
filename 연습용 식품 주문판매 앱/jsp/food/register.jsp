<%@page import="vo.Category"%>
<%@page import="service.AdminService"%>
<%@page import="vo.Food"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	
	AdminService service = AdminService.getInstance();
	Category category = service.getCategoryByNo(categoryNo);
	
	Food food = new Food();
	food.setCategory(category);
	food.setName(name);
	food.setPrice(price);
	food.setStock(amount);
	
	service.addNewFood(food);
	
	response.sendRedirect("list.jsp");
%>
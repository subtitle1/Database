<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark my-3">
		<div class="container-fluid">
	    	<a class="navbar-brand" href="/food-app/home.jsp">식품 판매 프로그램</a>
	    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
	      		<span class="navbar-toggler-icon"></span>
	    	</button>
	    	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	      		<ul class="navbar-nav">
	        		<li class="nav-item"><a class="nav-link" href="/food-app/home.jsp">홈</a></li>
	        		<li class="nav-item"><a class="nav-link" href="/food-app/category/list.jsp">카테고리</a></li>
			        <li class="nav-item dropdown">
			          	<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">식품관리</a>
			          	<ul class="dropdown-menu">
			            	<li><a class="dropdown-item" href="/food-app/food/list.jsp">목록</a></li>
			            	<li><a class="dropdown-item" href="/food-app/food/form.jsp">신규 식품 등록</a></li>
			          	</ul>
			        </li>
			        <li class="nav-item dropdown">
			          	<a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown">고객관리</a>
			          	<ul class="dropdown-menu">
			            	<li><a class="dropdown-item" href="/food-app/customer/list.jsp">목록</a></li>
			            	<li><a class="dropdown-item" href="/food-app/customer/form.jsp">신규 고객 등록</a></li>
			          	</ul>
			        </li>
			        <li class="nav-item dropdown">
			          	<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">주문관리</a>
			          	<ul class="dropdown-menu">
			            	<li><a class="dropdown-item" href="/food-app/order/list.jsp">목록</a></li>
			            	<li><a class="dropdown-item" href="/food-app/order/form.jsp">식품 주문</a></li>
			          	</ul>
			        </li>
	      		</ul>
	    	</div>
	  	</div>
	</nav>
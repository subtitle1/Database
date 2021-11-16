<%@page import="vo.Category"%>
<%@page import="java.util.List"%>
<%@page import="service.AdminService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<title>식품 판매 프로그램</title>
</head>
<body>

<div class="container">
	<%@ include file="../common/navigation.jsp" %>
<%
	AdminService service = AdminService.getInstance();
	List<Category> categories = service.getAllCategories();
%>
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">신규 식품 등록</div>
				<div class="card-body">
					<form class="row g-3" method="post" action="register.jsp">
  						<div class="col-md-6">
    						<label for="category" class="form-label">카테고리</label>
    						<select class="form-control" id="category" name="categoryNo">
    							<option value="" selected disabled> 카테고리를 선택하세요</option>
<%
	for (Category cat : categories) {
%>
								<option value="<%=cat.getNo() %>"> <%=cat.getName() %></option>
<%
	}
%>
    						</select>
  						</div>
  						<div class="col-md-6">
    						<label for="name" class="form-label">제품명</label>
    						<input type="text" class="form-control" id="name" name="name">
  						</div>
  						<div class="col-md-6">
    						<label for="price" class="form-label">가격</label>
    						<input type="number" class="form-control" id="price" name="price" value="5000">
  						</div>
  						<div class="col-md-6">
    						<label for="amount" class="form-label">입고량</label>
    						<input type="text" class="form-control" id="amount" name="amount" value="10">
  						</div>
  						<div class="col-12 text-end">
    						<button type="submit" class="btn btn-primary">등록</button>
  						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
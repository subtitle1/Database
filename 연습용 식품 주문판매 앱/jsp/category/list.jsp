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
				<div class="card-header">카테고리 목록</div>
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="15%">
							<col width="85%">
						</colgroup>
						<thead>
							<tr>
								<th>카테고리번호</th>
								<th>카테고리이름</th>
							</tr>
						</thead>
						<tbody>
<%
	for (Category category : categories) {
%>
							<tr>
								<td><%=category.getNo() %></td>
								<td><a href="../food/list.jsp?catNo=<%=category.getNo()%>"><%=category.getName() %></a></td>
							</tr>
<%
	}
%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
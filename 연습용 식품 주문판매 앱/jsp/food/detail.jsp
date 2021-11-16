<%@page import="vo.Food"%>
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
	
	// detail.jsp?foodNo=식품번호 요청을 처리하는 jsp다
	int foodNo = Integer.parseInt(request.getParameter("foodNo"));
	Food food = service.getFoodDetail(foodNo);

%>
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">식품 정보</div>
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="15%">
							<col width="35%">
							<col width="15%">
							<col width="35%">
						</colgroup>
						<tbody>
							<tr>
								<th>식품번호</th>
								<td><%=food.getNo() %></td>
								<th>카테고리</th>
								<td><a href="list.jsp?catNo=<%=food.getCategory().getNo() %>"><%=food.getCategory().getName() %></a></td>
							</tr>
							<tr>
								<th>식품이름</th>
								<td><%=food.getName() %></td>
								<th>식품가격</th>
								<td><%=food.getPrice() %></td>
							</tr>
							<tr>
								<th>재고량</th>
								<td><%=food.getStock() %></td>
								<th>판매여부</th>
								<td><%=food.getOnSale() %></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
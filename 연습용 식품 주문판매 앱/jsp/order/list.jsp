<%@page import="vo.OrderItem"%>
<%@page import="vo.Order"%>
<%@page import="java.util.List"%>
<%@page import="vo.Customer"%>
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
	
	List<Order> orders = service.getAllOrders();
%>
	<div class="row mb-3">
		<div class="col">
			<div class="card">
				<div class="card-header">전체 주문 내역</div>
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="15%">
							<col width="15%">
							<col width="25%">
							<col width="25%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>주문번호</th>
								<th>주문상태</th>
								<th>주문날짜</th>
								<th>총 주문금액</th>
								<th>고객명</th>
							</tr>
						</thead>
						<tbody>
<%
	for (Order order : orders) {
%>
							<tr>
								<td><a href="detail.jsp?orderNo=<%=order.getNo() %>"><%=order.getNo() %></a></td>
								<td><%=order.getStatus() %></td>
								<td><%=order.getCreatedDate() %></td>
								<td><%=order.getTotalPrice() %></td>
								<td><%=order.getCustomer().getName() %></td>
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
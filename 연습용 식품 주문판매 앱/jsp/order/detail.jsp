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
	
	int orderNo = Integer.parseInt(request.getParameter("orderNo"));
	Order order = service.getOrderDetail(orderNo);
	List<OrderItem> orderItems = order.getItems();

%>
	<div class="row mb-3">
		<div class="col">
			<div class="card">
				<div class="card-header">주문 정보</div>
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
								<th>주문번호</th>
								<td><%=order.getNo() %></td>
								<th>주문날짜.</th>
								<td><%=order.getCreatedDate() %></td>
							</tr>
							<tr>
								<th>고객번호</th>
								<td><%=order.getCustomer().getNo()%></td>
								<th>고객명</th>
								<td><a href="../customer/detail.jsp?custNo=<%=order.getCustomer().getNo()%>"><%=order.getCustomer().getName() %></a></td>
							</tr>
							<tr>
								<th>총 주문금액</th>
								<td><%=order.getTotalPrice() %></td>
								<th>적립포인트</th>
								<td><%=(int)(order.getTotalPrice()*0.01) %></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">주문 식품 목록</div>
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="15%">
							<col width="25%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>식품번호</th>
								<th>식품이름</th>
								<th>식품가격</th>
								<th>주문수량</th>
								<th>주문금액</th>
							</tr>
						</thead>
						<tbody>
<%
	for (OrderItem orderItem : orderItems) {
%>
							<tr>
								<td><%=orderItem.getFood().getNo() %></td>
								<td><a href="../food/detail.jsp?foodNo=<%=orderItem.getFood().getNo()%>"><%=orderItem.getFood().getName() %></a></td>
								<td><%=orderItem.getFood().getPrice() %></td>
								<td><%=orderItem.getAmount() %></td>
								<td><%=orderItem.getFood().getPrice()*orderItem.getAmount() %></td>
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
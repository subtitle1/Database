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
	
	int customerNo = Integer.parseInt(request.getParameter("custNo"));
	Customer customer = service.getCustomer(customerNo);
	List<Order> orders = service.getOrdersByCustomerNo(customerNo);

%>
	<div class="row mb-3">
		<div class="col">
			<div class="card">
				<div class="card-header">고객 정보</div>
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
								<th>고객번호</th>
								<td><%=customer.getNo() %></td>
								<th>가입일</th>
								<td><%=customer.getCreatedDate() %></td>
							</tr>
							<tr>
								<th>고객명</th>
								<td><%=customer.getName() %></td>
								<th>전화번호</th>
								<td><%=customer.getTel() %></td>
							</tr>
							<tr>
								<th>적립포인트</th>
								<td><%=customer.getPoint() %></td>
								<th>입실/퇴실</th>
								<td><%=customer.getInOut()%></td>
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
				<div class="card-header">주문 목록</div>
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="15%">
							<col width="25%">
							<col width="30%">
							<col width="30%">
						</colgroup>
						<thead>
							<tr>
								<th>주문번호</th>
								<th>주문날짜</th>
								<th>주문상태</th>
								<th>총 주문금액</th>
							</tr>
						</thead>
						<tbody>
<%
	if (orders.isEmpty()) {
%>
							<tr>
								<td class="text-center" colspan="4">주문내역이 존재하지 않습니다.</td>
							</tr>
<%
	} else {
		for (Order order : orders) {
%>
							<tr>
								<td><a href="../order/detail.jsp?orderNo=<%=order.getNo()%>"><%=order.getNo() %></a></td>
								<td><%=order.getCreatedDate() %></td>
								<td><%=order.getStatus() %></td>
								<td><%=order.getTotalPrice() %></td>
							</tr>
<%
		}
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
<%@page import="vo.Customer"%>
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
	// customer.jsp 요청을 처리하는 jsp다
	AdminService service = AdminService.getInstance();

	List<Customer> customers = service.getAllCustomers();
%>
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">고객 목록</div>
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="15%">
							<col width="15%">
							<col width="30%">
							<col width="30%">
						</colgroup>
						<thead>
							<tr>
								<th>고객번호</th>
								<th>고객명</th>
								<th>전화번호</th>
								<th>입실/퇴실</th>
							</tr>
						</thead>
						<tbody>
<%
	for (Customer customer : customers) {
%>
							<tr>
								<td><%=customer.getNo() %></td>
								<td><a href="detail.jsp?custNo=<%=customer.getNo()%>"><%=customer.getName() %></a></td>
								<td><%=customer.getTel() %></td>
								<td><%=customer.getInOut() %></td>
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
<%@page import="vo.Food"%>
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
	// food.jsp로 요청되는 경우와 food.jsp?catNo=???로 요청되는 두가지 요청을 처리하는 jsp다.
	String tempCategoryNo = request.getParameter("catNo");

	AdminService service = AdminService.getInstance();
	
	List<Food> foods = List.of(); // List.of()는 비어있는 리스트를 하나 만든 것
	if (tempCategoryNo == null) { // food.jsp 요청인 경우
		foods = service.getAllFoods();
	} else {					  // food.jsp?catNo=???.jsp 요청인 경우
		int categoryNo = Integer.parseInt(tempCategoryNo);
		foods = service.getFoodsByCategory(categoryNo);
	}

%>
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">식품 목록</div>
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="15%">
							<col width="20%">
							<col width="*%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th>식품번호</th>
								<th>카테고리</th>
								<th>식품명</th>
								<th>가격</th>
								<th>판매여부</th>
							</tr>
						</thead>
						<tbody>
<%
	for (Food food : foods) {
%>
							<tr>
								<td><%=food.getNo() %></td>
								<td><%=food.getCategory().getName() %></td>
								<td><a href="detail.jsp?foodNo=<%=food.getNo()%>"><%=food.getName() %></a></td>
								<td><%=food.getPrice() %></td>
								<td><%=food.getOnSale() %></td>
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
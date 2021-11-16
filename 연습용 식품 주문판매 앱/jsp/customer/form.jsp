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
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">신규 고객 등록</div>
				<div class="card-body">
					<form class="row g-3" method="post" action="register.jsp">
  						<div class="col-md-6">
    						<label for="name" class="form-label">고객이름</label>
    						<input type="text" class="form-control" id="name" name="name">
  						</div>
  						<div class="col-md-6">
    						<label for="tel" class="form-label">전화번호</label>
    						<input type="text" class="form-control" id="tel" name="tel">
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
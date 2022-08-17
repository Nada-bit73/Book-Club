<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="m-4 container">
			<div class="row ml-5 mt-1 ">
				<div class="span6">
				<div class="d-flex justify-content-between">
							<h1 class="head">Welcome ,<c:out value="${userName}" /> !</h1>
							<p class="ml-4 mt-2">
								<a href="/logout">Logout</a>
							</p>
				</div>
				
				<div class="d-flex justify-content-between mt-3">
							<p>Books from everyone's shelves</p>
							<p>
								<a href="/form">+ add to my shelf</a>
							</p>
				</div>
				
					<div class="row ml-5 mt-2 mr-3">
						<table class="table table-hover display nowrap mt-4">
							<thead>
								<tr>
									<th colspan="1">Id</th>
									<th colspan="1">Title</th>
									<th colspan="2">Author Name</th>
									<th colspan="2">Posted By</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${books}">
									<tr>
										<td colspan="1"><c:out value="${item.id}" /></td>
										<td colspan="1">
										<a href="/view/<c:out value="${item.id}" />">
										<c:out value="${item.title}" />
										</a>
										</td>
										<td colspan="2"><c:out value="${item.author}" /></td>
										<td colspan="2"><c:out value="${item.user.getUserName()}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				
					
						
							
						
						
					

					
				</div>
			</div>
	</div>
</body>
</html>


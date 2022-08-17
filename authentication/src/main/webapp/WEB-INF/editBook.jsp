<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Book</title>
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
<div class="container">
		<c:if test="${sucess != null}">
			<div class="alert alert-sucess" role="alert">
				<c:out value="${sucess}" />
			</div>
		</c:if>
	</div>
	<div class="d-flex justify-content-center m-4 container">
		<div class="align-items-center">
			<div class="row ml-5 mt-1 ">
				<div class="span6">
					<div class="row ml-5 mt-2 mr-3 ">
					<div class="d-flex justify-content-between">
						<h1>Change your Entry</h1>
						<form class="form align-items-right ml-4 mt-2" action="/home" method="GET">
							
							<button type="submit" class="btn btn-link text-right">Go Back</button>
								
						</form>
						</div>
						<!-- ----------------------------------------------------------- -->
						<form:form  class="form align-items-center mt-4" action="/process/${bookId}"
						method="POST" modelAttribute="book">							
						<input type="hidden" value="PUT" name="_method">
						<div class="row mb-3">
							 <form:label class="form-label" path="title">Title:</form:label>
								<div class="col-12">
									<form:input type="text" path="title" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
									<form:errors cssClass="invalid-feedback" path="title"/>
								</div>
							</div>	
						
							
							<div class="row mb-3">
							 <form:label class="form-label" path="author">Author:</form:label>
								<div class="col-12">
									<form:input type="text" path="author" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
									<form:errors cssClass="invalid-feedback" path="author"/>
								</div>
							</div>		
							
							
							<div class="row mb-3">
							 <form:label class="form-label" path="thoughts">thoughts:</form:label>
								<div class="col-12">
									<form:input type="text"  path="thoughts" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
									<form:errors cssClass="invalid-feedback" path="thoughts"/>
								</div>
							</div>
							
							
							<div class="row mb-3">
								<div class="col-12">
									<button class="btn btn-large btn-dark" type="submit">submit</button>
								</div>
							</div>

						</form:form>						

					</div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>
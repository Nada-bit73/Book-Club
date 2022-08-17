<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Book Details</title>
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
	<div class="d-flex justify-content-center m-4 container">
		<div class="align-items-center">
			<div class="row ml-5 mt-1 ">
				<div class="span6">
					<div class="row ml-5 mt-2 mr-3 ">
						<div class="d-flex justify-content-between">
						
						<h1><c:out value="${book.title}"></c:out></h1>
						
						<form class="form align-items-right ml-4 mt-2" action="/home" method="GET">
							
							<button type="submit" class="btn btn-link text-right">Go Back</button>
								
						</form>
						</div>

						<!-- ----------------------------------------------------------- -->
						<div class="row ml-5 mt-2 mr-3 ">
						<h5>
						<span class="red"><c:out value="${book.user.getUserName()}"/></span> Read 
						<span class="head"><c:out value="${book.title}"/></span>
						 by <span class="green"><c:out value="${book.author}"/></span>
						 <div class="mt-4">
						 Here are <c:out value="${book.user.getUserName()}"/>'s thoughts :
						 </div>
						
						</h5>
						</div>
						
						<hr>
						<div class="row ml-5 mt-2 mr-3 ">
						<p>
						<c:out value="${book.thoughts}"/>
						</p>
						</div>

						<hr>
							

						<!-- -------------------------------------------------------- -->
						<div class="row ml-5 mt-2 mr-3 ">
						
						<form class="form align-items-right ml-4 mt-2" action="/edit/<c:out value="${book.id}"></c:out>" method="GET">
							
							<button type="submit" class="btn btn-dark">edit</button>
								
						</form>
</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>
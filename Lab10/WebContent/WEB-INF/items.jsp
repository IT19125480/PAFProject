<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.Item" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Item Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/items.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-8">
 
 			<h1 class="m-3">Item Management</h1>
 			
			<form id="formItem" name="formItem">
			
 			Item code: 
				<input id="itemCode" name="itemCode" type="text" class="form-control form-control-sm">
			<br> Item name: 
				<input id="itemName" name="itemName" type="text" class="form-control form-control-sm">
			<br> Item price: 
				<input id="itemPrice" name="itemPrice" type="text" class="form-control form-control-sm">
			<br> Item description: 
				<input id="itemDesc" name="itemDesc" type="text" class="form-control form-control-sm">
			<br> Quantity:
				<input id="quantity" name="quantity" type="text" class="form-control form-control-sm">
			<br>
			<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
			
			<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
			
			</form>
			
			<div id="alertSuccess" class="alert alert-success">
		
			</div>
			<div id = "alertError" class = alert alert-danger></div>

			<br>
			<div id="divItemsGrid">
 			<%
 				Item itemObj = new Item(); 
 				out.print(itemObj.readItems()); 
 			%>
			</div>

		</div>
	</div>
</div>

</body>
</html>
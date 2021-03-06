<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "com.Item" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Item Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/items.js"></script>
</head>
<body>

<%

//Save---------------------------------
if (request.getParameter("itemCode") != null) 
{ 
	Item itemObj = new Item(); 
	String stsMsg = "";
	
	//Insert--------------------------
	if (request.getParameter("hidItemIDSave") == "") 
	{ 
		stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
		request.getParameter("itemName"), 
		request.getParameter("itemPrice"), 
		request.getParameter("itemDesc"),
		request.getParameter("quantity"));
	} 
	else//Update----------------------
	{ 
		stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"), 
		request.getParameter("itemCode"), 
		request.getParameter("itemName"), 
		request.getParameter("itemPrice"), 
		request.getParameter("itemDesc"),
		request.getParameter("quantity"));
	} 
	session.setAttribute("statusMsg", stsMsg); 
} 

//Delete-----------------------------
if (request.getParameter("hidItemIDDelete") != null) 
{ 
	System.out.println("delete");
	Item itemObj = new Item(); 
	String stsMsg = itemObj.deleteItem(request.getParameter("hidItemIDDelete")); 
	session.setAttribute("statusMsg", stsMsg); 
}
%>
<div class="container">
	<div class="row">
		<div class="col-8">
 
 			<h1 class="m-3">Student details</h1>
 			
			<form id="formItem" name="formItem" method="post" action="items.jsp">
			
 				Item code: 
					<input id="itemCode" name="itemCode" type="text" class="form-control form-control-sm">
				<br> Item name: 
					<input id="itemName" name="itemName" type="text" class="form-control form-control-sm">
				<br> Item price: 
					<input id="itemPrice" name="itemPrice" type="text" class="form-control form-control-sm">
				<br> Item description: 
					<input id="itemDesc" name="itemDesc" type="text" class="form-control form-control-sm">
				<br>Quantity:
					<input id="quantity" name="quantity" type="text" class="form-control form-control-sm">
				<br>
			
				<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
			
				<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
			
			
				<div id="alertSuccess" class="alert alert-success">
				<%
 					out.print(session.getAttribute("statusMsg")); 
				%>
				</div>
			</form>
			
			<div id = "alertError" class = alert alert-danger>

			<br>
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
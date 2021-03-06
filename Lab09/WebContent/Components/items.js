$(document).ready(function()
{ 
	if ($("#alertSuccess").text().trim() == "") 
 	{ 
 		$("#alertSuccess").hide(); 
 	} 
 	$("#alertError").hide(); 
}); 


// SAVE ============================================
$(document).on("click", "#btnSave", function(event) 
{ 
	// Clear alerts---------------------
 	$("#alertSuccess").text(""); 
	$("#alertSuccess").hide(); 
 	$("#alertError").text(""); 
 	$("#alertError").hide();

	// Form validation-------------------
	var status = validateItemForm(); 
	if (status != true) 
 	{ 
 		$("#alertError").text(status); 
 		$("#alertError").show(); 
 		return; 
 	}

	// If valid------------------------
 	$("#formItem").submit();
}); 


//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
 	$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val()); 
 	$("#itemCode").val($(this).closest("tr").find('td:eq(0)').text()); 
 	$("#itemName").val($(this).closest("tr").find('td:eq(1)').text()); 
 	$("#itemPrice").val($(this).closest("tr").find('td:eq(2)').text()); 
 	$("#itemDesc").val($(this).closest("tr").find('td:eq(3)').text());
	$("#quantity").val($(this).closest("tr").find('td:eq(4)').text()); 
});


// CLIENT-MODEL================================================================
function validateItemForm() 
{ 
	// CODE
	if ($("#itemCode").val().trim() == "") 
 	{ 
 		return "Insert Item Code."; 
	} 
	// NAME
	if ($("#itemName").val().trim() == "") 
	{ 
		return "Insert Item Name."; 
 	} 
	// PRICE-------------------------------
	if ($("#itemPrice").val().trim() == "") 
 	{ 
 		return "Insert Item Price."; 
 	} 
	// is numerical value
	var tmpPrice = $("#itemPrice").val().trim(); 
	if (!$.isNumeric(tmpPrice)) 
 	{ 
 		return "Insert a numerical value for Item Price."; 
 	} 
	// convert to decimal price
	 $("#itemPrice").val(parseFloat(tmpPrice).toFixed(2)); 
	// DESCRIPTION------------------------
	if ($("#itemDesc").val().trim() == "") 
 	{ 
 		return "Insert Item Description."; 
 	}
	//quantity
	if ($("#quantity").val().trim() == "") 
 	{ 
 		return "Insert Item quantity."; 
 	} 
	return true; 
}

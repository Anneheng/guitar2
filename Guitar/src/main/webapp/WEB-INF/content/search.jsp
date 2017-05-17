<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>search</title>
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
		
<!-- 		<script src="//code.jquery.com/jquery-1.12.4.js"></script> -->
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
		
		<style type="text/css">
			table tr td {
				padding:5px;
			}
			table tr thead {
				padding:5px;
			}
		</style>
		
		<script type="text/javascript">
			$(function(){
				
				$("#btn").click(function(){
					//alert("Submitted");
					var dataParams = {
						builder : $('#builder').val(),
						model : $('#model').val(),
						type : $('#type').val(),
						backWood : $('#backWood').val(),
						topWood : $('#topWood').val(),
						numStrings : $('#numStrings').val().toString()
				   };
				   var params = $.param(dataParams);
				   //console.log(params);
				   
				   $.post('${pageContext.request.contextPath}/queryAction_search', dataParams, function(rec){
					   var _html = "<br><table border='1' cellpadding='10'><thead><tr>" + 
							                "<th>Builder</th>" + 
							                "<th>Model</th>" + 
							                "<th>Type</th>" + 
							                "<th>NumStrings</th>" + 
							                "<th>BackWood</th>" + 
							                "<th>TopWood</th>" + 
							                "<th>Price</th>" + 
							        "</tr></thead>";
					   if( rec.data.length > 0 ){
						   var data = rec.data;
						   for( var i in data ){
							   _html = _html + 
							   			"<tr>" + 
								        	"<td>" + data[i].builder + "</td>" + 
								            "<td>" + data[i].model + "</td>" + 
								            "<td>" + data[i].type + "</td>" + 
								            "<td>" + data[i].numStrings + "</td>" + 
								            "<td>" + data[i].backWood + "</td>" + 
									        "<td>" + data[i].topWood + "</td>" + 
								            "<td>" + data[i].price + "</td>" + 
								        "</tr>";
						   }
								        
					   }
					   _html = _html + "</table>";
					   $('#tableId')["0"].innerHTML = _html;
				   }, "json");
				   
				});
// 					$('#example').DataTable( {
// 				        "ajax" : '${pageContext.request.contextPath}/queryAction_search',
// 				        "columns": [
// 				            { "data": "Builder" },
// 				            { "data": "Model" },
// 				            { "data": "Type" },
// 				            { "data": "NumStrings" },
// 				            { "data": "BackWood" },
// 				            { "data": "TopWood" },
// 				            { "data": "Price" }
// 				        ]
// 				    } );
				
			});
	    </script>
</head>
<body>
		<div style="padding: 100px 100px 10px;">
		    <form class="bs-example bs-example-form" role="form" method="post">
		    	
		    				  <label for="builder">Builder:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		    				  <br>
		    				  <input type="text" id="builder" name="builder" class="form-control" style="width: 226px">
					    	 
		    			<br>
			                  <label for="type">Type:&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		    			<br>
					    	  <input type="text" id="type" name="type" class="form-control" style="width: 226px">
					    	  
		    			<br>
		    	  			<label for="backWood">BackWood:</label>
		    			<br>
		    				<input type="text" id="backWood" name="backWood" class="form-control" style="width: 226px">
		    				
		    			<br>
		    				<label for="topWood">TopWood:&nbsp;</label>
		    			<br>
		    				<input type="text" id="topWood" name="topWood" class="form-control" style="width: 226px">
		    			<br>
			    			<label for="model">Model:&nbsp;</label>
			    		<br>
			    			<input type="text" id="model" name="model" class="form-control" style="width: 226px">
		    			<br>
		    				<label for="numStrings">NumStrings:&nbsp;</label>
		    			<br>
		    				<input type="text" id="numStrings" name="numStrings" class="form-control" style="width: 226px">
		    			
		    </form>
		    <br>
		        <button id="btn" class="btn btn-default">search</button>
		    <br>
		    <div id="tableId">
		    	
		    </div>
<!-- 			<table id="example" class="display" cellspacing="0" width="100%"> -->
<!-- 		        <thead> -->
<!-- 		            <tr> -->
<!-- 		                <th>Builder</th> -->
<!-- 		                <th>Model</th> -->
<!-- 		                <th>Type</th> -->
<!-- 		                <th>NumStrings</th> -->
<!-- 		                <th>BackWood</th> -->
<!-- 		                <th>TopWood</th> -->
<!-- 		            </tr> -->
<!-- 		        </thead> -->
<!-- 		    </table> -->
		</div>
		
		
</body>
</html>
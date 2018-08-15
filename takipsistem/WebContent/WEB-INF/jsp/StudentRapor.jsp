<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" type="text/javascript"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js" type="text/javascript"></script>
	<title></title>
	<style>
	body {
		font-size: 19px;
	}
	table{
		width: 80%;
		margin: 30px auto;
		border-collapse: collapse;
		text-align: left;
	}
	tr {
		border-bottom: 1px solid #cbcbcb;
	}
	th, td{
		border: none;
		height: 30px;
		padding: 2px;
	}
	tr:hover {
		background: #F5F5F5;
	}

	form {
		width: 40%;
		margin: 50px auto;
		text-align: left;
		padding: 10px; 
		border: 1px solid #bbbbbb; 
		border-radius: 5px;
	}
	.input-group {
		margin: 10px 0px 10px 0px;
	}
	.input-group label {
		display: block;
		text-align: left;
		margin: 3px;
	}
	.input-group input {
		height: 30px;
		width: 60%;
		padding: 5px 10px;
		font-size: 16px;
		border-radius: 5px;
		border: 1px solid gray;
	}
	.btn2{   
		padding: 10px;
		font-size: 15px;
		border: none;
		border-radius: 5px;
		background: #5BA4A2;
	}
	.msg {
		margin: 30px auto; 
		padding: 10px; 
		border-radius: 5px; 
		color: #3c763d; 
		background: #dff0d8; 
		border: 1px solid #3c763d;
		width: 50%;
		text-align: center;
	}
	.rapor{
		width: 97.5%;
		border: 1px solid #bbbbff; 
		border-radius: 5px;


	}

</style>

<link rel="stylesheet" href="https://bootswatch.com/readable/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

	<form id="testForm" name="testForm" >
		<div class = "input-group">
			<label> <h2>Öğrenci Durum Raporu</h2> </label>
			<label>   </label>
			<label>Öğrenci Numarası : ${studentNumber}</label>
			<label>Staj Sorumlusu : ${managerName}</label>
			<input type="text" style="display: none;" name="studentNumber" id="studentNumber" value="${studentNumber}">
			<input type="text" style="display: none;" name="managerName" id="managerName" value="${managerName}">
		</div>   	
		<div class = "input-group">							
			<br>
			<div>
				<p>
					<label>Rapor</label>
					<textarea id="report" cols="65" rows="10" tabindex="4"> </textarea>
				</p>   	
			</div>
		</div>  
		<input type="submit"  id="add-person" class="btn2" value="Kaydet">
	</form> 

	<script>
	
		$(document).ready(function() {

			$("#customerForm").submit(function(event) {
		// Prevent the form from submitting via the browser.
		event.preventDefault();
		ajaxPost();
	     });


			function ajaxPost(){
				<%  System.out.println("AJAX ÇALIŞTIII !!");%>
				  var studentNumber = $("#studentNumber").val();
			      var managerName = $("#managerName").val();
			      var reportDate = $(this).datepicker( 'getDate' );
			      var report = $("#report").val();
				
			     
			    var data = JSON.stringify({"studentNumber":studentNumber,"managerName":managerName,"reportDate":reportDate,"report":report 
			      }); 
			     
			    $.ajax({
			        type : "POST",
			        url : "${pageContext.request.contextPath}/addReport",
			        contentType: "application/json",
			        data : data,
			        success: function(data){
			          alert("Rapor Başarılı !");		    

			        }
			      });
			      
      }
  
});

</script>
</body>
</html>
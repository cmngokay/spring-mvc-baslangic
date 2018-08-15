<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Öğrenci Durum Raporu</title>
  
  
  <style type="text/css">
  .btn {
    padding: 10px;
    font-size: 15px;
    color: white;
    background: #5F9EA0;
    border: none;
    border-radius: 5px;
  }  
  
  </style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://bootswatch.com/readable/bootstrap.min.css" />
</head>
<body>

<input type="text" style="display: none;" name="studentNumber" id="studentNumber" value="${studentNumber}" />
<input type="text" style="display: none;" name="managerName" id="managerName" value="${managerName}" />


<div style="text-align: center;">
	<div>
	<h3>Öğrenci Durum Raporu</h3>
	<p>Öğrenci Numarası  : </p><h4>${studentNumber}</h4>	
	<p>Stajyer Sorumlusu : </p><h5>${managerName}</h5>
	<textarea rows="10" cols="90" name="report" id="report" placeholder="Rapor yazınız...">
</textarea>	
<div class = "input-group">
<button type="button" id="add-report" name="add-report" class="btn">Kaydet</button> 
</div>

<p class="gizli" style="display: none;">***gizlidir gözükmez.***</p>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"
integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
crossorigin="anonymous">
</script>

<script >

$(document).ready(function(){

    $("#add-report").click(function(){

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


    });   
	
	
	
});



</script>


</body>
</html>

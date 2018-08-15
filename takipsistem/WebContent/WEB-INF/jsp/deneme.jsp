<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
<script type="text/javascript">
<script src="jquery-3.3.1.min.js"></script>
<head>
 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>JSP Page</title>
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
    width: 45%;
    margin: 50px auto;
    text-align: left;
    padding: 20px; 
    border: 1px solid #bbbbbb; 
    border-radius: 5px;
  }
  .input-group {
    margin: 10px 0px 10px 0px;
  }
  .input-group2 {
  	margin: 10px 0px 10px 140px;
  }
   .input-group2 input {
    height: 30px;
    width: 17%;
    padding: 5px 10px;
    font-size: 16px;
    border-radius: 5px;
    border: 1px solid gray;
  }
  .input-group label {
    display: block;
    text-align: left;
    margin: 3px;
  }
  .input-group input {
    height: 30px;
    width: 93%;
    padding: 5px 10px;
    font-size: 16px;
    border-radius: 5px;
    border: 1px solid gray;
  }
  .btn {
    padding: 10px;
    font-size: 15px;
    color: white;
    background: #5F9EA0;
    border: none;
    border-radius: 5px;
  }
  .update-student {
    text-decoration: none;
    padding: 2px 5px;
    background: #2E8B57;
    color: white;
    border-radius: 5px;
  }

  .sill_btn {
    text-decoration: none;
    padding: 2px 5px;
    color: red;
    border-radius: 3px;
    background: #880000;
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




</style>

<link rel="stylesheet" href="https://bootswatch.com/readable/bootstrap.min.css" />
</head>
<body>

 <form  >
  <div class = "input-group">
   <label> <h2>Stajyer Öğrenci Kayıt</h2> </label>
   <label>   </label>
   <label>Numara</label>
   <input type="text" name="studentNumber" id="studentNumber" placeholder="Öğrenci numarası giriniz...">
 </div>   
 <div class = "input-group">
   <label>ADI</label>
   <input type="text" name="studentName" id="studentName" placeholder="İsim giriniz...">
 </div>  
 <div class = "input-group">
   <label>SOYADI</label>
   <input type="text" name="studentSurname" id="studentSurname" placeholder="Soyisim giriniz...">
 </div>
 <div class = "input-group">
   <label>Staj Baslangıc Tarihi</label>
   <input type="date" name="internshipStarDate" id="internshipStartDate" placeholder="Staj Başlangıç Tarihi">
 </div>
 <div class = "input-group">
   <label>Staj Bitis Tarihi</label>
   <input type="date" name="internshipDeadline" id="internshipDeadline" placeholder="Staj Bitiş Tarihi">
 </div>  
 
 <div class = "input-group">
   <label>Staj Sorumlusu</label>
  			 <select id="managerName">
    			<c:forEach items="${managerList}" var="manager">    			
    				<option>${manager.managerName}</option>    			
    			</c:forEach>
    		</select>
 </div>  

 <div class = "input-group">
  <button type="button" id="add-student" class="btn">Kaydet</button> 
</div>  

</form> 

<div class = "input-group2">
 <input id="myInput" type="text" placeholder="Arama...">
</div>

<table id="student-list" class="display" >
  <thead>
    <tr>
      <th>Numara</th>
      <th>Ad</th>
      <th>Soyad</th>
      <th>Staj Baslangıc Tarihi</th>
      <th>Staj Bitis Tarihi</th>
      <th>Staj Sorumlusu</th>
      <th></th>
      <th colspan="5">İşlem</th>
    </tr>
  </thead>
  <tbody id="myTable">
    <c:forEach items="${studentsList}" var="student">
    <tr>
      <td> ${student.studentNumber}</td>
      <td class="display${student.studentNumber}" id="displaystudentName${student.studentNumber}"> ${student.studentName}</td>
      <td class="display${student.studentNumber}" id="displaystudentSurname${student.studentNumber}"> ${student.studentSurname}</td>
      <td class="display${student.studentNumber}" id="displayinternshipStartDate${student.studentNumber}"> ${student.internshipStartDate}</td>
      <td class="display${student.studentNumber}" id="displayinternshipDeadline${student.studentNumber}"> ${student.internshipDeadline}</td>
      <td class="display${student.studentNumber}" id="displaymanagerName${student.studentNumber}"> ${student.managerName}</td>
      <td> 

        <td style="display: none;" class="edit${student.studentNumber}"> 
          <input type="text" name="editstudentName${student.studentNumber}" id="editstudentName${student.studentNumber}" value="${student.studentName}" />
        </td>

        <td style="display: none;" class="edit${student.studentNumber}"> 
          <input type="text" name="editstudentSurname${student.studentNumber}" id="editstudentSurname${student.studentNumber}" value="${student.studentSurname}" />
        </td>

        <td style="display: none;" class="edit${student.studentNumber}"> 
          <input type="text" name="editinternshipStartDate${student.studentNumber}" id="editinternshipStartDate${student.studentNumber}" value="${student.internshipStartDate}" />
        </td>

        <td style="display: none;" class="edit${student.studentNumber}"> 
          <input type="text" name="editinternshipDeadline${student.studentNumber}" id="editinternshipDeadline${student.studentNumber}" value="${student.internshipDeadline}" />
        </td>,
        
        <td style="display: none;" class="edit${student.studentNumber}"> 
          <input type="text" name="editmanagerName${student.studentNumber}" id="editmanagerName${student.studentNumber}" value="${student.managerName}" />
        </td>
        
        <!--UPDATE-->
        <td>
          <input type="button" class="update-student" data-item-id="${student.studentNumber}" id="update-student${student.studentNumber}" value="Update" /> 
        </td>
       <!-- DELETE-->
        <td>
          <input type="button" class="sill_btn" data-item-id="${student.studentNumber}" id="delete-student${student.studentNumber}" value="Delete" /> 
        </td>
        <!--REPORT -->
        <td>
        <a href="reportStudent?studentNumber=${student.studentNumber}"
											class="report_btn" type="button">Report</a> 
        </td>

        <td style="display: none;" class="edit${student.studentNumber}">
          <input type="button"  class="update-student" data-item-id="${student.studentNumber}" id="edit-student${student.studentNumber}" value="Confirm" /> 

        </td>
        <td id="updatecheck${student.studentNumber}" style="display: none"><span class="label label-success" >OK</span></td>
      </tr>
    </c:forEach>                

  </tr>         
</tbody>
</table>




<span class="otherchecks label label-success" style="display: none;">SUCCESS</span>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
crossorigin="anonymous">
</script>


<script>
  $(document).ready(function() {

    $("#add-student").click(function(){

      var studentNumber = $("#studentNumber").val();
      var studentName = $("#studentName").val();
      var studentSurname = $("#studentSurname").val();
      var internshipStartDate = $("#internshipStartDate").val();
      var internshipDeadline = $("#internshipDeadline").val();
	  var managerName = $("#managerName").val();

      var data = JSON.stringify({"studentNumber":studentNumber,"studentName":studentName,
        "studentSurname":studentSurname,"internshipStartDate":internshipStartDate,"internshipDeadline":internshipDeadline,
      		"managerName":managerName  
      });

      $.ajax({
        type : "POST",
        url : "${pageContext.request.contextPath}/addStudent",
        contentType: "application/json",
        data : data,
        success: function(data){
          alert("Kayıt Başarılı !");		    

        }
      });

          $("#studentNumber").val("");
          $("#studentName").val("");
          $("#studentSurname").val("");
          $("#internshipStartDate").val("");  
          $("#internshipDeadline").val(""); 

    }); 	     
    


    $("#student-list").on('click','.update-student',function(){

      var value = $(event.target).val();
      var id = $(event.target).data('itemId');
      var tdclassshow = ".edit"+id;
      var tdclasshide = ".display"+id;

      var editstudentNameid = "#editstudentName"+id;
      var editstudentSurnameid = "#editstudentSurname"+id;
      var editinternshipStarDateid = "#editinternshipStartDate"+id;
      var editinternshipDeadlineid = "#editinternshipDeadline"+id;
	  var editmanagerName = "#editmanagerName"+id;

      var confirmbuttonshow = ".edit"+id;

      if(value==="Update"){
        $(tdclassshow).show();
        $(tdclasshide).hide();
        $(confirmbuttonshow).show();
      }else if(value==="Confirm"){

        var studentName = $(editstudentNameid).val();
        var studentSurname = $(editstudentSurnameid).val();
        var internshipStartDate = $(editinternshipStarDateid).val();
        var internshipDeadline = $(editinternshipDeadlineid).val();
		var managerName = $(editmanagerName).val();
        var data = JSON.stringify({"studentNumber":id ,"studentName":studentName,"studenSurname":studenSurname,
         "internshipStartDate":internshipStartDate,"internshipDeadline":internshipDeadline,"managerName":managerName
       });

        $.ajax({
         type : "PUT",
         url : "${pageContext.request.contextPath}/updateStudent",
         contentType: "application/json",
         data : data,
         success: function(data){

           $(tdclassshow).hide();
           $(tdclasshide).show();
           $(confirmbuttonshow).hide();


           var dispstudentName = "#displaystudentName"+id;
           var dispstudentSurname = "#displaystudentSurname"+id;
           var dispinternshipStartDate = "#displayinternshipStartDate"+id;
           var dispinternshipDeadline = "#displayinternshipDeadline"+id;
           var dispmanagerName = "#displaymanagerName"+id;

           $(dispstudentName).text(studentName);
           $(dispstudentSurname).text(studentSurname);
           $(dispinternshipStartDate).text(internshipStartDate);
           $(dispinternshipDeadline).text(internshipDeadline);
           $(dispmanagerName).text(managerName);

           $('#updatecheck'+id).show();
           setTimeout(function() { $('#updatecheck'+id).hide(); }, 2000);

         }
       });

      }

    });

    $("#student-list").on('click','.sill_btn',function(event){
        var id = $(event.target).data('itemId');
        var data = JSON.stringify(id);
        var rowId= "#"+event.target.id;
        $.ajax({
          type : "DELETE",
          url : "${pageContext.request.contextPath}/deleteStudent",
          contentType: "application/json",
          data : data,
          success: function(data){
           $(rowId).closest('tr').remove();
           $(".otherchecks").show();
           setTimeout(function() { $(".otherchecks").hide(); }, 2000);
         }
       });
      });
    
   $("#student-list").on('click','.report_btn',function(event){
    	var id = $(event.target).data('itemId');
    	var data = JSON.stringify(id);
    	
    	$.ajax({
    		type:"GET",
    		url:"${pageContext.request.contextPath}/reportStudent",
    		contentType: "application/json",
    		data: data,
    		 success: function(data){
    	       		    

    	        }    		
    	});    	
    	
    }); 
    
    
    
    
    $("#myInput").on("keyup",function() {
		var value = $(this).val().toLowerCase();
			$("#myTable tr").filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)});
					});
    
    
  /*   
    var data2 =eval('${studentsList}');
    var table = $('#student-list').DataTable( {
    "aaData": data2,
    "aoColumns": [
    { "mData": "studentNumber"},
    { "mData": "studentName"},
    { "mData": "studentSurname"},
    { "mData": "internshipStartDate"},
    { "mData": "internshipDeadline"},
    { "mData": "managerName"}
    ],
    "paging":true,
    "pageLength":10,
    "ordering":true
       });
        */
    
    
    
    
    
 });

</script>
</body>
</html>

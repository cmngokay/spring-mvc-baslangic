<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
    <link rel="stylesheet" href="https://bootswatch.com/readable/bootstrap.min.css" />
</head>
<body>
    <h1>Stajyer Takip Sistemi</h1>
    
    <input id="myInput" type="text" placeholder="Arama..." />
    <table id="person-list" class="table table-striped table-hover" style="width: 35%">
        <tr>
        
        <th>Numara</th>
        <th>Ad</th>
        <th>Soyad</th>
        <th>Staj Başlangıç Tarihi</th>
        <th>Staj Bitiş Tarihi</th>
        <th>İşlemler</th>
        <!-- <th>Staj Sorumlusu</th> -->
        </tr>
        <!-- //Controller sınıfında -> defaultView() metodu içerisinden list döndürülüyor. -->
        <tbody id="myTable">
        	  <c:forEach items="${studentsList}" var="student">
            <tr>
                <td> ${student.studentNumber}</td>
                <td class="display${student.studentNumber}" id="displaystudentName${student.studentNumber}"> ${student.studentName}</td>
                <td class="display${student.studentNumber}" id="displaystudentSurname${student.studentNumber}"> ${student.studentSurname}</td>
                <td class="display${student.studentNumber}" id="displayinternshipStartDate${student.studentNumber}"> ${student.internshipStartDate}</td>
                <td class="display${student.studentNumber}" id="displayinternshipDeadline${student.studentNumber}"> ${student.internshipDeadline}</td>
               
               
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
                </td>
              
                <td>
                  <input type="button" class="delete-person" data-item-id="${student.studentNumber}" id="delete-person${student.studentNumber}" value="Delete" /> 
                </td>
                <td> 
                  <input type="button" class="update-person" data-item-id="${student.studentNumber}" id="update-person${student.studentNumber}" value="Update" /> 
                </td>
                <td style="display: none;" class="edit${student.studentNumber}">
                  <input type="button"  class="update-person" data-item-id="${student.studentNumber}" id="edit-person${student.studentNumber}" value="Confirm" /> 
                </td>
                <td id="updatecheck${student.studentNumber}" style="display: none"><span class="label label-success" >OK</span></td>
            </tr>
        </c:forEach>
        
        
        
        
        </tbody>
        <tr>
            <td>Stajyer Öğrenci Kayıt</td>
          
            <td><input type="text" name="studentNumber" id="studentNumber" placeholder="Öğrenci numarası giriniz..." /></td>
            <td><input type="text" name="studentName" id="studentName" placeholder="İsim giriniz..." /></td>
            <td><input type="text" name="studentSurname" id="studentSurname" placeholder="Soyisim giriniz..." /></td>
            <td><input type="text" name="internshipStarDate" id="internshipStartDate" placeholder="Staj Başlangıç Tarihi" /></td>
            <td><input type="text" name="internshipDeadline" id="internshipDeadline" placeholder="Staj Bitiş Tarihi" /></td>            
          
            <td>
                <input type="button" id="add-person" value="Add" />
            </td>
        </tr>
    </table>
    <span class="otherchecks label label-success" style="display: none;">SUCCESS</span>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous">
</script>
<script>
    $(document).ready(function() {
        
        $("#add-person").click(function(){
                 
            var studentNumber = $("#studentNumber").val();
            var studentName = $("#studentName").val();
            var studentSurname = $("#studentSurname").val();
            var internshipStartDate = $("#internshipStartDate").val();
            var internshipDeadline = $("#internshipDeadline").val();
         
           
            var data = JSON.stringify({"studentNumber":studentNumber,"studentName":studentName,
            		"studentSurname":studentSurname,"internshipStartDate":internshipStartDate,"internshipDeadline":internshipDeadline	
            });
           
            $.ajax({
            type : "POST",
            url : "${pageContext.request.contextPath}/addPerson",
            contentType: "application/json",
            data : data,
            success: function(data){
        		alert("Kayıt Başarılı !");		    
        	
               }
            });
        });
        
        $("#person-list").on('click','.update-person',function(){
          
            var value = $(event.target).val();
            var id = $(event.target).data('itemId');
            var tdclassshow = ".edit"+id;
            var tdclasshide = ".display"+id;
           
            var editstudentNameid = "#editstudentName"+id;
            var editstudentSurnameid = "#editstudentSurname"+id;
            var editinternshipStarDateid = "#editinternshipStartDate"+id;
            var editinternshipDeadlineid = "#editinternshipDeadline"+id;
          

            var confirmbuttonshow = ".edit"+id;

            if(value==="Update"){
                $(tdclassshow).show();
                $(tdclasshide).hide();
                $(confirmbuttonshow).show();
            }else if(value==="Confirm"){
              
                var studentName = $(editstudentNameid).val();
                var studenSurname = $(editstudentSurnameid).val();
                var internshipStartDate = $(editinternshipStarDateid).val();
                var internshipDeadline = $(editinternshipDeadlineid).val();
                
                var data = JSON.stringify({"studentNumber":id ,"studentName":studentName,"studenSurname":studenSurname,
                	"internshipStartDate":internshipStartDate,"internshipDeadline":internshipDeadline
                });

                $.ajax({
                   type : "PUT",
                   url : "${pageContext.request.contextPath}/updatePerson",
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
                     
                     $(dispstudentName).text(studentName);
                     $(dispstudentSurname).text(studenSurname);
                     $(dispinternshipStartDate).text(internshipStartDate);
                     $(dispinternshipDeadline).text(internshipDeadline);
                     
                     $('#updatecheck'+id).show();
                     setTimeout(function() { $('#updatecheck'+id).hide(); }, 2000);

                   }
                 });
                 
            }
          
        });

        $("#person-list").on('click','.delete-person',function(event){
            var id = $(event.target).data('itemId');
            var data = JSON.stringify(id);
            var rowId= "#"+event.target.id;
            $.ajax({
            type : "DELETE",
            url : "${pageContext.request.contextPath}/deletePerson",
            contentType: "application/json",
            data : data,
            success: function(data){
               $(rowId).closest('tr').remove();
               $(".otherchecks").show();
               setTimeout(function() { $(".otherchecks").hide(); }, 2000);
            }
            });
        });
        
      
        $("#myInput").on("keyup",function() {
			var value = $(this).val().toLowerCase();
				$("#myTable tr").filter(function() {
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)});
						});
        
      
        
        
    });
    
</script>
</body>
</html>

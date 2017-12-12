<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/cs/registeredandnonregistered.css">

</head>
<body>
 <%@ include file="/WEB-INF/views/header.jsp"%>
<div class="space"></div>
    <div class="row">
  <div class="container">
       <div class="col-md-12 padding">
     <form  class="form-inline form" role="form">
          <label class="checkbox-inline " for="Fromdate">
             <input type="checkbox" name="Fromdate" id="fromdatecheckbox"><b>From Date: </b>
          </label>
        <div class="input-group date" > 
    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
    <input type="text" id="startdate" class="form-control" value="" name="startDate">
 </div>



             <label class="checkbox-inline" for="tomdate">
             <input type="checkbox" name="todate"><b>To Date :</b>
          </label>
              <div class="input-group date"> 
    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
    <input type="text"  id="todate" class="form-control" value="" name="todate">
 </div>




             <label class="checkbox-inline" for="walkingid">
             <input type="checkbox" name="Student_Registration" id="Student_Registration_Id_checkbox"><b>Student_Registration_Id:  </b>
          </label>
            <input class="form-control" id="Student_Registration_Id" type="text">

  


                    <button type="button" class="btn btn-default Get" onclick="getregiseredstudents();">Get </button>
     </form>

     <hr class="padtop">

     <div class="dropdown pull-right">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Rigistor & Non-Rigistor
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">Rigistor </a></li>
      <li><a href="123">Non-Rigistor</a></li>
     
    </ul>
  </div>




     </div>
     
     <div class="frmgrup" id="displaystudentlist">
  	 		
            		
            	</div>
     
 </div>
</div>
  
    
    
  <script src="${pageContext.request.contextPath}/jss/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/jss/bootstrap.min.js"></script>
 <script type='text/javascript' src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
<script>
$(document).ready(function() {
    $('#startdate')
        .datepicker({
            format: 'dd/mm/yyyy'
        })
       

        $('#todate')
        .datepicker({
            format: 'dd/mm/yyyy'
        })
       


});
</script>
<script type="text/javascript">

function getregiseredstudents(){
	
var Student_Registration_Id_checkbox	=$('#Student_Registration_Id_checkbox').is(':checked');

var fromdatecheckbox= $('#fromdatecheckbox').is(':checked');
if(fromdatecheckbox==1){
var fromdate= $('#startdate').val();
var todate= $('#todate').val();
	
var search = {"fromdate":fromdate,"todate":todate};
var myJsonStringsearch = JSON.stringify(search);
$.ajax({
		type : "POST",
		url : "studentregisteredinbetweendays", 
		contentType : "application/json",
		async:true,
		cache : false,
		data : myJsonStringsearch,
		dataType : 'json',
		success : function(response) {
			
			 /*if(response==null){
				$("#displaystudentlist").html("");
				alert("Enter Correct Enquiryid");
			} */
			$("#displaystudentlist").html("");
			 abc=response.length;
			 alert(response.length)
						for ( var a = 0; a <abc; a++) {
						if(a==0){
							$("#displaystudentlist").html("<form class='form-inline' role='form'>"+
									 " <table class='table' id='studentlistdata'>"+
									      "</table>"+	 "</form>");
							$('#studentlistdata').html( "<thead>"+
								    "<tr>"+
							         "<th>Enquire-Id:</th>"+
							        " <th >Name:</th>"+
							         "<th > Course:</th>"+
							     " </tr>"+
							     "</thead>"+
							        "<tbody>"+
							        "</tbody>"
					               );
						}
						$('#studentlistdata tbody').append( 
								
								"<tr>"+
						        "<td >" + 
					               " <div class='form-group walkinid'>"+
					                        "<input type='text' class='form-control ' id='enquire"+[a]+"' value="+response[a].studentregistration_id+" name='WalkinId' placeholder='studentregistration_id'>"+
					                    "</div>"+
					       "</td>"+
					        "<td >"+
					            "<div class='form-group NAme'>"+
					                        "<input type='text' class='form-control' id='name."+[a]+"' value="+response[a].studentname+" name='NAme' placeholder=' Studentname'>"+
					                    "</div>"+
					          "</td>"+
					        "<td >" +
					             "<div class='form-group NAme'>"+
					                        "<input type='text' class='form-control' id='Course."+[a]+"' name='course' value="+response[a].coursename+" placeholder=' coursename'>"+
					                    "</div>"+
					        "</td>"+
					        "<td> <input type='button' value='Details'  class='btn btn-default kjhjhj' id='studentlist."+[a]+"' /></td>"+
					      "</tr>");
					}
		    } 
	}); 	
	
	
}













	 if(Student_Registration_Id_checkbox==1){
	 var Student_Registration_Id123= $('#Student_Registration_Id').val();
	   var search = {"regidstudets":Student_Registration_Id123};
	   var myJsonStringsearch = JSON.stringify(search);
	   $.ajax({
			type : "POST",
			url : "registerdstudents", 
			contentType : "application/json",
			async:true,
			cache : false,
			data : myJsonStringsearch,
			dataType : 'json',
			success : function(response) {
				
				 /*if(response==null){
					$("#displaystudentlist").html("");
					alert("Enter Correct Enquiryid");
				} */
				$("#displaystudentlist").html("");
				 abc=response.length;
				 alert(response.length)
							for ( var a = 0; a <abc; a++) {
							if(a==0){
								$("#displaystudentlist").html("<form class='form-inline' role='form'>"+
										 " <table class='table' id='studentlistdata'>"+
										      "</table>"+	 "</form>");
								$('#studentlistdata').html( "<thead>"+
									    "<tr>"+
								         "<th>Enquire-Id:</th>"+
								        " <th >Name:</th>"+
								         "<th > Course:</th>"+
								     " </tr>"+
								     "</thead>"+
								        "<tbody>"+
								        "</tbody>"
						               );
							}
							$('#studentlistdata tbody').append( 
									
									"<tr>"+
							        "<td >" + 
						               " <div class='form-group walkinid'>"+
						                        "<input type='text' class='form-control ' id='enquire"+[a]+"' value="+response[a].studentregistration_id+" name='WalkinId' placeholder='studentregistration_id'>"+
						                    "</div>"+
						       "</td>"+
						        "<td >"+
						            "<div class='form-group NAme'>"+
						                        "<input type='text' class='form-control' id='name."+[a]+"' value="+response[a].studentname+" name='NAme' placeholder=' Studentname'>"+
						                    "</div>"+
						          "</td>"+
						        "<td >" +
						             "<div class='form-group NAme'>"+
						                        "<input type='text' class='form-control' id='Course."+[a]+"' name='course' value="+response[a].coursename+" placeholder=' coursename'>"+
						                    "</div>"+
						        "</td>"+
						        "<td> <input type='button' value='Details'  class='btn btn-default kjhjhj' id='studentlist."+[a]+"' /></td>"+
						      "</tr>");
						}
			    } 
		});  
	 }

}


</script>
</body>
</html>
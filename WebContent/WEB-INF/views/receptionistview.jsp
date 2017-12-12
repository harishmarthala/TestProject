<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/cs/receptionistview.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datepicker3.min.css">
   
<style>
 .table>thead>tr>th {
	    vertical-align: bottom;
	    border-bottom: none;
	}

	.table>tbody>tr>td,  .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	    padding: 8px;
	    line-height: 1.42857143;
	   vertical-align: none; 
	    border-top: none;
	    
	}
	.table>tbody>tr>th{
	  padding-left: 71px;
	  
	    line-height: 1.42857143;
	   vertical-align: none; 
	    border-top: none;
	}
 
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
	<div class="row rowpadding">
  <div class="container-fluid">
  	 <form id="formvalidation" class="form-inline form" role="form">
  	 	  <label class="checkbox-inline" for="Fromdate">
             <input type="checkbox" name="Fromdate" id="fromdatecheckbox" checked="checked"><b>From Date: </b>
          </label>
        <div class="input-group date" id="startdate"> 
    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
    <input type="text" class="form-control" value="" name="fromdate" id="fromdate">
 </div>



             <label class="checkbox-inline" for="tomdate">
             <input type="checkbox" name="todate" id="todatecheckbox" checked="checked"><b>To Date :</b>
          </label>
              <div class="input-group date" id="todate"> 
    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
    <input type="text" class="form-control" value="" name="todate" id="todate1">
 </div>




             <label class="checkbox-inline" for="walkingid">
             <input type="checkbox" name="walkingid" id="enquirecheckbox"><b>Enquire-Id:  </b>
          </label>
            <input class="form-control" id="enquiryid" type="text">

             <label class="checkbox-inline" for="name">
             <input type="checkbox" name="name"><b>Name : </b>
          </label>
            <input class="form-control" id="name" type="text">


                    <button type="button" class="btn btn-default Get" onclick="getrecords();">Get </button>
  	 </form>

  	 <div class="space"></div>

  	 <div class="row">
  	 	<div class="container frmhide">
  	 	<hr class="hr">
  	 		
  	 		<div class="frmgrup" id="displaystudentlist">
  	 		
            		
            	</div>
            	
  	 	</div>
  	 </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/jss/jquery.min.js"></script>

 <script type='text/javascript' src="${pageContext.request.contextPath}/jss/bootstrap.min.js"></script>

    <script type='text/javascript' src="${pageContext.request.contextPath}/jss/bootstrap-datepicker.min.js"></script>
<script>
$(document).ready(function(){
    $(".Get").click(function(){
        $(".frmhide").show();
    });
  

});
</script>

<script>
$(document).ready(function() {
	var d = new Date();
    var curr_date = d.getDate();
    var curr_month = d.getMonth() + 1;
    var curr_year = d.getFullYear();
   var datepicker1= curr_date + "/" + curr_month + "/" + curr_year;
    $("#fromdate").val(datepicker1);
    $("#todate1").val(datepicker1);
    $('#startdate')
        .datepicker({
        	Deafult:true,
            format: 'dd/mm/yyyy'
        })
        .on('changeDate', function(e) {
            // Revalidate the date field
            $('#formvalidation').formValidation('revalidateField', 'startdate');
        });

        $('#todate')
        .datepicker({
            format: 'dd/mm/yyyy'
        })
        .on('changeDate', function(e) {
            // Revalidate the date field
            $('#formvalidation').formValidation('revalidateField', 'startdate');
        });


    $('#formvalidation').formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            startdate: {
                validators: {
                    notEmpty: {  
                        message: 'The date is required'
                    },
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'The date is not a valid'
                    }
                }
            }
        }
    });
});
</script>
 <script type="text/javascript">
  
  var abc="";//length of response
  function getrecords(){
	  $("#displaystudentlist").html("");
	  var fromdateclick = $('#fromdatecheckbox').is(':checked'); 
	  var startdateclick = $('#todatecheckbox').is(':checked');
	  var enquirycheckbox = $('#enquirecheckbox').is(':checked');
	  
	  var enquiryidvalue=$('#enquiryid').val();
	  
	  if(fromdateclick==0 & startdateclick==0 & enquirycheckbox==0){
		  alert("please Select Either Date Or Enquiryid");
	  }
	  else if(fromdateclick==1 & startdateclick==0){
		  alert("please click ToDate checkbox");
	  }
	  else if(fromdateclick==1 & startdateclick==1 & enquirycheckbox==1){
		  alert("please Select Either Date Or Enquiryid");
	  }
	  else if(enquirycheckbox==1 & enquiryidvalue==""){
		  alert("please Enter Enquiry_id");
	  }
	  else if(fromdateclick==0 & startdateclick==1){
		  alert("please click FromDate checkbox");
	  }
	  else if(fromdateclick==0 & startdateclick==0 & enquiryidvalue!="" &enquirycheckbox==1 ){
			 var enquirtidval= $('#enquiryid').val();
			   var search = {"enquiry_id":enquirtidval};
			   var myJsonStringsearch = JSON.stringify(search);
			 // alert(myJsonStringsearch);
			   $.ajax({
					type : "POST",
					url : "filterliststudents", 
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
						for ( var a = 0; a <abc; a++) {
							
							//alert("loop"+response[0].enquiry_id);
								$("#displaystudentlist").html("<form class='form-inline' role='form'>"+
										 " <table class='table' id='studentlistdata'>"+
										 "<thead>"+
										    "<tr>"+
									         "<th>Enquire-Id:</th>"+
									        " <th >Name:</th>"+
									         "<th > Course:</th>"+
									     " </tr>"+
									     "</thead>"+
									        "<tbody>"+
									        "<tr>"+
									       "<td >" + 
								               " <div class='form-group walkinid'>"+
								                        "<input type='text' class='form-control ' id='enquire"+[a]+"' value="+response[a].enquiry_id+" name='WalkinId' placeholder='Enquire Id'>"+
								                    "</div>"+
								       "</td>"+ 
								        "<td >"+
								            "<div class='form-group NAme'>"+
								                        "<input type='text' class='form-control' id='name."+[a]+"' value="+response[a].firstName+" name='NAme' placeholder=' Name'>"+
								                    "</div>"+
								          "</td>"+  
								       "<td >" +
								             "<div class='form-group NAme'>"+
								                        "<input type='text' class='form-control' id='Course."+[a]+"' name='course' value="+response[a].course+" placeholder=' Course'>"+
								                    "</div>"+
								        "</td>"+ 
								        "<td> <input type='button' value='Register'  class='btn btn-default kjhjhj' id='studentlist."+[a]+"' /></td>"+
								      "</tr>"+
									        
									        "</tbody>"+
										 
										      "</table>"+	 "</form>");
								
						
							
						}
					    } 
				});  
		  
		  
		  
	  }
	  else if(fromdateclick==1 & startdateclick==1 | enquirycheckbox==0){
		  
			 var fromdate= $('#fromdate').val();
			 var todate= $('#todate1').val();
			   var search = {"fromdate":fromdate,"todate" : todate};
			   var myJsonStringsearch = JSON.stringify(search);
			   //alert(myJsonStringsearch);
			   $.ajax({
					type : "POST",
					url : "fromdateandtodateurl", 
					contentType : "application/json",
					async:true,
					cache : false,
					data : myJsonStringsearch,
					dataType : 'json',
					success : function(response) {
					
						$("#displaystudentlist").html("");
						 abc=response.length;
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
						                        "<input type='text' class='form-control ' id='enquire"+[a]+"' value="+response[a].enquiry_id+" name='WalkinId' placeholder='Enquire Id'>"+
						                    "</div>"+
						       "</td>"+
						        "<td >"+
						            "<div class='form-group NAme'>"+
						                        "<input type='text' class='form-control' id='name."+[a]+"' value="+response[a].firstName+" name='NAme' placeholder=' Name'>"+
						                    "</div>"+
						          "</td>"+
						        "<td >" +
						             "<div class='form-group NAme'>"+
						                        "<input type='text' class='form-control' id='Course."+[a]+"' name='course' value="+response[a].course+" placeholder=' Course'>"+
						                    "</div>"+
						        "</td>"+
						        "<td> <input type='button' value='Register'  class='btn btn-default kjhjhj' id='studentlist."+[a]+"' /></td>"+
						      "</tr>");
						}
					    } 
				});  
	  }
	  
	

  
  
  
  
  
  
  
  }
  </script>
  <script type="text/javascript">

  $('#displaystudentlist').on('click', '.kjhjhj', function(e) {
	  var idClicked = e.target.id;
  //alert("aaaa"+idClicked);
  var buttonidnumber=idClicked.split('.').pop();
// $('#enquire.'+[buttonidnumber]).val();



var t= $('body').find('#enquire'+buttonidnumber).val();

// alert("asdasd"+t);
 //alert( $('#enquire.'+[buttonidnumber]).val());
 
 
 
  var search = {"enquiry_id":t};
  var myJsonStringsearch = JSON.stringify(search);
 // alert(myJsonStringsearch);
  $.ajax({
		type : "POST",
		url : "listofstudentview", 
		contentType : "application/json",
		async:true,
		cache : false,
		data : myJsonStringsearch,
		dataType : 'json',
		success : function(response) {
			window.location.href = "${pageContext.request.contextPath}/hom";
		/* $("#clickhom").click(); */
		//alert();
		}
		
  
  
  
  });
	 
  });
  
 
  </script>
</body>
</html>
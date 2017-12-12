<%@page import="com.trinee.spring.model.Course"%>
<%@page import="com.trinee.spring.model.Registration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/cs/registerall.css" rel="stylesheet">
<style type="text/css">

.space1{
     padding-top: 74px;
}
.leftfield{
    position: relative;
    right: 34px;
}

</style>
</head>
<%List<Course> courses=(List<Course>)session.getAttribute("coursetable"); %>
<%Registration studentdetails=(Registration)session.getAttribute("student"); %>

<body>
<input type="hidden" value="<%=studentdetails.getEnquiry_id()%>" id="enquiryid">
<%@ include file="/WEB-INF/views/header.jsp"%>
 <div class="space"></div>


    <div class="container">
      <div class="row">
        <div class="panel-body">

          <div class="space"></div>
              <div class="col-md-6 border">
                <div class="text-center">
                  <h4>Information About the Student</h4>

                </div>
                
                <hr class="hr">
                  <form id="registerForm" method="POST" >
                            
                              <div class="col-md-6">
                                <div class="form-group">
                                <select class="form-control " name="state"  id="typeofidproof">
                                    <option value="">Select Id Proof</option>
                                    <option value="adhar card">adhar card</option>
                                    <option value="voter id ">voter id </option>
                                    <option value="pan card">pan card</option>
                                    <option value="driving license">driving license</option> 
                                      <option value="ration card">ration card</option>
                                 </select>
                              </div>
                             </div>

                          <div class="col-md-6">
                        <div class="form-group">
                          
                          <input type="text" class="form-control" id="proofidnum" placeholder="Enter-Id-Number">
                           </div>
                        </div>
                          <div class="col-md-6">
                        <div class="form-group">
                          
                            <textarea class="form-control textar" name="address" placeholder=" Type You Are Address " id="temporaryadress"></textarea>
                           </div>
                        </div>
</form>
      
        
          </div>  <!-- 1st col-md-6 -->
          
          
          
         <div class=" col-md-6">
         <div class="row">
         

          <div class="text-center">
            <h4> Fee sechudule:</h4>
          </div>
          <hr class="hr">
          
          <div class="col-md-8">
                                 <div class="form-group">
                                <select class="form-control " name="state" id="courseid" onchange="coursemoney();" >
                                  
                                  
                                  
                                  
                                  
                                    <option value="select">Select Course</option>
                                   
                                   <%for(Course course:courses){ %>
                                   <option value="<%=course.getCoursename()%>"><%=course.getCoursename()%></option>
                                   <%    } %>
                                 </select>
                              </div>
                             </div>
                             
                           
                             
                             <div class="col-md-4"></div>
                             
                             
                               <div class="space1"></div>
                             
                          
                             
                             
                             
                           <div id="feediv" style="display: none;"><!-- feediv -->
                             
                             <div class="col-md-6 ">
                             <p class="pull-right">Total Amount Of Course Fee : </p>
                             
                             </div>
                             <div class="col-md-6">
                             
                             <p id="totalfee"></p>
                             </div>
                             
                             
                             <div class="space1"></div>
                               
                             <div class="col-md-6 ">
                             <p class="pull-right">Registration Fee : </p>
                             
                             </div>
                             <div class="col-md-6">
                             
                             
                             <div class="form-group col-md-8">
                          <small id="regamounterror" style="color: red;position: relative;left: -30px;"></small>
                          <input type="text" class="form-control leftfield" id="enterdamount" placeholder="Enter Amount" onblur="clculateamount();">
                         
                           </div>
                           
                        <div class="col-md-4"></div>
                        <div class="line"></div>
                            
                             </div>
                             
                              <div class="col-md-6 ">
                             <p class="pull-right remaingamunt">Remaining Amount : </p>
                             
                             </div>
                             
                             <div class="col-md-6 ">
                             
                            <p class="remaingamunt" id="remainingamount"></p>
                             </div>
                             
                             <button  class="btn btn-info pull-right" onclick="paymentpagesubmit();">Submit</button>
                             
                             </div><!-- feediv -->

          
             
       
  </div>

</div>
         </div><!-- Panel-Body -->
     
   

          </div><!--  Row  -->

         </div><!-- Container  -->
      <script type="text/javascript" src="${pageContext.request.contextPath}/jss/jquery.min.js"></script>
       <script type="text/javascript">
       function clculateamount(){
    	 var enterdamount= parseInt($("#enterdamount").val());
    	var totalfee =parseInt($('#totalfee').text());
    	if(totalfee>enterdamount){
    	   var remainingbalance=totalfee-enterdamount;
    	   $('#remainingamount').text(remainingbalance);
    	   $("#regamounterror").text(' ');
    	}
    	else if(totalfee<enterdamount){
    	$("#regamounterror").text('Select bellow totalfee');	
    	}
    	 
       }
       </script>
     <script type="text/javascript">
   
  
     function coursemoney() {
    	 if($("#courseid").val()=="select"){
    	     $("#feediv").hide();
    	    }
    	 else{
    		 $("#regamounterror").text('');
    		 $("#remainingamount").text('');
    		 $("#enterdamount").val('');
    	 $("#feediv").show();
    	 }
    	 
   var	coursename= $("#courseid").val();
   	<%for(Course course:courses){%>
    	if(coursename=="<%=course.getCoursename()%>"){
    	var cost=<%=course.getCoursecost()%>
    	$("#totalfee").text(cost);
    	}
    	
    	<%}%>
	}
     </script>
     <script type="text/javascript">
     function paymentpagesubmit() {
    	 
    	
		 var search = {"typeofidproof":$("#typeofidproof").val(),"proofidnum":$("#proofidnum").val(),"temporaryadress":$("#temporaryadress").val(),"coursename":$("#courseid").val(),"totalfee":$("#totalfee").text(),"remainingamount":$("#remainingamount").text(),"paidamount":$("#enterdamount").val(),"enquiryid":$("#enquiryid").val()};
		  var myJsonStringsearch = JSON.stringify(search);
		 // alert(myJsonStringsearch);
		  $.ajax({
				type : "POST",
				url : "selectedcourseandpayment", 
				contentType : "application/json",
				async:true,
				cache : false,
				data : myJsonStringsearch,
				dataType : 'json',
				success : function(response) {
						window.location.href = "${pageContext.request.contextPath}/tot";
					/* $("#clickhom").click(); */
				//alert();
				}
				
		  
		  
		  
		  });
	}
     
     
     
     </script>
     



</body>
</html>
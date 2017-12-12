<%@page import="java.math.BigDecimal"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.math.RoundingMode"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Insert title here</title>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/formValidation.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datepicker3.min.css">

            <link href="${pageContext.request.contextPath}/cs/registraion.css" rel="stylesheet">
</head>

<body class="backclr" onload="DrawCaptcha();" >
<c:set var="a" value="66.666667"/>



  <nav id="myNavbar" class="navbar navbar-default  navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">
              <img src="${pageContext.request.contextPath}/images/logo15.png" width=300px; height=70px;></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav">
              <!--   <li class="active"><a href="http://www.tutorialrepublic.com" target="_blank">Home</a></li>
                <li><a href="http://www.tutorialrepublic.com/about-us.php" target="_blank">About</a></li>
                <li><a href="http://www.tutorialrepublic.com/contact-us.php" target="_blank">Contact</a></li> -->
            </ul>
        </div>
    </div>
</nav>

<section class="regbdy">


<div class="container">

  <div class="col-md-2"></div>
   <div class="col-md-9">
  
     <!-- ROW ============ -->
<div class="row">
   

   <div class="panel panel-info">
     <div class="panel-heading">
            <h4 class="modal-title" id="myModalLabel">Booking Enquiry Form</h4>
            <!--   <p>Please Register to Shop at <b>Yael's Everything Store</b>.
                You will instantly receive hundreds of amazing shopping deals,  
                or go back to our <a href="">main site</a>.</p> -->
        </div>

         <div class="panel-body">


   <!--============ FORM ============-->
   
    <form:form name="studentenquiry" class="form-horizontal" id="registrationForm" role="form" commandName="registraion" action="registraionofstudent" method="POST" enctype="multipart/form-data" onsubmit="return submitenquiryform();" >
          

       
          
        
    <div class="col-sm-9 col-lg-9 ">  

     
  <table class="table">
    <tbody>
      <tr>
         <!--  First Name Field  -->
        <td class="col-sm-12 col-lg-6">
        <div class="form-group">
       <div class="col-md-12">
            <form:input type="text" class="form-control" path="firstName" id="firstnameid"  placeholder="First name" min="2" maxlength="25" onblur="onblurfirstname();" />
         <small id="firstNameerror" style="color: red;"><form:errors path="firstName"  cssClass="error" /></small> 
        </div>
    </div>


        </td>

        <!--   Last Name Field  -->
        <td class="col-sm-12 col-lg-6">
  <div class="form-group">
       
        <div class="col-md-12">
            <form:input type="text" class="form-control" path="lastName"  id="lastnameid" placeholder="Last name" min="2" maxlength="25" onblur="onblurlastname();" />
            <small id="lastNameerror" style="color: red;"> <form:errors path="lastName"  cssClass="error" /> </small>  
        </div>
    </div>

        </td>


      
      </tr>

                <tr>
         <!-- State DropDown Field   -->
        <td class="col-sm-12 col-lg-6">
          <div class="form-group ">
       
          <div class="col-md-12">
            <form:select class="form-control " path="gender" id="genderid" onblur="onblurgender();" >
<option value="">Gender</option>
      <form:option value="bangalore">Male</form:option>
      <form:option value="bangalore">Female </form:option>
      <form:option value="bangalore">Others</form:option>
      </form:select>
  <small id="gendererror" style="color: red;"><form:errors path="gender"  cssClass="error" /></small> 
          </div>
        </div>
        </td>

         <!-- District DropDown Field   -->
       <td class="col-sm-12 col-lg-6"> 
         <div class="form-group">
          <div class="col-md-12">
        <div class="date dateContainer">
            <div class="input-group input-append date" id="startdate123">
                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                <form:input type="text" class="form-control" path="dob" id="dobid" placeholder="DOB" onchange="onblurdob();" />
                 
            </div>
        </div>
        <small id="doberror" style="color: red;"><form:errors path="dob"  cssClass="error" /></small>
        </div>
    </div>
    </td>

      </tr>



      <tr>
         <!--  Email Field -->
        <td class="col-sm-12 col-lg-6">
                  
        <div class="form-group">
          
          <div class="col-md-12">
            <form:input type="email" class="form-control "   path="email" placeholder="Email" id="emailid" maxlength="50" min="6" onblur="onbluremail();"/>
            <small id="emailerror" style="color: red;"><form:errors path="email"  cssClass="error" /></small>          
          </div>
        </div>

          
        </td>

           <!-- Alternative Email Field -->
        <td class="col-sm-12 col-lg-6"> 
         
        <div class="form-group ">
          
          <div class="col-md-12">
            <form:input type="email" class="form-control "  path="alternate_email" id="altemailid" placeholder="Alternative  Email" min="6" maxlength="50" onblur="onbluralteremai();" />
             <small id="alternateemailerrorr" style="color: red;"><form:errors path="alternate_email"  cssClass="error" /></small> 
          </div>
        </div>
      
    </td>
     
      </tr>

      <tr>
           <!--  Mobile Number Field -->
        <td class="col-sm-12 col-lg-6">
          <div class="form-group ">
     
          <div class="col-md-12">
            <form:input type="text" class="form-control "  path="mobile" id="mobileid" placeholder="Mobile Number" min="10" maxlength="10" onblur="onblurmobile();"/>
             <small id="mobileerror" style="color: red;"><form:errors path="mobile"  cssClass="error" /></small> 
          </div>
        </div>



        </td>
           <!--  =Alternative Mobile Number Field  -->
        <td class="col-sm-12 col-lg-6">
          <div class="form-group ">
     
          <div class="col-md-12">
            <form:input type="text" class="form-control "  path="alternate_mobile"  id="altmobleid" placeholder="Alternative mobile number" min="10" maxlength="10"  onblur="onbluralternatemobile();"/>
            <small id="alt_mobileerror" style="color: red;"><form:errors path="alternate_mobile"  cssClass="error" /></small> 
          </div>
        </div>

        </td>


      </tr>

      <tr>
         <!--  Address Field -->
        <td class="col-sm-12 col-lg-6">
    <div class="form-group ">

          <div class="col-md-12">
    <form:textarea class="form-control textareafield"  path="permanentaddress" id="permanentaddressid" placeholder=" Type You Are Address" min="5" maxlength="50" onblur="onbluradress();"></form:textarea>
        <small id="adresserror" style="color: red;"><form:errors path="permanentaddress"  cssClass="error" /></small> 
          </div>
        </div>
        </td>

         <!--   district Field -->
        <td class="col-sm-12 col-lg-6">
          <div class="form-group has-feedback">

          
          <div class="col-md-12">


  <form:input type="text" class="form-control " path="location" id="location"  placeholder="location" min="3" maxlength="40" onblur="onblurlocation();"/>
  
 <small id="locationerror" style="color: red;"><form:errors path="location"  cssClass="error" /></small> 
</div>
        </div>
        </td>
      </tr>



       <tr>
         <!-- State DropDown Field   -->
        <td class="col-sm-12 col-lg-6">
          <div class="form-group ">
       
          <div class="col-md-12 geo-details">
          
          
          
          
           <form:input  class="form-control " path="district" data-geo="administrative_area_level_2" value="" id="setting_city"   placeholder="district" min="3" maxlength="40" onblur="onblurdistrict();"/>
  
 <small id="distrciterror" style="color: red;"><form:errors path="district"  cssClass="error" /></small> 
 
 
 
          </div>
        </div>
        </td>

    <!-- Pin Code Field   -->
   <td class="col-sm-12 col-lg-6">
             <div class="form-group">
         
          <div class="col-md-12 geo-details">
          
          
          
            <form:input  class="form-control " path="state"   data-geo="administrative_area_level_1" value="" id="setting_state"    placeholder="State" min="3" maxlength="40" onblur="onblurstate();"/>
      
<small id="stateerror" style="color: red;"><form:errors path="state"  cssClass="error" /></small> 

<%-- 
            <form:input type="text" class="form-control " path="pincode" id="pincodeid"  placeholder="Pincode" min="6" maxlength="6" onblur="onblurpincode();"/>
          <small id="pincodeerror"style="color: red;"><form:errors path="pincode"  cssClass="error" /> </small> --%>
          </div>
        </div>
      

        </td>

      </tr>
      
        <tr>
         <!-- State DropDown Field   -->
        <td class="col-sm-12 col-lg-6">
          <div class="form-group ">
       
          <div class="col-md-12 geo-details">
            <form:input type="text" class="form-control " path="country" data-geo="country" value="" id="setting_country"  placeholder="Country" min="3" maxlength="40" onblur="onblurcountry();"/>
          
          
 
<small id="countryerror" style="color: red;"><form:errors path="country"  cssClass="error" /></small> 
          </div>
        </div>
        </td>

    <!-- Pin Code Field   -->
   <td class="col-sm-12 col-lg-6">
             <div class="form-group ">
         
          <div class="col-md-12">
            <form:input type="text" class="form-control " path="pincode" id="pincodeid"  placeholder="Pincode" min="6" maxlength="6" onblur="onblurpincode();"/>
          <small id="pincodeerror"style="color: red;"><form:errors path="pincode"  cssClass="error" /> </small>
          </div>
        </div>
      

        </td>

      </tr>

      

 <tr>
         <!-- College Name Field   -->
        <td class="col-sm-12 col-lg-6">
             <div class="form-group ">
         
          <div class="col-md-12">
            <form:input type="text" class="form-control " path="college"  id="collegeid" placeholder="College Name" min="3" maxlength="40" onblur="onblurcollegename();"/>
         <small id="collegenameerror" style="color: red;"><form:errors path="college"  cssClass="error" /></small> 
          </div>
        </div>
      

        </td>

      
       <!-- Education Field -->

       <td class="col-sm-12 col-lg-6">
          <div class="form-group ">
         
          <div class="col-md-12">
            <form:input type="text" class="form-control " path="education" id="educationid"  placeholder="Education" min="2" maxlength="40" onblur="onblureducation();"/>
         <small id="educationerror" style="color: red;"><form:errors path="education"  cssClass="error" /></small> 
          </div>
        </div>


       </td>

</tr>

      <tr>
         <!--  specialization Field -->
        <td class="col-sm-12 col-lg-6">
          <div class="form-group ">
         
          <div class="col-md-12">
            <form:input type="text" class="form-control " path="specialization" id="specializationid"  placeholder="specialization" min="3" maxlength="40"  onblur="onblurspecialization();"/>
          <small id="specializationerror" style="color: red;"><form:errors path="specialization"  cssClass="error" /></small>
          </div>
        </div>


       </td>

         <!--   course Field -->
        <td class="col-sm-12 col-lg-6">
          <div class="form-group has-feedback">

          
          <div class="col-md-12">

              <form:select class="form-control  " path="course" id="courseid"  onblur="onblurcourse();">
<form:option value="">Look For The course</form:option>
      <form:option value="bangalore">Corporate H R</form:option>
      <form:option value="bangalore">Corporate Accountant</form:option>
      <form:option value="bangalore">Aptitude Training</form:option>
      <form:option value="bangalore">Soft skills</form:option> 
      <form:option value="bangalore">Campus training</form:option>
    

</form:select>
 <small id="courseerror" style="color: red;"><form:errors path="course"  cssClass="error" /></small>
</div>
        </div>
        </td>



      </tr>
     

     

       <tr>
         <!-- Captch Field   -->
        <td class="col-sm-12 col-lg-6">
          <div class="form-group has-feedback ">
         
          <div class="col-md-12">
           <div class='input-group date' >
            <input type="text" class="form-control"   id="txtCaptcha" name="txt_Captcha"   style=" background-image:url(./images/cpatch.JPG);   -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;    position: relative;  text-align:center; color:black; font-weight:bold; font-family:-webkit-pictograph ">
           <span class="input-group-addon">
                    <span class="glyphicon glyphicon-refresh" onclick="DrawCaptcha();"></span>
                </span>
                </div>
          </div>
        </div>
        </td>
        
     
        
        
        
         <td class="col-sm-12 col-lg-6">
          <div class="form-group ">
         
         <div class="col-md-12">
            <input type="text" class="form-control " name="Captch" id="txtInput"  placeholder="Captch" onblur="onblurcaptch();">
            <small id="captcherror" style="color: red;"></small>
          </div>
        </div>
        </td>
        
   </tr>


    <tr>

         <!-- visit referrer field -->
         <td class="col-sm-12 col-lg-6">
          <div class="form-group has-feedback">

          
          <div class="col-md-12">

              <form:select class="form-control  " path="visitreferrer" id="referenceid"  onblur="onblurreferrnce();">
<form:option value="">Visit Referrer By </form:option>
      <form:option value="bangalore">bangalore123</form:option>
      <form:option value="bangalore">bangalore123</form:option>
      <form:option value="bangalore">bangalore123</form:option>
      <form:option value="bangalore">bangalore123</form:option> 
      <form:option value="bangalore">bangalore123</form:option>
    

</form:select>
 <small id="referenceerorr" style="color: red;"><form:errors path="visitreferrer"  cssClass="error" /></small>
</div>
        </div>
        </td>
        
        
        <td class="col-sm-12 col-lg-6"> 
         <div class="form-group">
          <div class="col-md-12">
        <div class="date dateContainer">
            <div class="input-group input-append date" id="startdate1235">
                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                <form:input type="text" class="form-control" path="Yearofpassedout" id="yearpassedoutid" placeholder="YearOfPassedOut" onchange="onbluryearofpasseout();" />
                 
            </div>
        </div>
        <small id="yearofpassedouterror" style="color: red;"><form:errors path="Yearofpassedout"  cssClass="error" /></small>
        </div>
    </div>
    </td>

 <%-- <td class="col-sm-12 col-lg-6">
          <div class="form-group ">
         
         <div class="col-md-12">
            <form:input type="text" class="form-control " name="Yearofpassedout" path="Yearofpassedout" min="2" maxlength="10"  placeholder="Year Of passed Out" onblur="onbluryearpassedout();"></form:input>
         <small id="yearofpassedouterror"><form:errors path="Yearofpassedout" cssClass="error"></form:errors></small>
          </div>
        </div>
        </td> --%>


      </tr>

      


     

       


      
    </tbody>
  </table>
   

   
    <div class="form-group">
        <!-- The message container for captcha -->
        <div class="col-xs-8 col-xs-offset-3" id="captchaMessage">
        </div>
    </div>

  </div>  <!--  COL-SM-9 COL-LG-9-->  

  <div class="col-sm-3 col-lg-3">
             <div class="form-group ">
       
          <div class="col-md-12">
              <div class="photo">
<label style=>Upload Photo</label><!-- upload photo  -->
<div class="photo1">
   <img id="blah" src=""    style=" width: 148px;
   height: 148px; "alt="your image"/>
   </div>
   <input type="file" name="file" onchange="readURL(this);" style="" class="fullwidth input rqd"/>
</div>
<div class="space"></div>

</div>
</div>

         </div> 


 
   
        

        <!-- Submit button -->
   
  <!--  <div class="col-sm-12 col-lg-12">
     <div class="form-group">
        <div class="col-md-4  col-md-offset-8">
               <button type="submit" class="btn btn-success">submit</button>
               </div>
                </div>
   </div> -->
        <div class="col-sm-12 col-lg-12">
    <div class="form-group">
                  <div class="input-group-addon">
                  <button type="submit"    class="btn btn-success pull-right" >Submit</button>
                  </div>
                </div>
                </div>

</form:form>
</div>
</div>
</div><!--  END ROW ============ -->
</div> <!-- COL-MD-8 ============ -->


 <div class="col-md-2"></div>


</div><!--  Container ============ -->


</section>







<!-- <script type="text/javascript" src="js/bootstrap-fileupload.js"></script> -->


<script type="text/javascript" src="${pageContext.request.contextPath}/jss/jquery.min.js"></script>



    <script type='text/javascript' src="${pageContext.request.contextPath}/jss/formValidation.min.js"></script>

 <script type='text/javascript' src="${pageContext.request.contextPath}/jss/bootstrap.min.js"></script>

    <script type='text/javascript' src="${pageContext.request.contextPath}/jss/bootstrap-datepicker.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/registration.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
<script type='text/javascript' src="${pageContext.request.contextPath}/jss/jquery.geocomplete.min.js"></script>
 <script type="text/javascript">
/*  $("#submit").on("click", function(){
alert();
	   var bootstrapValidator = $("#startdate123").data('bootstrapValidator');
	   bootstrapValidator.validate();
	  var iop= $('#emailexisterror').text();
	  alert();
	   if(bootstrapValidator.isValid() & iop=="")
	     $("#yourform").submit();
	   else return;

	}); */
$(document).ready(function() {
	
	/* if(asc){
		alert();
	}
	else{
		alert('xx');
		 $('#registrationForm').formValidation('revalidateField', 'email');
	} */
	
  $('#startdate123')
      .datepicker({
          format: 'dd/mm/yyyy'
      })
       $('#startdate1235')
      .datepicker({
          format: 'dd/mm/yyyy'
      })
    
 
});
</script>



  <script type="text/javascript">

function DrawCaptcha()
{
 /*    var a = Math.ceil(Math.random() * 10)+ ''; */
    var b =Math.random().toString(36).replace(/[^a-z]+/g, '').substr(0, 1)+ '';
/*     var  c= Math.ceil(Math.random() * 10)+ '';  */      
    var  d= Math.ceil(Math.random() * 10)+ '';  
    var  e=Math.random().toString(36).replace(/[^a-z]+/g, '').substr(0, 1)+ '';
/*     var  f= Math.ceil(Math.random() * 10)+ '';  
    var  g= Math.ceil(Math.random() * 10)+ '';  
    var  h= Math.ceil(Math.random() * 10)+ ''; */  
    var  i= Math.ceil(Math.random() * 10)+ '';  
    var  j=Math.random().toString(36).replace(/[^a-z]+/g, '').substr(0, 1)+ '';
    var code =  b+d+e+i+j;
    document.getElementById("txtCaptcha").value = code;
}


// Validate the Entered input aganist the generated security code function   
function ValidCaptcha(){
    var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
    var str2 = removeSpaces(document.getElementById('txtInput').value);
    if (str1 == str2) return true;  
    else{ 
    return false;
   
    }
    
}

// Remove the spaces from the entered and generated code
function removeSpaces(string)
{
    return string.split(' ').join('');
}

</script>
<script>
function readURL(input) {

       if (input.files && input.files[0]) {
           var reader = new FileReader();

           reader.onload = function (e) {
               $('#blah')
                   .attr('src', e.target.result)
                   .width(148)
                   .height(148);
           };
           reader.readAsDataURL(input.files[0]);
       }
   }
</script>

<script type="text/javascript">
$(document).ready(function(){
	
	 $('#firstnameid,#lastnameid,#genderid,#dobid,#emailid,#altemailid,#mobileid,#altmobleid,#permanentaddressid,#location,#setting_city,#setting_country,#setting_state,#pincodeid,#collegeid,#educationid,#specializationid,#courseid,#txtInput,#referenceid,#yearpassedoutid').val('');
	
	
});
</script>

<script>
$(function () {	
	$("#location").geocomplete({
	  details: ".geo-details",
	  detailsAttribute: "data-geo"
	});

});
</script>
</body>
</html>
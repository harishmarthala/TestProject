




function submitenquiryform() {
	if(submitform()=='sucess'){
		//alert();
		return true;
		
		/*var search = {"firstName" : document.studentenquiry.firstName.value,"lastName" : document.studentenquiry.lastName.value,
					"gender" : document.studentenquiry.gender.value,"dob" : document.studentenquiry.dob.value,
					"email" : document.studentenquiry.email.value,"alternate_email" : document.studentenquiry.alternate_email.value,
					"mobile" : document.studentenquiry.mobile.value,"alternate_mobile" : document.studentenquiry.alternate_mobile.value,
					"address" : document.studentenquiry.address.value,"district" : document.studentenquiry.district.value,
					"state" : document.studentenquiry.state.value,"pincode" : document.studentenquiry.pincode.value,
					"college" : document.studentenquiry.college.value,"education" : document.studentenquiry.education.value,
					"specialization" : document.studentenquiry.specialization.value,"responsemail" : document.studentenquiry.course.value,
					"visitreferrer" : document.studentenquiry.visitreferrer.value,"Yearofpassedout" : document.studentenquiry.Yearofpassedout.value};

		var myJsonStringsearch = JSON.stringify(search);

		$.ajax({
		type : "POST",
		url : "registraionofstudent",
		contentType : "application/json",
		async : false,
		cache : false,
		data : myJsonStringsearch,
		dataType : 'json',
		success : function(response) {
			
			alert();
		},
		});*/
		
	}
	else{
		return false;
	}
}











function submitform() {
	 var valid=true;
	
	 $("#firstNameerror").text("");
		var main1=/^([a-zA-Z]+\s)*[a-zA-Z]+$/;
		if (document.studentenquiry.firstName.value == undefined || document.studentenquiry.firstName.value.trim() == '') {
			$("#firstNameerror").text("Please Enter your Firstname");
			valid=false;
		}
		else if(!document.studentenquiry.firstName.value.match(main1)){
			
			$("#firstNameerror").text('The First Name can allowes only character or space between two words');
			valid=false;
			}
		else if(document.studentenquiry.firstName.min>document.studentenquiry.firstName.value.length) {
			$("#firstNameerror").text('The First Name  should  be  between 2 to 25 characters long');
			valid=false;
		}
		//end fn
		$("#lastNameerror").text("");
		var main1=/^([a-zA-Z]+\s)*[a-zA-Z]+$/;
		
		if(!document.studentenquiry.lastName.value.trim() == ''){
		if (document.studentenquiry.lastName.value == undefined || document.studentenquiry.lastName.value.trim() == '') {
			$("#lastNameerror").text("Please Enter your Firstname");
			valid=false;
			
		}
		else if(!document.studentenquiry.lastName.value.match(main1)){
		
			$("#lastNameerror").text('The Last Name can allowes only character or space between two words');
			valid=false;
			}
		else if(document.studentenquiry.lastName.min>document.studentenquiry.lastName.value.length) {
			$("#lastNameerror").text('The lastName  should  be  between 2 to 25 characters long');
			valid=false;
		}
		}
		//end ln
		$("#gendererror").text("");
		if (document.studentenquiry.gender.value == undefined || document.studentenquiry.gender.value.trim() == '') {
			$("#gendererror").text("The gender  is required");
			valid=false;
		}
		//end gend
		$("#doberror").text("");
		if (document.studentenquiry.dob.value == undefined || document.studentenquiry.dob.value.trim() == '') {
			$("#doberror").text("The date is required");
			valid=false;
		}
		//end do
		$("#emailerror").text("");
		var validate_char = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
		if(document.studentenquiry.email.value == undefined || document.studentenquiry.email.value.trim() == ''){
			$("#emailerror").text("The email address is required and cannot be empty");
			valid=false;
		}
	else if(document.studentenquiry.email.min>document.studentenquiry.email.value.length) {
			
			$("#emailerror").text("The email  should  be  between 6 to 50 characters long");
			valid=false;
		}
		else if (!document.studentenquiry.email.value.match(validate_char)) {
			$("#emailerror").text("Please Enter Valid Email ID");
			valid=false;
		}
		
		else if(!document.studentenquiry.email.value.trim() ==''){
		var res=null;
		var search = {"email" : $("#emailid").val(),"responsemail" : res};

			var myJsonStringsearch = JSON.stringify(search);

			$.ajax({
			type : "POST",
			url : "emailexistornot",
			contentType : "application/json",
			async : false,
			cache : false,
			data : myJsonStringsearch,
			dataType : 'json',
			success : function(response) {
				
				
				
				if(response.responsemail==true){
					
					$("#emailerror").text("Your email is already exist");
					valid=false;
					
				}
			},
			});
		}
			//end emaill
			$("#alternateemailerrorr").text("");
			var validate_char = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
			if(!document.studentenquiry.alternate_email.value.trim() == ''){
			if(document.studentenquiry.alternate_email.value == undefined || document.studentenquiry.alternate_email.value.trim() == ''){
				$("#alternateemailerrorr").text("The Alternate_Email address is required and cannot be empty");
				valid=false;
			}
		else if(document.studentenquiry.alternate_email.min>document.studentenquiry.alternate_email.value.length) {
				
				$("#alternateemailerrorr").text("The Alternate_Email  should  be  between 6 to 50 characters long");
				valid=false;
			}
			else if (!document.studentenquiry.alternate_email.value.match(validate_char)) {
				$("#alternateemailerrorr").text("Please Enter Valid Alternate_Email ID");
				valid=false;
				
			}
			}
			//end al_emai
			var validate_char = /^\d{10}$/;
			$("#mobileerror").text("");
				if (document.studentenquiry.mobile.value.trim() == undefined || document.studentenquiry.mobile.value.trim() == '') {
					$("#mobileerror").text("The field is required and cannot be empty");
					valid=false;
				}
				else if(!document.studentenquiry.mobile.value.match(validate_char)){
					$("#mobileerror").text("The Mobile Number can only consist of 10 Digits only");
					valid=false;
					
				}
				//end mobile
				var validate_char = /^\d{10}$/;
				if(!document.studentenquiry.alternate_mobile.value.trim() == ''){
				if(!document.studentenquiry.alternate_mobile.value.match(validate_char)){
					$("#alt_mobileerror").text("The Mobile Number can only consist of 10 Digits only");
					valid=false;
					
				}
				}
				//end altmobile
				$("#adresserror").text("");
				if (document.studentenquiry.permanentaddress.value == undefined || document.studentenquiry.permanentaddress.value.trim() == '') {
					$("#adresserror").text("The permanentaddress is required");
					valid=false;
				}
				else if(5>document.studentenquiry.permanentaddress.value.length) {
					
					$("#adresserror").text('The permanentaddress  should  be  between 5 to 50 characters long');
					valid=false;
				}
				//end addresss
				$("#distrciterror").text("");
				if (document.studentenquiry.district.value == undefined || document.studentenquiry.district.value.trim() == '') {
					$("#distrciterror").text("The district is required");
					valid=false;
				}
				//end dist
				$("#stateerror").text("");
				if (document.studentenquiry.state.value == undefined || document.studentenquiry.state.value.trim() == '') {
					$("#stateerror").text("The state is required");
					valid=false;
				}
				//end stata
				$("#pincodeerror").text("");
				var validate_char1 = /^\d{6}$/;
				if (document.studentenquiry.pincode.value == undefined || document.studentenquiry.pincode.value.trim() == '') {
					$("#pincodeerror").text("The pincode is required");
					valid=false;
				}
				else if (!document.studentenquiry.pincode.value.match(validate_char1)) {
					$("#pincodeerror").text("The Pincode must be 6 Digits only");
					valid=false;
				}
				//end pin
				$("#collegenameerror").text("");
				if (document.studentenquiry.college.value == undefined || document.studentenquiry.college.value.trim() == '') {
					$("#collegenameerror").text("The college Field is required");
					valid=false;
				}
				else if(document.studentenquiry.college.min>document.studentenquiry.college.value.length) {
					$("#collegenameerror").text('The Field  must be  between 3 to 40 characters long');
					valid=false;
				}
				//end college
				
				$("#educationerror").text("");
				if (document.studentenquiry.education.value == undefined || document.studentenquiry.education.value.trim() == '') {
					$("#educationerror").text("The  education Field is required");
					valid=false;
					
				}
				else if(document.studentenquiry.education.min>document.studentenquiry.education.value.length) {
					$("#educationerror").text('The Field  must be  between 2 to 40 characters long');
					valid=false;
				}
				
				//end edu
				$("#specializationerror").text("");
				if (document.studentenquiry.specialization.value == undefined || document.studentenquiry.specialization.value.trim() == '') {
					$("#specializationerror").text("The specialization Field is required");
					valid=false;
				}
				else if(document.studentenquiry.specialization.min>document.studentenquiry.specialization.value.length) {
					$("#specializationerror").text('The Field  must be  between 3 to 40 characters long');
					valid=false;
				}
				//end spec
				$("#courseerror").text("");
				if (document.studentenquiry.course.value == undefined || document.studentenquiry.course.value.trim() == '') {
					$("#courseerror").text("Select your course");
					valid=false;
				}
				//end course
				$("#captcherror").text("");
				var i=	$("#txtInput").val();
				var i1=	$("#txtCaptcha").val();
				if(i!=i1){
					$("#captcherror").text("captcha are not matching");
					valid=false;
				}
				//end captcha
				$("#referenceerorr").text("");
				if (document.studentenquiry.visitreferrer.value == undefined || document.studentenquiry.visitreferrer.value.trim() == '') {
					$("#referenceerorr").text("select your Referrer");
					valid=false;
				}
				//end ref
				$("#yearofpassedouterror").text("");
				if (document.studentenquiry.Yearofpassedout.value == undefined || document.studentenquiry.Yearofpassedout.value.trim() == '') {
					$("#yearofpassedouterror").text("The Yearofpassedout Field is required");
					valid=false;
				}
				else if(document.studentenquiry.Yearofpassedout.min>document.studentenquiry.Yearofpassedout.value.length) {
					$("#yearofpassedouterror").text('The Field  must be  between 3 to 40 characters long');
					valid=false;
				}
				//end year
				
				$("#locationerror").text("");
				if (document.studentenquiry.location.value == undefined || document.studentenquiry.location.value.trim() == '') {
					$("#locationerror").text("The location is required");
					valid=false;
				}
				//end location
				$("#countryerror").text("");
				if (document.studentenquiry.country.value == undefined || document.studentenquiry.country.value.trim() == '') {
					$("#countryerror").text("The country is required");
					
				}
				//end country
				if(valid)
					return 'sucess';
				else
					return 'fail';
}





 
 
 
 
 
 
//firstname
function onblurfirstname(){
	$("#firstNameerror").text("");
	var main1=/^([a-zA-Z]+\s)*[a-zA-Z]+$/;
	if (document.studentenquiry.firstName.value == undefined || document.studentenquiry.firstName.value.trim() == '') {
		$("#firstNameerror").text("Please Enter your Firstname");
	
	}
	else if(!document.studentenquiry.firstName.value.match(main1)){
		
		$("#firstNameerror").text('The First Name can allowes only character or space between two words');
		}
	else if(document.studentenquiry.firstName.min>document.studentenquiry.firstName.value.length) {
		$("#firstNameerror").text('The First Name  should  be  between 2 to 25 characters long');
	}
	
}
//end firstname
//last name
function onblurlastname(){
	$("#lastNameerror").text("");
	var main1=/^([a-zA-Z]+\s)*[a-zA-Z]+$/;
	
	if(!document.studentenquiry.lastName.value.trim() == ''){
	if (document.studentenquiry.lastName.value == undefined || document.studentenquiry.lastName.value.trim() == '') {
		$("#lastNameerror").text("Please Enter your Firstname");
		
	}
	else if(!document.studentenquiry.lastName.value.match(main1)){
	
		$("#lastNameerror").text('The Last Name can allowes only character or space between two words');
		}
	else if(document.studentenquiry.lastName.min>document.studentenquiry.lastName.value.length) {
		$("#lastNameerror").text('The lastName  should  be  between 2 to 25 characters long');
	}
	}
}
function onblurgender() {
	$("#gendererror").text("");
	if (document.studentenquiry.gender.value == undefined || document.studentenquiry.gender.value.trim() == '') {
		$("#gendererror").text("The gender  is required");
		
	}
}
function onblurdob(){
	
	$("#doberror").text("");
	if (document.studentenquiry.dob.value == undefined || document.studentenquiry.dob.value.trim() == '') {
		$("#doberror").text("The date is required");
		
	}
	
}	
	
function onbluremail() {
	
	$("#emailerror").text("");
	var validate_char = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	if(document.studentenquiry.email.value == undefined || document.studentenquiry.email.value.trim() == ''){
		$("#emailerror").text("The email address is required and cannot be empty");
	}
else if(document.studentenquiry.email.min>document.studentenquiry.email.value.length) {
		
		$("#emailerror").text("The email  should  be  between 6 to 50 characters long");
	}
	else if (!document.studentenquiry.email.value.match(validate_char)) {
		$("#emailerror").text("Please Enter Valid Email ID");
		
	}
	var res=null;
	var search = {"email" : $("#emailid").val(),"responsemail" : res};

		var myJsonStringsearch = JSON.stringify(search);

		$.ajax({
		type : "POST",
		url : "emailexistornot",
		contentType : "application/json",
		async : false,
		cache : false,
		data : myJsonStringsearch,
		dataType : 'json',
		success : function(response) {
			
			
			
			if(response.responsemail==true){
				
				$("#emailerror").text("Your email is already exist");
				
				
			}
		},
		});
	
}
function onbluralteremai() {
	$("#alternateemailerrorr").text("");
	var validate_char = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	if(!document.studentenquiry.alternate_email.value.trim() == ''){
	if(document.studentenquiry.alternate_email.value == undefined || document.studentenquiry.alternate_email.value.trim() == ''){
		$("#alternateemailerrorr").text("The Alternate_Email address is required and cannot be empty");
	}
else if(document.studentenquiry.alternate_email.min>document.studentenquiry.alternate_email.value.length) {
		
		$("#alternateemailerrorr").text("The Alternate_Email  should  be  between 6 to 50 characters long");
	}
	else if (!document.studentenquiry.alternate_email.value.match(validate_char)) {
		$("#alternateemailerrorr").text("Please Enter Valid Alternate_Email ID");
		
	}
	}
}
function onblurmobile() {
	var validate_char = /^\d{10}$/;
	$("#mobileerror").text("");
		if (document.studentenquiry.mobile.value.trim() == undefined || document.studentenquiry.mobile.value.trim() == '') {
			$("#mobileerror").text("The field is required and cannot be empty");
		}
		else if(!document.studentenquiry.mobile.value.match(validate_char)){
			$("#mobileerror").text("The Mobile Number can only consist of 10 Digits only");
			
		}
}
function onbluralternatemobile() {
	var validate_char = /^\d{10}$/;
	if(!document.studentenquiry.alternate_mobile.value.trim() == ''){
	if(!document.studentenquiry.alternate_mobile.value.match(validate_char)){
		$("#alt_mobileerror").text("The Mobile Number can only consist of 10 Digits only");
		
	}
	}
}
function onbluradress() {
	$("#adresserror").text("");
	if (document.studentenquiry.permanentaddress.value == undefined || document.studentenquiry.permanentaddress.value.trim() == '') {
		$("#adresserror").text("The permanentaddress is required");
	}
	else if(5>document.studentenquiry.permanentaddress.value.length) {
		
		$("#adresserror").text('The permanentaddress  should  be  between 5 to 50 characters long');
	}

}
function onblurdistrict() {
	$("#distrciterror").text("");
	if (document.studentenquiry.district.value == undefined || document.studentenquiry.district.value.trim() == '') {
		$("#distrciterror").text("The district is required");
		
	}
}

function onblurlocation() {
	$("#locationerror").text("");
	if (document.studentenquiry.location.value == undefined || document.studentenquiry.location.value.trim() == '') {
		$("#locationerror").text("The location is required");
		
	}
}
function onblurstate() {
	$("#stateerror").text("");
	if (document.studentenquiry.state.value == undefined || document.studentenquiry.state.value.trim() == '') {
		$("#stateerror").text("The state is required");
		
	}
}

function onblurcountry() {
	$("#countryerror").text("");
	if (document.studentenquiry.country.value == undefined || document.studentenquiry.country.value.trim() == '') {
		$("#countryerror").text("The country is required");
		
	}
}
function onblurpincode() {
	$("#pincodeerror").text("");
	var validate_char1 = /^\d{6}$/;
	if (document.studentenquiry.pincode.value == undefined || document.studentenquiry.pincode.value.trim() == '') {
		$("#pincodeerror").text("The pincode is required");
		
	}
	else if (!document.studentenquiry.pincode.value.match(validate_char1)) {
		$("#pincodeerror").text("The Pincode must be 6 Digits only");
	}
}
function onblurcollegename() {
	$("#collegenameerror").text("");
	if (document.studentenquiry.college.value == undefined || document.studentenquiry.college.value.trim() == '') {
		$("#collegenameerror").text("The college Field is required");
		
	}
	else if(document.studentenquiry.college.min>document.studentenquiry.college.value.length) {
		$("#collegenameerror").text('The Field  must be  between 3 to 40 characters long');
	}
}
function onblureducation() {
	$("#educationerror").text("");
	if (document.studentenquiry.education.value == undefined || document.studentenquiry.education.value.trim() == '') {
		$("#educationerror").text("The  education Field is required");
		
	}
	else if(document.studentenquiry.education.min>document.studentenquiry.education.value.length) {
		$("#educationerror").text('The Field  must be  between 2 to 40 characters long');
	}
	
}
function onblurspecialization() {
	$("#specializationerror").text("");
	if (document.studentenquiry.specialization.value == undefined || document.studentenquiry.specialization.value.trim() == '') {
		$("#specializationerror").text("The specialization Field is required");
		
	}
	else if(document.studentenquiry.specialization.min>document.studentenquiry.specialization.value.length) {
		$("#specializationerror").text('The Field  must be  between 3 to 40 characters long');
	}
}
function onblurcourse() {
	$("#courseerror").text("");
	if (document.studentenquiry.course.value == undefined || document.studentenquiry.course.value.trim() == '') {
		$("#courseerror").text("Select your course");
		
	}
}
function onblurcaptch() {
	$("#captcherror").text("");
var i=	$("#txtInput").val();
var i1=	$("#txtCaptcha").val();
if(i!=i1){
	$("#captcherror").text("captcha are not matching");
}
} 
function onblurreferrnce() {
	$("#referenceerorr").text("");
	if (document.studentenquiry.visitreferrer.value == undefined || document.studentenquiry.visitreferrer.value.trim() == '') {
		$("#referenceerorr").text("select your Referrer");
		
	}
}
function onbluryearofpasseout() {
	$("#yearofpassedouterror").text("");
	if (document.studentenquiry.Yearofpassedout.value == undefined || document.studentenquiry.Yearofpassedout.value.trim() == '') {
		$("#yearofpassedouterror").text("The Yearofpassedout Field is required");
		
	}
	else if(document.studentenquiry.Yearofpassedout.min>document.studentenquiry.Yearofpassedout.value.length) {
		$("#yearofpassedouterror").text('The Field  must be  between 3 to 40 characters long');
	}
}
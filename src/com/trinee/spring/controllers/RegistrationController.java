package com.trinee.spring.controllers;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
/* ************************************************************************************************************************** 
 * ControllerName:FarmerController
 * Method:
 * Autowired Classes:
 * LoggerFile:
 * Annotations:@Autowired,@Controller,	@RequestMapping,@ModelAttribute,@ResponseBody,@RequestBody
 * Creation of class Date:18-02-16
 * class Created by:M.Harish
 * class Modified Date:26-02-16
 * Pojo classes:Registration,FromDateToDate,EmailExistOrNot,Reports
 * Service Classes:
 * Technologies:java1.7,Html5,css3,javascript,jquery1.12,ajax,json,spring4.1,hibernate4.3.8,Mysql5.6
 * *************************************************************************************************************************** */
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.trinee.spring.model.Course;
import com.trinee.spring.model.CoursePaymentDetails;
import com.trinee.spring.model.EmailExistOrNot;
import com.trinee.spring.model.FromDateToDate;
import com.trinee.spring.model.RegisteredStudents;
import com.trinee.spring.model.Registration;
import com.trinee.spring.model.Reports;
import com.trinee.spring.model.StudentRegistration;
import com.trinee.spring.service.RegistrationService;



@Controller
public class RegistrationController {

	@Autowired
	private  RegistrationService registration;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@RequestMapping(value = {"/"}, method = RequestMethod.GET)             
	public String displaySignUpPage(Model model,Registration registraion) { 
		model.addAttribute("registraion",registraion );
	logger.info("login");
		return "registrationpage";                                 //display page.
	}
	@RequestMapping(value = {"/registeredandnonregistered"}, method = RequestMethod.GET)             
	public String registerdnonregistered(Model model,Registration registraion) { 
		model.addAttribute("registraion",registraion );
	logger.info("login");
		return "rigistorandnonregistor";                                 //display page.
	}
	@RequestMapping(value = {"/registraionofstudent"}, method = RequestMethod.POST)             
	public String signupregistration(@ModelAttribute("registraion") @Validated Registration registraion,BindingResult bindingResult,Model model,@RequestParam("file") MultipartFile file,HttpSession session) throws IOException, ParseException { 
		
		
	
		int insertedrows=0;
		System.out.println("asdsada");
		  List<FieldError> errors = bindingResult.getFieldErrors();
		    for (FieldError error : errors ) {
		    	logger.info("sdsd", bindingResult.getAllErrors());
				//System.out.println("asds0ada");
		        //System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
		    }
		if (bindingResult.hasErrors()) {
			
			return "registrationpage";
		}
		System.out.println("asdsada1");
	 insertedrows=	registration.saveStudent(registraion,file);
	if(insertedrows!=0){
	session.setAttribute("outstudent", "Enquiry form is submited kindly go through your registerd  mail");
	}	
	logger.info("::::::::::::::::::::::::::::::::::::::");
	return "emptyj";                                 //display page.
	}
	@RequestMapping(value = {"/fromdateandtodateurl"}, method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<Registration> fromdateandtodate123(@RequestBody FromDateToDate fromDateToDate)throws Exception      //declare method displayNodeValuesPage
	{ 
		List<Registration> bole=registration.fromdateandtodate(fromDateToDate) ; 
		return bole;
	}
	@RequestMapping(value = {"/filterliststudents"}, method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<Registration> fromdateandtodate1231(@RequestBody Reports reports,HttpSession session)throws Exception      //declare method displayNodeValuesPage
	{
		List<Registration> bole1=registration.listofstudents(reports) ; 
		System.out.println("studentlist"+bole1);
		return bole1;
	}
	@RequestMapping(value = {"/emailexistornot"}, method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody EmailExistOrNot emailcheker(@RequestBody EmailExistOrNot emailExistOrNot)throws Exception      //declare method displayNodeValuesPage
	{
		Boolean bole=registration.checkFarmerExist(emailExistOrNot) ; 
		emailExistOrNot.setResponsemail(bole);
		return emailExistOrNot;
	}
	@RequestMapping(value = {"/listofstudentview"}, method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody int listofstudents(@RequestBody Reports reports,HttpSession session)throws Exception      //declare method displayNodeValuesPage
	{
		Registration bole= registration.listviewofstudents(reports) ; 
		
		session.setAttribute("student", bole);
		List<Course> coursetable=registration.getCourseTable();
		session.setAttribute("coursetable", coursetable);
		
		return 0;
	}
	@RequestMapping(value = {"/selectedcourseandpayment"}, method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody int selectedcourseandpayment(@RequestBody CoursePaymentDetails coursePaymentDetails,StudentRegistration studentRegistration,HttpSession session)throws Exception      //declare method displayNodeValuesPage
	{
		registration.selectedcourseandpaymentandaddress(coursePaymentDetails);
	StudentRegistration i=	registration.setcourseandinstallment(coursePaymentDetails, studentRegistration);
System.out.println(":::::::::::::::::"+i.getStudentregistration_id()  +   i.getEnquiry_id());	
	session.setAttribute("printstatment", i);
	
	logger.info("xsadasdasdsad");
		return 1;
	}
	
	@RequestMapping(value = {"/registerdstudents"}, method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<StudentRegistration> registerdstudents1(@RequestBody RegisteredStudents RegisterStudentsId12)      //declare method displayNodeValuesPage
	{
		System.out.println("::::"+RegisterStudentsId12.getRegidstudets());
		List<StudentRegistration> bole12=registration.registerdstudents2(RegisterStudentsId12) ; 
		System.out.println("studentlist"+bole12);
		return bole12;
	}
	@RequestMapping(value = {"/studentregisteredinbetweendays"}, method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<StudentRegistration> Studentsregistereddates(@RequestBody FromDateToDate fromDateToDate)throws Exception      //declare method displayNodeValuesPage
	{ 
		List<StudentRegistration> bole=registration.studentrigistereddates(fromDateToDate) ; 
		return bole;
	}
}

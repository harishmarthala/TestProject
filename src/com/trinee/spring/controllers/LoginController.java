package com.trinee.spring.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
/* ************************************************************************************************************************** 
 * ControllerName:LoginController  commit 5
 * Method:
 * Autowired Classes: No
 * LoggerFile:Yes
 * Annotations:@controller,@requestmapping,@
 * Creation of class Date:16-02-16
 * class Created by:M.Harish
 * class Modified Date:26-02-16
 * Pojo classes:
 * Service Classes:
 * * Technologies:java1.7,Html5,css3,javascript,jquery1.12,ajax,json,spring4.1,hibernate4.3.8,Mysql5.6
 * *************************************************************************************************************************** */
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {

	
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@RequestMapping(value = {"/12uuisdfuysd3"}, method = RequestMethod.GET)             
	public String displaySignUpPage(Model model) {  //this method for diplaying a receptionviewpage
	logger.info("login");

		return "receptionistview";                                 //display page.
	}
	
	
	@RequestMapping(value = {"/hom"}, method = RequestMethod.GET)             
	public String displaySignUpPage1(Model model) { //this method for diplaying a registerall
	//logger.info("login");
		//Declaring method for display signup page
		return "registerall";                                 //display page.
	}
	@RequestMapping(value = {"/tot"}, method = RequestMethod.GET)             
	public String displaySignUpPsdfage121(Model model) { //this method for diplaying a totalinformation
	//logger.info("login");
		//Declaring method for display signup page
		return "totalinformation";                                 //display page.
	}
}

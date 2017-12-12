package com.trinee.spring.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.trinee.spring.dao.RegistrationDAO;
import com.trinee.spring.model.Course;
import com.trinee.spring.model.CoursePaymentDetails;
import com.trinee.spring.model.EmailExistOrNot;
import com.trinee.spring.model.FromDateToDate;
import com.trinee.spring.model.RegisteredStudents;
import com.trinee.spring.model.Registration;
import com.trinee.spring.model.Reports;
import com.trinee.spring.model.StudentRegistration;

@Service("farmerService")
public class RegistrationService {

	@Autowired
	private RegistrationDAO registrationDAO;
	public int saveStudent(Registration registraion, MultipartFile file) throws IOException, ParseException {
		// TODO Auto-generated method stub
		
		return registrationDAO.saveStudent(registraion,file);
	}
	public boolean checkFarmerExist(EmailExistOrNot emailExistOrNot) {             //method for farmer is already register or not
		return registrationDAO.checkFarmerExist(emailExistOrNot);               // return to farmerDAO.
	}
	public List<Registration> fromdateandtodate(FromDateToDate fromDateToDate) {
		return registrationDAO.fromdateandtodate(fromDateToDate);
	}
	public Registration listviewofstudents(Reports reports) {
		// TODO Auto-generated method stub
		return registrationDAO.listviewofstudents(reports) ;
	}
	public List<Registration> listofstudents(Reports reports) {
		// TODO Auto-generated method stub
		return registrationDAO.listofstudents(reports);
	}
	public List<Course> getCourseTable() {
		// TODO Auto-generated method stub
		return registrationDAO.getCourseTable();
	}
	public int selectedcourseandpaymentandaddress(CoursePaymentDetails coursePaymentDetails) {
		// TODO Auto-generated method stub
		
		return registrationDAO.selectedcourseandpaymentandaddress(coursePaymentDetails);
	}
	public StudentRegistration setcourseandinstallment(CoursePaymentDetails coursePaymentDetails,StudentRegistration studentRegistration) {
		// TODO Auto-generated method stub
		return registrationDAO.setcourseandinstallment(coursePaymentDetails, studentRegistration);
	}
	public List<StudentRegistration> registerdstudents2(
			RegisteredStudents getRegisterStudentsId) {
		// TODO Auto-generated method stub
		return registrationDAO.registerdstudents2(getRegisterStudentsId);
	}
	public List<StudentRegistration> studentrigistereddates(
			FromDateToDate fromDateToDate) {
		// TODO Auto-generated method stub
		return registrationDAO.studentrigistereddates(fromDateToDate);
	}	
	
	
	
}

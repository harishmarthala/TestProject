package com.trinee.spring.dao;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.trinee.spring.model.Course;
import com.trinee.spring.model.CoursePaymentDetails;
import com.trinee.spring.model.EmailExistOrNot;
import com.trinee.spring.model.FromDateToDate;
import com.trinee.spring.model.RegisteredStudents;
import com.trinee.spring.model.Registration;
import com.trinee.spring.model.Reports;
import com.trinee.spring.model.StudentRegistration;


@Component
public class RegistrationDAO extends BaseDAO {

	@Autowired
	private JavaMailSender mailSender;
	public int saveStudent(Registration registraion, MultipartFile file) throws IOException, ParseException {
		   
		
		
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date setDate = new java.sql.Date(utilDate.getTime());
	registraion.setEnquirydate(setDate);
	
	 Session session=getSession();
	 session.beginTransaction();
	int insertedrows =  (Integer) session.save(registraion);
		 session.getTransaction().commit();
		 if(insertedrows!=0){
				InputStream inputStream = null;
				OutputStream outputStream = null;
				if (file.getSize() > 0) {
					inputStream = file.getInputStream();
					outputStream = new FileOutputStream("D:/asadsworkspace/TrineeFor3-03-16/WebContent/resources/profileimages/"+registraion.getEnquiry_id()+".jpg");
					int readBytes = 0;
					byte[] buffer = new byte[8192];
					while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1) {
						outputStream.write(buffer, 0, readBytes);
						}
					outputStream.close();
					inputStream.close();
				}
			}
		 final String emailTo1 =registraion.getEmail(); 
		// final String subject1 = ("Your Coustomer_id is"+registraion.);
		 final String message1 =("Welcome To Trinee Institute");
			
			
			// prints debug info
			System.out.println("To: " + emailTo1);
			//System.out.println("Subject: " + subject1);
			System.out.println("Message: " + message1);
			
			// creates a simple e-mail object
			SimpleMailMessage email = new SimpleMailMessage();
			email.setTo(emailTo1);
			//email.setSubject(subject1);
			email.setText(message1);
			
			// sends the e-mail
			mailSender.send(email);
session.clear();
		 session.close();
		return insertedrows;
	 
	}
	public boolean checkFarmerExist(EmailExistOrNot emailExistOrNot) {                   //method for save farmer data to db and MultipartFile is used to insert image.
		System.out.println("In cheker DAO class");
		try {
			Session session = getSession();
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Registration.class);         //creating criteria class for farmer
			criteria.add(Restrictions.eq("email", emailExistOrNot.getEmail()));        //getting email value of farmer from db.
			List<Registration> farmers = criteria.list();                           //make criteria list of farmer 

			if( farmers != null && farmers.size() > 0 ) {                     //check condition
				return true;
			}

			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error occured while saving farmer data");
		}
		return false;
	}
	@SuppressWarnings("unchecked")
	public List<Registration> fromdateandtodate(FromDateToDate fromDateToDate) {
		List<Registration> results=null; 
		try {
			Session session = getSession();                            
			session.beginTransaction();
			
			
			
			
			
		/*	String testDate = fromDateToDate.getFromdate();
			DateFormat formatter = new SimpleDateFormat("dd/mm/yyyy");*/
			/*Date date = formatter.parse(testDate);*/
			 SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		        Date parsed = format.parse(fromDateToDate.getFromdate());
		        java.sql.Date sql = new java.sql.Date(parsed.getTime());
			//System.out.println(sql);
			
			 SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy");
		        Date parsed1 = format1.parse(fromDateToDate.getTodate());
		        java.sql.Date sql1 = new java.sql.Date(parsed1.getTime());
			//System.out.println(sql1);
			//HQL Query for getting sensor_date and sensor_time from Siri_SensorValue_DB.
			Query query = session.createQuery("FROM Registration AS s WHERE  s.enquirydate BETWEEN :ondate AND :offdate");       //getting all values of Siri_GateValve  from db.
			//set values to query through parameters.                            
		
			query.setParameter("ondate",sql);
			query.setParameter("offdate",sql1);
	
		results=	 query.list();                                        //executed data is stored in a variable.
			session.getTransaction().commit();
			session.close();
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error occurred while getting graph Siri_farm data");
		}
		return results;
	}
	public Registration listviewofstudents(Reports reports) {
		try {
			Session session = getSession();
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Registration.class);         //creating criteria class for farmer
			criteria.add(Restrictions.eq("enquiry_id", reports.getEnquiry_id()));        //getting email value of farmer from db.
			Registration student = (Registration) criteria.uniqueResult();                           //make criteria list of farmer 
			
			if( student != null) {                     //check condition
				return student;
			}

			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error occured while saving farmer data");
		}
		
		
		// TODO Auto-generated method stub
		return null;
	}
	public List<Registration> listofstudents(Reports reports) {
		try {
			Session session = getSession();
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Registration.class);         //creating criteria class for farmer
			criteria.add(Restrictions.eq("enquiry_id", reports.getEnquiry_id()));        //getting email value of farmer from db.
			List<Registration> student = criteria.list();                           //make criteria list of farmer 

			if( student != null && student.size() > 0 ) {                     //check condition
				return student;
			}
System.out.println("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error occured while saving farmer data");
		}
		// TODO Auto-generated method stub
		return null;
	}
	public List<Course> getCourseTable() {
		// TODO Auto-generated method stub
		List<Course> coursetable=null;
		try {
			Session session = getSession();
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Course.class);         //creating criteria class for farmer
			 coursetable = criteria.list();                           //make criteria list of farmer 

			
			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error occured while saving farmer data");
		}
		return coursetable;
	}
	public int selectedcourseandpaymentandaddress(CoursePaymentDetails coursePaymentDetails) {
		// TODO Auto-generated method stub
		Session session = getSession();                         //creating session
		session.beginTransaction();                             //begin transaction for the session.
		Query query = session.createQuery("UPDATE Registration set selectidproof =:selectidproof,proofidnumber =:proofidnumber,temporaryaddress =:temporaryaddress WHERE enquiry_id =:enquiry_id"); 
		query.setParameter("selectidproof",coursePaymentDetails.getTypeofidproof());
		query.setParameter("proofidnumber",coursePaymentDetails.getProofidnum());
		query.setParameter("temporaryaddress",coursePaymentDetails.getTemporaryadress());
		query.setParameter("enquiry_id",coursePaymentDetails.getEnquiryid());
				query.executeUpdate();
				
		// System.out.println("studentupdated values are ::::::::::::::::::"+studentupdated);
		session.getTransaction().commit();                            //here transaction complete with commit the data in db. 
		session.close();                                     
		return 0;
	}
	public StudentRegistration setcourseandinstallment(CoursePaymentDetails coursePaymentDetails,StudentRegistration studentRegistration) {
		// TODO Auto-generated method stub
		Session session = getSession();                         //creating session
		session.beginTransaction();
		studentRegistration.setCourse_cost(coursePaymentDetails.getTotalfee());//course cost
		studentRegistration.setCourse_cost_balance(coursePaymentDetails.getRemainingamount());//course cost balance
		studentRegistration.setCourse_cost_paid(coursePaymentDetails.getPaidamount());//course cost paid
		studentRegistration.setCoursename(coursePaymentDetails.getCoursename());//course name
		studentRegistration.setEnquiry_id(coursePaymentDetails.getEnquiryid());//enquiry id
		studentRegistration.setStudentregistration_id("Reg_Student_"+coursePaymentDetails.getEnquiryid());//student regisration id
		studentRegistration.setRegistrationfee(coursePaymentDetails.getPaidamount());//registration fee
		
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date setDate = new java.sql.Date(utilDate.getTime());
		
		studentRegistration.setRegistrationfeedate(setDate);
		Criteria criteria = session.createCriteria(Registration.class);         //creating criteria class for farmer
		criteria.add(Restrictions.eq("enquiry_id", coursePaymentDetails.getEnquiryid()));        //getting email value of farmer from db.
		Registration student = (Registration) criteria.uniqueResult();                        
		
		
		
		studentRegistration.setStudentemail(student.getEmail());//student mail
		studentRegistration.setStudentmobile(student.getMobile());//student mobile
		studentRegistration.setStudentname(student.getFirstName()+" "+student.getLastName());//student name
		studentRegistration.setFivthinstallmentfee("0");
		studentRegistration.setFivthinstallmentfeedate(setDate);
		studentRegistration.setFourthinstallmentfee("0");
		studentRegistration.setFourthinstallmentfeedate(setDate);
		studentRegistration.setNinththinstallmentfee("0");
		studentRegistration.setNinththinstallmentfeedate(setDate);
		studentRegistration.setSecondinstallmentfee("0");
		studentRegistration.setSecondinstallmentfeedate(setDate);
		studentRegistration.setSeventhinstallmentfee("0");
		studentRegistration.setSeventhinstallmentfeedate(setDate);
		studentRegistration.setSixthinstallmentfee("0");
		studentRegistration.setSixthinstallmentfeedate(setDate);
		studentRegistration.setThreedinstallmentfee("0");
		studentRegistration.setThreedinstallmentfeedate(setDate);
		int i= (Integer) session.save(studentRegistration);
		session.getTransaction().commit();                            //here transaction complete with commit the data in db. 
		session.close(); 
		System.out.println(i);
		//Criteria criteria=session.createCriteria(StudentRegistration.class);
		//cri
		
		
		return studentRegistration;
	}
	public List<StudentRegistration> registerdstudents2(
			RegisteredStudents getRegisterStudentsId) {
	try{
		Session session = getSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(StudentRegistration.class);         //creating criteria class for farmer
		criteria.add(Restrictions.eq("studentregistration_id", getRegisterStudentsId.getRegidstudets()));        //getting email value of farmer from db.
		List<StudentRegistration> students = criteria.list();                           //make criteria list of farmer 

		if( students != null && students.size() > 0 ) { 
			System.out.println("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
			//check condition
			return students;
		}

		session.getTransaction().commit();
		session.close();
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("Error occured while getting registerdstudents data");
	}
		
		
		
		// TODO Auto-generated method stub
		return null;
	}
	public List<StudentRegistration> studentrigistereddates(
			FromDateToDate fromDateToDate) {
		// TODO Auto-generated method stub
		List<StudentRegistration> results=null; 
		try {
			Session session = getSession();                            
			session.beginTransaction();
		
			 SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		        Date parsed = format.parse(fromDateToDate.getFromdate());
		        java.sql.Date sql = new java.sql.Date(parsed.getTime());
			 SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy");
		        Date parsed1 = format1.parse(fromDateToDate.getTodate());
		        java.sql.Date sql1 = new java.sql.Date(parsed1.getTime());
			//HQL Query for getting sensor_date and sensor_time from Siri_SensorValue_DB.
			Query query = session.createQuery("FROM StudentRegistration AS s WHERE  s.registrationfeedate BETWEEN :ondate AND :offdate");       //getting all values of Siri_GateValve  from db.
			//set values to query through parameters.                            
		
			query.setParameter("ondate",sql);
			query.setParameter("offdate",sql1);
	
		results=	 query.list();                                        //executed data is stored in a variable.
			session.getTransaction().commit();
			session.close();
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error occurred while getting graph Siri_farm data");
		}
		return results;

	}

}

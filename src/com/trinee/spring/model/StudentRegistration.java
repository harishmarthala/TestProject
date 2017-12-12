package com.trinee.spring.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="STUDENTREGISTRATION")
public class StudentRegistration {
  
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="ID")
	private int id;
	
	@Column(name="ENQUIRY_ID")
	private int enquiry_id;
	@Column(name="STUDENTREGISTRATION_ID")
    private String studentregistration_id;
	
	@Column(name="STUDENTNAME")
	private String Studentname;
	
	@Column(name="STUDENTEMAIL")
	private String Studentemail;
	
	@Column(name="STUDENTMOBILE")
	private String Studentmobile;
	
	
	
	
	@Column(name="COURSENAME")
	private String coursename;
	
	

	
	@Column(name="COURSE_COST")
	private String course_cost;
	@Column(name="COURSE_COST_PAID")
	private String course_cost_paid;
	@Column(name="COURSE_COST_BALANCE")
	private String course_cost_balance;
	
	@Column(name="REGISTRATIONFEE")
	private String registrationfee;
	
	@Column(name="REGISTRATIONFEEDATE")
	private Date registrationfeedate;
	
	@Column(name="SECONDINSTALLMENTFEE")
	private String secondinstallmentfee;
	
	@Column(name="SECONDINSTALLMENTFEEDATE")
	private Date secondinstallmentfeedate;
	
	@Column(name="THREEDINSTALLMENTFEE")
	private String threedinstallmentfee;
	
	@Column(name="THREEDINSTALLMENTFEEDATE")
	private Date threedinstallmentfeedate;
	
	@Column(name="FOURTHINSTALLMENTFEE")
	private String fourthinstallmentfee;
	
	@Column(name="FOURTHINSTALLMENTFEEDATE")
	private Date fourthinstallmentfeedate;
	
	@Column(name="FIVTHINSTALLMENTFEE")
	private String fivthinstallmentfee;
	
	@Column(name="FIVTHINSTALLMENTFEEDATE")
	private Date fivthinstallmentfeedate;
	
	@Column(name="SIXTHINSTALLMENTFEE")
	private String sixthinstallmentfee;
	
	@Column(name="SIXTHINSTALLMENTFEEDATE")
	private Date sixthinstallmentfeedate;
	
	@Column(name="SEVENTHINSTALLMENTFEE")
	private String seventhinstallmentfee;
	
	@Column(name="SEVENTHINSTALLMENTFEEDATE")
	private Date seventhinstallmentfeedate;
	
	@Column(name="NINTHTHINSTALLMENTFEE")
	private String ninththinstallmentfee;
	
	@Column(name="NINTHTHINSTALLMENTFEEDATE")
	private Date ninththinstallmentfeedate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEnquiry_id() {
		return enquiry_id;
	}

	public void setEnquiry_id(int enquiry_id) {
		this.enquiry_id = enquiry_id;
	}

	public String getStudentregistration_id() {
		return studentregistration_id;
	}

	public void setStudentregistration_id(String studentregistration_id) {
		this.studentregistration_id = studentregistration_id;
	}

	public String getStudentname() {
		return Studentname;
	}

	public void setStudentname(String studentname) {
		Studentname = studentname;
	}

	public String getStudentemail() {
		return Studentemail;
	}

	public void setStudentemail(String studentemail) {
		Studentemail = studentemail;
	}

	public String getStudentmobile() {
		return Studentmobile;
	}

	public void setStudentmobile(String studentmobile) {
		Studentmobile = studentmobile;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getCourse_cost() {
		return course_cost;
	}

	public void setCourse_cost(String course_cost) {
		this.course_cost = course_cost;
	}

	public String getCourse_cost_paid() {
		return course_cost_paid;
	}

	public void setCourse_cost_paid(String course_cost_paid) {
		this.course_cost_paid = course_cost_paid;
	}

	public String getCourse_cost_balance() {
		return course_cost_balance;
	}

	public void setCourse_cost_balance(String course_cost_balance) {
		this.course_cost_balance = course_cost_balance;
	}

	public String getRegistrationfee() {
		return registrationfee;
	}

	public void setRegistrationfee(String registrationfee) {
		this.registrationfee = registrationfee;
	}

	public Date getRegistrationfeedate() {
		return registrationfeedate;
	}

	public void setRegistrationfeedate(Date registrationfeedate) {
		this.registrationfeedate = registrationfeedate;
	}

	public String getSecondinstallmentfee() {
		return secondinstallmentfee;
	}

	public void setSecondinstallmentfee(String secondinstallmentfee) {
		this.secondinstallmentfee = secondinstallmentfee;
	}

	public Date getSecondinstallmentfeedate() {
		return secondinstallmentfeedate;
	}

	public void setSecondinstallmentfeedate(Date secondinstallmentfeedate) {
		this.secondinstallmentfeedate = secondinstallmentfeedate;
	}

	public String getThreedinstallmentfee() {
		return threedinstallmentfee;
	}

	public void setThreedinstallmentfee(String threedinstallmentfee) {
		this.threedinstallmentfee = threedinstallmentfee;
	}

	public Date getThreedinstallmentfeedate() {
		return threedinstallmentfeedate;
	}

	public void setThreedinstallmentfeedate(Date threedinstallmentfeedate) {
		this.threedinstallmentfeedate = threedinstallmentfeedate;
	}

	public String getFourthinstallmentfee() {
		return fourthinstallmentfee;
	}

	public void setFourthinstallmentfee(String fourthinstallmentfee) {
		this.fourthinstallmentfee = fourthinstallmentfee;
	}

	public Date getFourthinstallmentfeedate() {
		return fourthinstallmentfeedate;
	}

	public void setFourthinstallmentfeedate(Date fourthinstallmentfeedate) {
		this.fourthinstallmentfeedate = fourthinstallmentfeedate;
	}

	public String getFivthinstallmentfee() {
		return fivthinstallmentfee;
	}

	public void setFivthinstallmentfee(String fivthinstallmentfee) {
		this.fivthinstallmentfee = fivthinstallmentfee;
	}

	public Date getFivthinstallmentfeedate() {
		return fivthinstallmentfeedate;
	}

	public void setFivthinstallmentfeedate(Date fivthinstallmentfeedate) {
		this.fivthinstallmentfeedate = fivthinstallmentfeedate;
	}

	public String getSixthinstallmentfee() {
		return sixthinstallmentfee;
	}

	public void setSixthinstallmentfee(String sixthinstallmentfee) {
		this.sixthinstallmentfee = sixthinstallmentfee;
	}

	public Date getSixthinstallmentfeedate() {
		return sixthinstallmentfeedate;
	}

	public void setSixthinstallmentfeedate(Date sixthinstallmentfeedate) {
		this.sixthinstallmentfeedate = sixthinstallmentfeedate;
	}

	public String getSeventhinstallmentfee() {
		return seventhinstallmentfee;
	}

	public void setSeventhinstallmentfee(String seventhinstallmentfee) {
		this.seventhinstallmentfee = seventhinstallmentfee;
	}

	public Date getSeventhinstallmentfeedate() {
		return seventhinstallmentfeedate;
	}

	public void setSeventhinstallmentfeedate(Date seventhinstallmentfeedate) {
		this.seventhinstallmentfeedate = seventhinstallmentfeedate;
	}

	public String getNinththinstallmentfee() {
		return ninththinstallmentfee;
	}

	public void setNinththinstallmentfee(String ninththinstallmentfee) {
		this.ninththinstallmentfee = ninththinstallmentfee;
	}

	public Date getNinththinstallmentfeedate() {
		return ninththinstallmentfeedate;
	}

	public void setNinththinstallmentfeedate(Date ninththinstallmentfeedate) {
		this.ninththinstallmentfeedate = ninththinstallmentfeedate;
	}

	
	
	
}

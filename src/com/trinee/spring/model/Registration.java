package com.trinee.spring.model;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="REGISTRATION")
public class Registration {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="ENQUIRY_ID")
	private int enquiry_id; 
	
	
	//@NotBlank(message="The first name is required and cannot be empty")
	//@Size(min=2,max=25, message="The First Name  should  be  between 2 to 25 characters long")
	@Column(name = "FIRSTNAME")
	private String firstName;
	
	@Column(name = "LASTNAME")
	private String lastName;
	
	//@NotBlank(message="The gender is required")
	@Column(name = "GENDER")
	private String gender;
	
	//@NotBlank(message="Please Enter Correct DOB")
  
	@Column(name = "DOB")
	private String  dob;
   
  
	@Column(name = "ENQUIRYDATE")
	private java.sql.Date  enquirydate;
  
	
	//@Id
	@Email
//	@NotBlank(message="The email address is required and cannot be empty")
	//@Size(min=6,max=50, message="The email  should  be  between 6 to 50 characters long")
	@Column(name = "EMAIL")
	private String email;
	
	//@Email(message="The email address is not valid")
	@Column(name = "ALTERNATE_EMAIL")
	private String alternate_email;
	
	@Column(name="YEAROFPASSEDOUT")
	private String Yearofpassedout;
	 
//	@NotBlank(message="The field is required and cannot be empty")
	@Column(name = "MOBILE")
	private String mobile;
	
	@Column(name = "ALTERNATE_MOBILE")
	private String alternate_mobile;
	
	//@NotBlank(message="The address is required")
	//@Size(min=5,max=50, message="The address  should  be  between 5 to 50 characters long")
	@Column(name = "PERMANENTADDRESS")
	private String  permanentaddress;
	
	@Column(name = "TEMPORARYADDRESS")
	private String  temporaryaddress;
	
	@Column(name = "SELECTIDPROOF")
	private String  selectidproof;
	
	@Column(name = "PROOFIDNUMBER")
	private String  proofidnumber;
	
	//@NotBlank(message="The district is required")
	@Column(name = "DISTRICT")
	private String district;
	
//	@NotBlank(message="The state is required")
	@Column(name = "STATE")
	private String state;
	
	//@NotBlank(message="The pincode is required")
	//@Size(min=6,max=6,message="The Pincode  must be  6 characters long")
//	@Column(name = "PINCODE")
	private String pincode;
	
	//@NotBlank(message="The id Proof is required")
	//private String selectId;
	
	//@NotBlank(message="The college Field is required")
	//@Size(min=3,max=25,message="The Field  must be  between 3 to 25 characters long")
	@Column(name = "COLLEGE")
	private String college;
	
	//@Size(min=3,max=25,message="The Field  must be  between 3 to 25 characters long")
	//@NotBlank(message="The  education Field is required")
	@Column(name = "EDUCATION")
	private String education;
	
	//@NotBlank(message="The specialization Field is required")
	//@Size(min=3,max=25,message="The Field  must be  between 3 to 25 characters long")
	@Column(name = "SPECIALIZATION")
	private String specialization;
	
	//@NotBlank(message="Select your course")
	@Column(name = "COURSE")
	private String course;
	
//	@NotBlank(message="select your Referrer")
	@Column(name = "VISITREFERRER")
	private String visitreferrer;
	
	@Lob
	@Column(name = "IMAGE")
	private Blob image;
	
	@Column(name="LOCATION")
	private String location;

	@Column(name="COUNTRY")
	private String country;

	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}

	public java.sql.Date getEnquirydate() {
		return enquirydate;
	}
	public void setEnquirydate(java.sql.Date enquirydate) {
		this.enquirydate = enquirydate;
	}
	public String getYearofpassedout() {
		return Yearofpassedout;
	}
	public void setYearofpassedout(String yearofpassedout) {
		Yearofpassedout = yearofpassedout;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAlternate_email() {
		return alternate_email;
	}
	public void setAlternate_email(String alternate_email) {
		this.alternate_email = alternate_email;
	}
	
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAlternate_mobile() {
		return alternate_mobile;
	}
	public void setAlternate_mobile(String alternate_mobile) {
		this.alternate_mobile = alternate_mobile;
	}
	
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getVisitreferrer() {
		return visitreferrer;
	}
	public void setVisitreferrer(String visitreferrer) {
		this.visitreferrer = visitreferrer;
	}

	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	public int getEnquiry_id() {
		return enquiry_id;
	}
	public void setEnquiry_id(int enquiry_id) {
		this.enquiry_id = enquiry_id;
	}
	public String getPermanentaddress() {
		return permanentaddress;
	}
	public void setPermanentaddress(String permanentaddress) {
		this.permanentaddress = permanentaddress;
	}
	public String getTemporaryaddress() {
		return temporaryaddress;
	}
	public void setTemporaryaddress(String temporaryaddress) {
		this.temporaryaddress = temporaryaddress;
	}
	public String getSelectidproof() {
		return selectidproof;
	}
	public void setSelectidproof(String selectidproof) {
		this.selectidproof = selectidproof;
	}
	public String getProofidnumber() {
		return proofidnumber;
	}
	public void setProofidnumber(String proofidnumber) {
		this.proofidnumber = proofidnumber;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	
	

	
	
	
}

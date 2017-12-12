package com.trinee.spring.model;

public class CoursePaymentDetails {

	
	private int enquiryid;
	
	private String typeofidproof;
	private String proofidnum;
	private String temporaryadress;
	private String coursename;
	private String totalfee;
	private String paidamount;
	private String remainingamount;
	public String getTypeofidproof() {
		return typeofidproof;
	}
	public void setTypeofidproof(String typeofidproof) {
		this.typeofidproof = typeofidproof;
	}
	
	public String getProofidnum() {
		return proofidnum;
	}
	public void setProofidnum(String proofidnum) {
		this.proofidnum = proofidnum;
	}
	public String getTemporaryadress() {
		return temporaryadress;
	}
	public void setTemporaryadress(String temporaryadress) {
		this.temporaryadress = temporaryadress;
	}
	
	public String getTotalfee() {
		return totalfee;
	}
	public void setTotalfee(String totalfee) {
		this.totalfee = totalfee;
	}
	public String getRemainingamount() {
		return remainingamount;
	}
	public void setRemainingamount(String remainingamount) {
		this.remainingamount = remainingamount;
	}
	public String getPaidamount() {
		return paidamount;
	}
	public void setPaidamount(String paidamount) {
		this.paidamount = paidamount;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public int getEnquiryid() {
		return enquiryid;
	}
	public void setEnquiryid(int enquiryid) {
		this.enquiryid = enquiryid;
	}
	
	
	
	
	
	
}

package com.trinee.spring.model;

import java.util.Date;

import javax.validation.constraints.Past;

import org.springframework.format.annotation.DateTimeFormat;



public class FromDateToDate {

	@DateTimeFormat(pattern="dd/mm/yyyy")
	@Past
	private String fromdate;
	@DateTimeFormat(pattern="dd/mm/yyyy")
	@Past
	private String todate;
	public String getFromdate() {
		return fromdate;
	}
	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	
	
 	
	
}

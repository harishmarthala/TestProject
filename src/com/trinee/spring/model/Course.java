package com.trinee.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="COURSE")
public class Course {

	@Id
	@Column(name="course_id")
	private int course_id;
 	
	@Column(name="COURSENAME")
	private String coursename;
	
	@Column(name="COURSEDESCRIOTION")
	private String coursedescriotion;
	
	@Column(name="COURSECOST")
	private int coursecost;

	public int getCourse_id() {
		return course_id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getCoursedescriotion() {
		return coursedescriotion;
	}

	public void setCoursedescriotion(String coursedescriotion) {
		this.coursedescriotion = coursedescriotion;
	}

	public int getCoursecost() {
		return coursecost;
	}

	public void setCoursecost(int coursecost) {
		this.coursecost = coursecost;
	}
	
}

package edu.cjc.sms.app.model;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;

@Entity
public class Student {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_seq")
	@SequenceGenerator(name = "user_seq", sequenceName = "user_sequence", initialValue = 1000000000, allocationSize = 1)
	private Long rollNo;
	private String fullName;
	private String email;
	private Integer age;
	private String collegeName;
	private String course;
	private String batchNumber;
	private String batchMode;
	private String feesPaid;
	private Double amount;

	public Double getPayment() {
		return amount;
	}

	public void setPayment(Double amount) {
		this.amount = amount;
	}

	@JsonFormat(pattern = "dd MM yyyy")
	private LocalDate joiningDate;
	@JsonFormat(pattern = "dd MM yyyy")
	private LocalDate completeionDate;

	public Student() {

	}

	public Long getRollNo() {
		return rollNo;
	}

	public void setRollNo(Long rollNo) {
		this.rollNo = rollNo;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getBatchNumber() {
		return batchNumber;
	}

	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}

	public String getBatchMode() {
		return batchMode;
	}

	public void setBatchMode(String batchMode) {
		this.batchMode = batchMode;
	}

	public String getFeesPaid() {
		return feesPaid;
	}

	public void setFeesPaid(String feesPaid) {
		this.feesPaid = feesPaid;
	}

	public LocalDate getJoiningDate() {
		return joiningDate;
	}

	public void setJoiningDate(LocalDate joiningDate) {
		this.joiningDate = joiningDate;
	}

	public LocalDate getCompleteionDate() {
		return completeionDate;
	}

	public void setCompleteionDate(LocalDate completeionDate) {
		this.completeionDate = completeionDate;
	}

}

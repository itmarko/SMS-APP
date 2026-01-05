package edu.cjc.sms.app.dto;

public class BatchModeRequest {
	private Long rollNo;
	private String batchMode;

	public BatchModeRequest() {
	}

	public BatchModeRequest(Long rollNo, String batchMode) {
		super();
		this.rollNo = rollNo;
		this.batchMode = batchMode;
	}

	public Long getRollNo() {
		return rollNo;
	}

	public void setRollNo(Long rollNo) {
		this.rollNo = rollNo;
	}

	public String getBatchMode() {
		return batchMode;
	}

	public void setBatchMode(String batchMode) {
		this.batchMode = batchMode;
	}

}

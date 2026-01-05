package edu.cjc.sms.app.servicei;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import edu.cjc.sms.app.model.Student;

public interface StudentService {

	void saveStudent(Student student);

	public List<Student> getAllStudent();

	Page<Student> getStudents(Pageable pageable, String search, String filterByBatch);

	public void updateBatchMode(Long rollNo, String batchMode);

	public void updateFeesStatus(Long rollNo, String feesPaid);

	public Student getStudentById(Long rollNo);

	public void savePaymentDetails(Long rollNo, Double amount, String mode, String transactionId);

	public void removeStudent(Long rollNo);
}

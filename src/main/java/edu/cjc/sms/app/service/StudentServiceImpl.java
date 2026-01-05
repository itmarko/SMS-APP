package edu.cjc.sms.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.cjc.sms.app.model.Student;
import edu.cjc.sms.app.repository.StudentRepository;
import edu.cjc.sms.app.servicei.StudentService;
import jakarta.persistence.criteria.Predicate;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	public StudentRepository studentRepository;

	@Override
	public void saveStudent(Student student) {

		studentRepository.save(student);
	}

	@Override
	public List<Student> getAllStudent() {

		return studentRepository.findAll();
	}

	@Override
	public Page<Student> getStudents(Pageable pageable, String search, String filterByBatch) {
		return studentRepository.findAll(getSpecification(search, filterByBatch), pageable);

	}

	private Specification<Student> getSpecification(String search, String filterByBatch) {

		return (root, query, criteriaBuilder) -> {

			Predicate searchPredicate = criteriaBuilder.conjunction();

			if (search != null && !search.isEmpty()) {

				String searchPattern = "%" + search.toLowerCase() + "%";

				Predicate globalSearch = criteriaBuilder.or(
						criteriaBuilder.like(criteriaBuilder.lower(root.get("rollNo").as(String.class)), searchPattern),
						criteriaBuilder.like(criteriaBuilder.lower(root.get("fullName")), searchPattern),
						criteriaBuilder.like(criteriaBuilder.lower(root.get("email")), searchPattern),
						criteriaBuilder.like(criteriaBuilder.lower(root.get("collegeName")), searchPattern),
						criteriaBuilder.like(criteriaBuilder.lower(root.get("course")), searchPattern),
						criteriaBuilder.like(criteriaBuilder.lower(root.get("batchNumber")), searchPattern),
						criteriaBuilder.like(criteriaBuilder.lower(root.get("batchMode")), searchPattern));

				searchPredicate = criteriaBuilder.and(searchPredicate, globalSearch);
			}

			if (filterByBatch != null && !filterByBatch.isEmpty()) {
				searchPredicate = criteriaBuilder.and(searchPredicate,
						criteriaBuilder.equal(root.get("batchNumber"), filterByBatch));
			}

			return searchPredicate;
		};
	}

	@Override
	public void updateBatchMode(Long rollNo, String batchMode) {
		Student student = studentRepository.findById(rollNo).orElseThrow();
		student.setBatchMode(batchMode);
		studentRepository.save(student);

	}

	@Override
	@Transactional
	public void updateFeesStatus(Long rollNo, String feesPaid) {
		Student student = studentRepository.findById(rollNo).orElseThrow();
		student.setFeesPaid(feesPaid);
	}

	@Override
	public Student getStudentById(Long rollNo) {
		return studentRepository.findById(rollNo)
				.orElseThrow(() -> new RuntimeException("Student not found with rollNo: " + rollNo));
	}

	@Override
	public void savePaymentDetails(Long rollNo, Double amount, String mode, String transactionId) {

		Student student = studentRepository.findById(rollNo)
				.orElseThrow(() -> new RuntimeException("Student not found with rollNo: " + rollNo));

		// Save payment amount
		student.setPayment(amount);

		// Update fees status
		student.setFeesPaid("YES");

		// Since mode & transactionId are not present in Student entity,
		// they are currently ignored

		studentRepository.save(student);
	}

	@Override
	public void removeStudent(Long rollNo) {
		studentRepository.deleteById(rollNo);
	}

}

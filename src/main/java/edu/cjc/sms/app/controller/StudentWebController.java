package edu.cjc.sms.app.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.cjc.sms.app.dto.BatchModeRequest;
import edu.cjc.sms.app.model.Student;
import edu.cjc.sms.app.servicei.StudentService;

/*
 * This controller is used for JSP Pages 
 * */
@Controller
@RequestMapping("/student")
public class StudentWebController {

	@Autowired
	public StudentService studentService;

	@RequestMapping("/")
	public String preLogin() {
		return "login";
	}

	@RequestMapping("/login")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model) {
		if (username.equals("admin") && password.equals("admin123")) {
			return "adminscreen";
		} else {
			model.addAttribute("login_fail", "Please Enter Currect Username and Password");
			return "login";
		}
	}

	@RequestMapping("/enroll_student")
	public String saveStudent(@ModelAttribute Student student) {
		studentService.saveStudent(student);
		return "adminscreen";
	}

	@RequestMapping("/allStudent")
	public String getAllStudent(Model model) {
		List<Student> students = studentService.getAllStudent();
		for (Student student : students) {
			System.out.println(student.getFullName());
		}
		model.addAttribute("students", students);
		return "adminscreen";
	}

	@RequestMapping("/search")
	public String getStudents(@RequestParam(defaultValue = "0") int pageNumber,
			@RequestParam(defaultValue = "9") int pageSize, @RequestParam(required = false) String search,
			@RequestParam(value = "filterByBatch", required = false) String filterByBatch, Model model) {

		Pageable pageable = PageRequest.of(pageNumber, pageSize);
		Page<Student> studentPage = studentService.getStudents(pageable, search, filterByBatch);
		model.addAttribute("students", studentPage.getContent());
		model.addAttribute("totalPages", studentPage.getTotalPages());
		model.addAttribute("currentPage", pageNumber);
		model.addAttribute("search", search);
		model.addAttribute("filterByBatch", filterByBatch);
		return "adminscreen";
	}

	@RequestMapping("/updateBatchMode")
	@ResponseBody
	public String switchBatchMode(@RequestBody BatchModeRequest req) {
		studentService.updateBatchMode(req.getRollNo(), req.getBatchMode());
		return "ok";
	}

	@RequestMapping("/updateFeesStatus")
	@ResponseBody
	public String updateFeesStatus(@RequestBody Map<String, String> fees) {
		Long rollNo = Long.valueOf(fees.get("rollNo"));
		String feesPaid = fees.get("feesPaid");
		studentService.updateFeesStatus(rollNo, feesPaid);
		return "ok";
	}

	@RequestMapping("/payFeesPage")
	public String payFeesPage(@RequestParam Long rollNo, Model model) {
		Student student = studentService.getStudentById(rollNo);
		model.addAttribute("student", student);
		return "payFees";

	}

	@RequestMapping("/submitPayment")
	public String submitPayment(@RequestParam Long rollNo, @RequestParam Double amount, @RequestParam String mode,
			@RequestParam(required = false) String transactionId) {

		// Update feesPaid to "Paid"
		studentService.updateFeesStatus(rollNo, "Paid");

		// Optionally, save payment details (amount, mode, txnId) to DB
		studentService.savePaymentDetails(rollNo, amount, mode, transactionId);

		// Redirect back to student view page
		return "redirect:/student/search";
	}
	
	@RequestMapping("/remove/{rollNo}")
	@ResponseBody
	public String deleteStudent(@PathVariable Long rollNo) {
		studentService.removeStudent(rollNo);
		return "ok";
	}
}

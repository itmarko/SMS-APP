<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Student Enrollment</title>

<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body
	class="bg-gradient-to-br from-slate-100 via-blue-50 to-indigo-100 min-h-screen">
	<!-- ================= HEADER ================= -->
	<nav
		class="flex justify-between items-center px-6 py-4 bg-white shadow-md">
		<!-- Logo -->
		<div class="flex items-center gap-3">
			<svg width="90" height="40" viewBox="0 0 250 100"
				xmlns="http://www.w3.org/2000/svg">
          <defs>
            <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
              <stop offset="0%" style="stop-color: #ff4e50" />
              <stop offset="100%" style="stop-color: #baa849" />
            </linearGradient>
          </defs>
          <text x="50%" y="50%" font-size="64" font-weight="800"
					text-anchor="middle" alignment-baseline="middle" fill="url(#grad1)">
            CJC
          </text>
        </svg>
			<span class="font-semibold text-gray-700 text-lg">Student
				Portal</span>
		</div>

		<!-- Buttons -->
		<div class="flex gap-3">
			<button onclick="showEnroll()" class="nav-btn">Enroll
				Student</button>
			<button
				onclick="window.location.href='${pageContext.request.contextPath}/student/search'"
				class="nav-btn">View Student</button>

			<a href="/" class="logout-btn">Logout</a>
		</div>
	</nav>

	<!-- ================= ENROLL SECTION ================= -->
	<section id="enroll"
		class="section ${empty students ? 'active-section' : ''} py-8 bg-gradient-to-br from-rose-800 via-pink-400 to-cyan-800">
		<div class="py-12">
			<div
				class="max-w-5xl mx-auto bg-white rounded-2xl shadow-xl border border-slate-200">
				<!-- Form Header -->
				<div
					class="px-6 py-4 bg-gradient-to-r from-blue-50 to-indigo-50 border-b rounded-t-2xl">
					<h2 class="text-2xl font-semibold text-slate-800">Student
						Enrollment</h2>
					<p class="text-sm text-slate-500 mt-1">Enter student
						information below</p>
				</div>

				<!-- Form -->
				<form action="enroll_student" method="post"
					class="px-6 py-6 space-y-5">
					<!-- Row 1 -->
					<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
						<div>
							<label class="label">Full Name</label> <input type="text"
								name="fullName" class="input" placeholder="Enter full name" />
						</div>
						<div>
							<label class="label">Email</label> <input type="email"
								name="email" class="input" placeholder="Enter email" />
						</div>
					</div>

					<!-- Row 2 -->
					<div class="grid grid-cols-1 md:grid-cols-3 gap-6">
						<div>
							<label class="label">Age</label> <input type="number" name="age"
								class="input" />
						</div>
						<div class="md:col-span-2">
							<label class="label">College Name</label> <input type="text"
								name="collegeName" class="input" />
						</div>
					</div>

					<!-- Row 3 -->
					<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
						<div>
							<label class="label">Course</label> <select name="course"
								class="input">
								<option value="">Select Course</option>
								<option>Java</option>
								<option>Python</option>
								<option>Testing</option>
								<option>Web Development</option>
							</select>
						</div>
						<div>
							<label class="label">Batch Mode</label> <select name="batchMode"
								class="input">
								<option value="">Select Mode</option>
								<option>Online</option>
								<option>Offline</option>
							</select>
						</div>
					</div>

					<!-- Row 4 -->
					<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
						<div>
							<label class="label">Batch Number</label> <input type="text"
								name="batchNumber" class="input" />
						</div>
						<div>
							<label class="label">Fees Status</label> <select name="feesPaid"
								class="input">
								<option value="">Select Status</option>
								<option>Paid</option>
								<option>Partial</option>
								<option>Pending</option>
							</select>
						</div>
					</div>

					<!-- Row 5 -->
					<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
						<div>
							<label class="label">Joining Date</label> <input type="date"
								name="joiningDate" class="input" />
						</div>
						<div>
							<label class="label">Completion Date</label> <input type="date"
								name="completeionDate" class="input" />
						</div>
					</div>

					<!-- Submit -->
					<div class="pt-6 border-t text-center">
						<button type="submit" class="submit-btn">Submit Student</button>
					</div>
				</form>
			</div>
		</div>
	</section>

	<!-- ================= VIEW SECTION ================= -->
	<section id="view"
		class="section ${not empty students ? 'active-section' : ''}">
		<div
			class="py-10 bg-gradient-to-br from-slate-100 via-blue-100 to-indigo-200">
			<div
				class="max-w-7xl mx-auto bg-white rounded-xl shadow-lg border border-slate-200">
				<!-- Header -->
				<div
					class="px-6 py-4 border-b bg-slate-50 rounded-t-xl flex justify-between items-center">
					<h2 class="text-xl font-semibold text-slate-800">All Student</h2>

					<!-- Optional Search -->
					<input type="text" id="searchInput" placeholder="Search student..."
						class="border border-slate-300 rounded-md px-3 py-1.5 text-sm"
						onkeyup="search()" />
				</div>

				<!-- Table -->
				<div class="overflow-x-auto">
					<table class="w-full border-collapse text-sm">
						<thead class="bg-slate-100 text-slate-700">
							<tr>
								<th class="th">Roll No</th>
								<th class="th">Full Name</th>
								<th class="th">Email</th>
								<th class="th">Age</th>
								<th class="th">College</th>
								<th class="th">Course</th>
								<th class="th">Batch No</th>
								<th class="th">Batch Mode</th>
								<th class="th">Fees</th>
								<th class="th">Joining</th>
								<th class="th">Completion</th>
								<th class="th">Fees Recieved</th>
								<th class="th">Payment</th>
								<th class="th">Action</th>
							</tr>
						</thead>

						<tbody class="divide-y" id="studentTableBody">
							<c:forEach var="s" items="${students}">
								<tr class="hover:bg-slate-50">
									<td class="td">${s.rollNo}</td>
									<td class="td">${s.fullName}</td>
									<td class="td">${s.email}</td>
									<td class="td">${s.age}</td>
									<td class="td">${s.collegeName}</td>
									<td class="td">${s.course}</td>
									<td class="td">${s.batchNumber}</td>
									<td class="td"><label
										class="relative inline-flex items-center cursor-pointer">
											<input type="checkbox" class="sr-only peer"
											${s.batchMode == 'Online' ? 'checked' : ''}
											onchange="updateBatchMode(${s.rollNo}, this.checked)" />
											<div
												class="w-11 h-6 bg-gray-300 rounded-full peer peer-checked:bg-green-500 after:content-[''] after:absolute after:top-0.5 after:left-0.5 after:bg-white after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:after:translate-x-5"></div>
									</label> <span
										class="ml-2 text-sm font-semibold ${s.batchMode == 'Online' ? 'text-green-600' : 'text-gray-600'}">
											${s.batchMode} </span></td>

									<td class="td"><label
										class="relative inline-flex items-center cursor-pointer">
											<input type="checkbox" class="sr-only peer"
											${s.feesPaid
                        == 'Paid' ? 'checked' : ''}
											onchange="updateFeesStatus(${s.rollNo}, this.checked)" />
											<div
												class="w-11 h-6 bg-red-400 rounded-full peer peer-checked:bg-green-500 after:content-[''] after:absolute after:top-0.5 after:left-0.5 after:bg-white after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:after:translate-x-5"></div>
									</label> <span id="feesText-${s.rollNo}"
										class="ml-2 text-sm font-semibold ${s.feesPaid == 'Paid' ? 'text-green-600' : 'text-red-600'}">
											${s.feesPaid} </span></td>

									<td class="td">${s.joiningDate}</td>
									<td class="td">${s.completeionDate}</td>
									<td class="td">${s.payment}</td>
									<!-- <td class="td">
                      <c:if test="${s.feesPaid == 'Pending'}">
                        <button
                          id="payBtn-${s.rollNo}"
                          onclick="payFees(${s.rollNo})"
                          class="px-4 py-1.5 bg-blue-600 text-white text-sm rounded-md hover:bg-blue-700 transition"
                        >
                          Pay Fees
                        </button>
                      </c:if>

                      <span
                        id="feesText-${s.rollNo}"
                        class="ml-2 text-sm font-semibold ${s.feesPaid == 'Paid' ? 'text-green-600' : 'text-red-600'}"
                      >
                        ${s.feesPaid}
                      </span>
                    </td> -->
									<td class="td"><c:if test="${s.feesPaid == 'Pending'}">
											<a
												href="${pageContext.request.contextPath}/student/payFeesPage?rollNo=${s.rollNo}"
												class="px-4 py-1.5 bg-blue-600 text-white text-sm rounded-md hover:bg-blue-700 transition">
												Pay Fees </a>
										</c:if> <span
										class="${s.feesPaid == 'Paid' ? 'text-green-600' : 'text-red-600'} ml-2 font-semibold text-sm">
											${s.feesPaid} </span></td>

									<td class="td">
										<button class="action-btn edit">Edit</button>
										<button class="action-btn delete"
											onclick="deleteStudent(${s.rollNo}, this)">Delete</button>

										</button>
									</td>
								</tr>
							</c:forEach>

							<!-- EMPTY STATE -->
							<c:if test="${empty students}">
								<tr>
									<td colspan="12" class="text-center py-6 text-gray-400">
										No students found</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<!-- Pagination -->
					<div class="flex justify-center items-center gap-2 py-6">
  <!-- PREV -->
  <c:if test="${currentPage > 0}">
    <a href="${pageContext.request.contextPath}/student/search?pageNumber=${currentPage - 1}&search=${empty search ? '' : search}&filterByBatch=${empty filterByBatch ? '' : filterByBatch}"
       class="px-3 py-1 bg-slate-200 rounded hover:bg-slate-300">
       Prev
    </a>
  </c:if>

  <!-- PAGE NUMBERS -->
  <c:if test="${totalPages > 0}">
    <c:forEach begin="0" end="${totalPages - 1}" var="i">
      <a href="${pageContext.request.contextPath}/student/search?pageNumber=${i}&search=${empty search ? '' : search}&filterByBatch=${empty filterByBatch ? '' : filterByBatch}"
         class="px-3 py-1 rounded ${i == currentPage ? 'bg-blue-600 text-white' : 'bg-slate-200 hover:bg-slate-300'}">
         ${i + 1}
      </a>
    </c:forEach>
  </c:if>

  <!-- NEXT -->
  <c:if test="${currentPage < totalPages - 1}">
    <a href="${pageContext.request.contextPath}/student/search?pageNumber=${currentPage + 1}&search=${empty search ? '' : search}&filterByBatch=${empty filterByBatch ? '' : filterByBatch}"
       class="px-3 py-1 bg-slate-200 rounded hover:bg-slate-300">
       Next
    </a>
  </c:if>
</div>

				</div>
			</div>
		</div>
	</section>

	<!-- ================= STYLES ================= -->
	<style>
.section {
	display: none;
	animation: fadeIn 0.35s ease-in-out;
}

.active-section {
	display: block;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.label {
	font-size: 14px;
	font-weight: 600;
	color: #111827;
	margin-bottom: 6px;
	display: block;
}

.input {
	width: 100%;
	padding: 9px 12px;
	border-radius: 10px;
	border: 1px solid #c7d2fe;
	background: #f8fafc;
	font-size: 14px;
}

.input:focus {
	outline: none;
	border-color: #4f46e5;
	background: #fff;
	box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.15);
}

.nav-btn {
	border: 1px solid #2563eb;
	color: #2563eb;
	padding: 6px 16px;
	border-radius: 6px;
	font-weight: 500;
}

.nav-btn:hover {
	background: #2563eb;
	color: white;
}

.logout-btn {
	border: 1px solid #dc2626;
	color: #dc2626;
	padding: 6px 16px;
	border-radius: 6px;
}

.logout-btn:hover {
	background: #dc2626;
	color: white;
}

.submit-btn {
	background: #2563eb;
	color: white;
	padding: 12px 40px;
	border-radius: 10px;
	font-weight: 600;
}

.submit-btn:hover {
	background: #1d4ed8;
}

.th {
	padding: 10px 12px;
	text-align: left;
	font-weight: 600;
	border-bottom: 1px solid #e5e7eb;
	white-space: nowrap;
}

.td {
	padding: 10px 12px;
	color: #374151;
	white-space: nowrap;
}

.action-btn {
	padding: 4px 10px;
	font-size: 13px;
	border-radius: 6px;
	font-weight: 500;
	margin-right: 6px;
}

.action-btn.edit {
	border: 1px solid #2563eb;
	color: #2563eb;
}

.action-btn.edit:hover {
	background-color: #2563eb;
	color: white;
}

.action-btn.delete {
	border: 1px solid #dc2626;
	color: #dc2626;
}

.action-btn.delete:hover {
	background-color: #dc2626;
	color: white;
}

.page-btn {
	padding: 6px 12px;
	border: 1px solid #c7d2fe;
	border-radius: 6px;
	font-size: 14px;
	color: #2563eb;
	background: white;
}

.page-btn:hover {
	background: #2563eb;
	color: white;
}

.page-btn.active {
	background: #2563eb;
	color: white;
}
</style>

	<!-- ================= SCRIPT ================= -->
	<script>
           function showEnroll() {
             document.getElementById("enroll").classList.add("active-section");
             document.getElementById("view").classList.remove("active-section");
           }

           function showView() {
             document.getElementById("view").classList.add("active-section");
             document.getElementById("enroll").classList.remove("active-section");
           }
           function search() {
             const input = document
               .getElementById("searchInput")
               .value.toLowerCase();
             const rows = document.querySelectorAll("#studentTableBody tr");

             rows.forEach((row) => {
               const text = row.innerText.toLowerCase();
               row.style.display = text.includes(input) ? "" : "none";
             });
           }
           function updateBatchMode(rollNo, isOnline) {
             const mode = isOnline ? "Online" : "Offline";

             fetch("${pageContext.request.contextPath}/student/updateBatchMode", {
               method: "POST",
               headers: {
                 "Content-Type": "application/json",
               },
               body: JSON.stringify({
                 rollNo: rollNo,
                 batchMode: mode,
               }),
             })
               .then((res) => {
                 if (!res.ok) throw new Error("Failed to update");
                 return res.text();
               })
               .then(() => {
                 console.log("Batch mode updated:", mode);
               })
               .then(() => {
                 alert("Batch mode updated successfully ");
                 location.reload();
               })
               .catch(() => {
                 alert("Error updating batch mode");
               });
           }
           function updateFeesStatus(rollNo, isPaid) {
             const status = isPaid ? "Paid" : "Pending";

             fetch("${pageContext.request.contextPath}/student/updateFeesStatus", {
               method: "POST",
               headers: {
                 "Content-Type": "application/json",
               },
               body: JSON.stringify({
                 rollNo: rollNo,
                 feesPaid: status,
               }),
             })
               .then((res) => {
                 if (!res.ok) throw new Error("Failed");
                 return res.text();
               })
               .then(() => {
                 const text = document.getElementById(`feesText-${rollNo}`);
                 text.textContent = status;
                 text.className =
                   "ml-2 text-sm font-semibold " +
                   (status === "Paid" ? "text-green-600" : "text-red-600");
               })
               .catch(() => {
                 alert("Fees update Sucessfull");
                 location.reload(); // revert UI
               });


           }
           var contextPath = '<%=request.getContextPath()%>';
           function deleteStudent(rollNo, btn) {
				    if (!confirm("Are you sure you want to delete this student?")) return;
				
				    fetch(contextPath + "/student/remove/" + rollNo, {
				        method: "DELETE"
				      })
					    .then(res => {
					        if (!res.ok) throw new Error("Delete Failed");
					        btn.closest("tr").remove();
					        alert("Student deleted successfully");
					    })
					    .catch(() => alert("Unable to delete student"));
					}

    </script>

</body>
</html>

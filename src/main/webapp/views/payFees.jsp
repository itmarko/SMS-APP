<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Pay Fees</title>
    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body class="bg-gray-100 min-h-screen p-6">
    <div class="max-w-3xl mx-auto bg-white rounded-xl shadow-lg p-6">
      <h2 class="text-2xl font-bold mb-4">Pay Fees</h2>

      <!-- Student Details -->
      <div class="mb-4">
        <p><strong>Roll No:</strong> ${student.rollNo}</p>
        <p><strong>Name:</strong> ${student.fullName}</p>
        <p><strong>Email:</strong> ${student.email}</p>
        <p><strong>Course:</strong> ${student.course}</p>
        <p><strong>Batch:</strong> ${student.batchNumber}</p>
        <p><strong>Fees Status:</strong> ${student.feesPaid}</p>
      </div>

      <!-- Payment Form -->
      <form
        action="${pageContext.request.contextPath}/student/submitPayment"
        method="post"
        class="space-y-4"
      >
        <input type="hidden" name="rollNo" value="${student.rollNo}" />

        <div>
          <label class="block font-semibold mb-1">Payment Amount</label>
          <input
            type="number"
            name="amount"
            placeholder="Enter amount"
            class="w-full border rounded px-3 py-2"
          />
        </div>

        <div>
          <label class="block font-semibold mb-1">Payment Mode</label>
          <select name="mode" class="w-full border rounded px-3 py-2">
            <option value="Cash">Cash</option>
            <option value="Card">Card</option>
            <option value="Online">Online</option>
          </select>
        </div>

        <div>
          <label class="block font-semibold mb-1"
            >Transaction ID (Optional)</label
          >
          <input
            type="text"
            name="transactionId"
            placeholder="Txn ID"
            class="w-full border rounded px-3 py-2"
          />
        </div>

        <button
          type="submit"
          class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 transition"
        >
          Submit Payment
        </button>
      </form>
    </div>
  </body>
</html>

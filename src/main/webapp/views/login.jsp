<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Page</title>

    <!-- Bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <!-- Tailwind CDN -->
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  </head>

  <body class="bg-light">
    <div
      class="min-h-screen bg-gray-100 py-6 flex flex-col justify-center sm:py-12"
    >
      <div class="relative py-3 sm:max-w-xl sm:mx-auto">
        <div
          class="absolute inset-0 bg-gradient-to-r from-cyan-400 to-sky-500 shadow-2xl transform -skew-y-6 sm:skew-y-0 sm:-rotate-6 sm:rounded-3xl"
        ></div>

        <div
          class="relative px-4 py-10 bg-white shadow-lg sm:rounded-3xl sm:p-14"
        >
          <div class="max-w-md mx-auto">
            <h1 class="text-4xl font-extrabold text-center mb-4">
              <span
                class="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-indigo-500"
              >
                LOG IN
              </span>
            </h1>

            <p class="text-center text-gray-600 text-lg mb-6">
              Welcome back! Please log in to continue.
            </p>

            <!-- Login Form -->
            <form action="login" method="post">
              <div class="space-y-6">
                <!-- Username -->
                <div class="relative">
                  <input
                    type="text"
                    name="username"
                    required
                    class="peer placeholder-transparent h-10 w-full border-b-2 border-gray-300 text-gray-900 focus:outline-none focus:border-rose-600"
                    placeholder="Email Address"
                  />
                  <label
                    class="absolute left-0 -top-3.5 text-gray-600 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-440 peer-placeholder-shown:top-2 transition-all peer-focus:-top-3.5 peer-focus:text-gray-600 peer-focus:text-sm"
                  >
                    Email Address
                  </label>
                </div>

                <!-- Password -->
                <div class="relative">
                  <input
                    type="password"
                    name="password"
                    required
                    class="peer placeholder-transparent h-10 w-full border-b-2 border-gray-300 text-gray-900 focus:outline-none focus:border-rose-600"
                    placeholder="Password"
                  />
                  <label
                    class="absolute left-0 -top-3.5 text-gray-600 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-440 peer-placeholder-shown:top-2 transition-all peer-focus:-top-3.5 peer-focus:text-gray-600 peer-focus:text-sm"
                  >
                    Password
                  </label>
                </div>

                <!-- Error Message -->
                <c:if test="${not empty login_fail}">
                  <p class="text-red-600 text-sm text-center">${login_fail}</p>
                </c:if>

                <!-- Submit Button -->
                <button
                  type="submit"
                  class="w-full py-2 text-white rounded-full bg-gradient-to-br from-teal-500 to-blue-600 hover:from-pink-500 hover:to-orange-500 transition duration-300"
                >
                  Log In
                </button>
              </div>
            </form>

            <!-- Create Account -->
            <div class="text-center text-gray-600 mt-4">
              New User?
              <a
                href="create-user-account.jsp"
                class="text-blue-500 hover:underline"
              >
                Create Account
              </a>
            </div>

            <!-- Social Buttons (UI only) -->
            <!-- <div class="flex justify-center mt-4">
              <button
                class="flex items-center gap-2 bg-white border rounded-lg px-4 py-2 shadow hover:bg-gray-200"
              >
                <img
                  src="https://developers.google.com/identity/images/g-logo.png"
                  width="20"
                />
                Continue with Google
              </button>
            </div> -->

            <!-- <div class="flex justify-center mt-2">
              <button
                class="flex items-center gap-2 bg-white border rounded-lg px-4 py-2 shadow hover:bg-gray-200"
              >
                <img
                  src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg"
                  width="20"
                />
                Continue with Facebook
              </button>
            </div> -->
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Library Management System</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h1>Welcome to the Library Management System</h1>
<div id="welcome-message"></div>
<nav>
<a href="${pageContext.request.contextPath}/book/catalog.jsp">Book Catalog</a>
<a href="${pageContext.request.contextPath}/loan/history.jsp">Loan History</a>
<a href="${pageContext.request.contextPath}/auth/logout.jsp">Logout</a>
</nav>

<script>
  // Check if user is logged in
  const username = localStorage.getItem('username');
  if (!username) {
    window.location.href = "${pageContext.request.contextPath}/auth/login.jsp";
  } else {
    document.getElementById('welcome-message').innerHTML = 
      "<p>Welcome, " + username + "!</p>";
  }
</script>
</body>
</html>
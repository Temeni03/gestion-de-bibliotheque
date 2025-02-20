<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Logout</title>
<script>
  // Clear localStorage and redirect to login
  localStorage.clear();
  window.location.href = "${pageContext.request.contextPath}/auth/login.jsp";
</script>
</head>
<body>
<p>Logging out...</p>
</body>
</html>
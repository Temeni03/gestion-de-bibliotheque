<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Login Form</title>
		<style>
			body {
			    font-family: Arial, sans-serif;
			    display: flex;
			    justify-content: center;
			    align-items: center;
			    min-height: 100vh;
			    margin: 0;
			    background-color: #f5f5f5;
			}

			.login-container {
			    background-color: white;
			    padding: 20px;
			    border-radius: 10px;
			    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
			    width: 300px;
			}
			
			h1 {
			    background:linear-gradient(to right, #1e90ff, #0fccce);
			    color: white;
			    text-align: center;
			    padding: 15px 0;
			    border-radius: 5px 5px 0 0;
			    margin: -20px -20px 20px -20px;
			    font-size: 18px;
			}
			
			.form-group {
			    margin-bottom: 15px;
			}
			
			label {
			    display: block;
			    margin-bottom: 5px;
			    color: #333;
			    font-size: 14px;
			}
			
			input[type="text"],
			input[type="password"] {
			    width: 100%;
			    padding: 8px;
			    border: 1px solid #ddd;
			    border-radius: 4px;
			    font-size: 14px;
			    box-sizing: border-box;
			}
			
			.remember-me {
			    margin: 10px 0;
			    font-size: 12px;
			}
			
			.remember-me input[type="checkbox"] {
			    margin-right: 5px;
			}
			
			.remember-me label {
			    display: inline;
			    margin-right: 10px;
			    color: #333;
			}
			
			.forgot-password {
			    color: #1e90ff; /* Blue color for forgot password link */
			    text-decoration: none;
			}
			
			.forgot-password:hover {
			    text-decoration: underline;
			}
			
			button {
			    width: 100%;
			    padding: 10px;
			    background: linear-gradient(to right, #1e90ff, #0fccce);
			    border: none;
			    border-radius: 25px;
			    color: white;
			    font-size: 16px;
			    cursor: pointer;
			    margin-bottom: 15px;
			}
			
			button:hover {
			    background: linear-gradient(to right, #7d24d1, #a94ac8); /* Keeping the purple gradient hover */
			}
			
			p {
			    text-align: center;
			    font-size: 12px;
			    color: #666;
			}
			
			p a {
			    color: #1e90ff; /* Blue color for signup link */
			    text-decoration: none;
			}
			
			p a:hover {
			    text-decoration: underline;
			}
		</style>
	</head>
	<body>
		<div class="login-container">
	        <h1>Connexion</h1>
	        <form id="login-form" method="post" action="/login">
	            <div class="form-group">
	                <label for="username">Username:</label>
	                <input type="text" id="username" name="username" required>
	            </div>
	            <div class="form-group">
	                <label for="password">Password:</label>
	                <input type="password" id="password" name="password" required>
	            </div>
	            
	            <button type="submit">connexion</button>
	            <p>Vous n'avez pas de compte ? <a href="${pageContext.request.contextPath}/auth/register.jsp">Créer un compte</a></p>
	        </form>
    	</div>
		
		
		<script>
			const loginForm = document.getElementById("login-form");
			loginForm.addEventListener("submit", (e) => {
			  e.preventDefault();
			  console.log('clicked');
			  const username = document.getElementById("username").value;
			  const password = document.getElementById("password").value;
	
			  console.log("Username:", username);
			  console.log("Password:", password);
			  
			  fetch("${pageContext.request.contextPath}/api/users/login/", {
			        method: "POST",
			        headers: {
			            "Content-Type": "application/json",
			        },
			        body: JSON.stringify({ username, password }),
			    })
			        .then((response) => {
			            if (!response.ok) {
			                throw new Error("Network response was not ok");
			            }
			            return response.json();
			        })
			        .then((data) => {
			            if (Object.keys(data).length > 0) {
			                    localStorage.setItem('username', username);
							    localStorage.setItem('password', password); 
							    localStorage.setItem('role', data.role);
							    localStorage.setItem('nom', data.nom);
							    localStorage.setItem('prenom', data.prenom);
			            		window.location.href = "${pageContext.request.contextPath}/index.jsp";
			            } else {
			                alert(data.message);
			            }
			        })
			        .catch((error) => {
			            console.error("Error:", error);
			            alert("Username ou mot de passe incorrecte");
			        });
			});
		</script>
</body>
</html>
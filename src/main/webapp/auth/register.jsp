<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
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

		.register-container {
		    background-color: white;
		    padding: 20px;
		    border-radius: 10px;
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		    width: 300px;
		}
		
		h1 {
		    background: linear-gradient(to right, #1e90ff, #0fccce);
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
		    color: #333; /* Blue color for labels */
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
		    background: linear-gradient(to right, #1e90ff, #0fccce)
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
	<div class="register-container">
        <h1>Créer un compte</h1>
        <form id="register-form" method="post" action="/register">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="nom">Nom:</label>
                <input type="text" id="nom" name="nom" required>
            </div>
            <div class="form-group">
                <label for="prenom">Prenom:</label>
                <input type="text" id="prenom" name="prenom" required>
            </div>
            <div class="form-group">
                <label for="username">Matricule:</label>
                <input type="text" id="matricule" name="matricule" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            
            <button type="submit">Créer un compte</button>
            <p>Vous avez déjà un compte ? <a href="${pageContext.request.contextPath}/auth/login.jsp">connexion</a></p>
        </form>
   	</div>
  	<script>
			const registerForm = document.getElementById("register-form");
			registerForm.addEventListener("submit", (e) => {
			  e.preventDefault();
			  const username = document.getElementById("username").value;
			  const nom = document.getElementById("nom").value;
			  const prenom = document.getElementById("prenom").value;
			  const matricule = document.getElementById("matricule").value;
			  const password = document.getElementById("password").value;
	
			  console.log("Username:", username);
			  console.log("Password:", password);
			  
			  fetch("${pageContext.request.contextPath}/api/users/register/", {
			        method: "POST",
			        headers: {
			            "Content-Type": "application/json",
			        },
			        body: JSON.stringify({ username, nom, prenom, matricule, password }),
			    })
			        .then((response) => {
					    console.log(response);
					    if (response.status == 409) {
							alert("Un utilisateur existe déjà avec cet username");
						}
					    if (response.status == 201) {
					    	alert("Le compte a été créé avec succès");
			            	window.location.href = "${pageContext.request.contextPath}/auth/login.jsp";
						}
			           
			            return response.json();
			        })
			        .then((data) => {
			           
			        })
			        .catch((error) => {
			            console.error("Error:", error);
			           // alert("Il y a un problème, veuillez réessayer"); 
			        });
			});
		</script>
</body>
</html>